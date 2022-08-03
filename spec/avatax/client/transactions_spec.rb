require File.expand_path('../../../spec_helper', __FILE__)

describe AvaTax::Client do

  describe ".transactions" do
    before do
      @base_transaction = {
        type: 'SalesInvoice',
        companyCode: @company_code,
        date: '2017-06-05',
        customerCode: 'ABC',
        addresses: {
          ShipFrom: {
            line1: "123 Main Street",
            city: "Irvine",
            region: "CA",
            country: "US",
            postalCode: "92615"
          },
          ShipTo: {
            line1: "100 Market Street",
            city: "San Francisco",
            region: "CA",
            country: "US",
            postalCode: "94105"
          }
        },
        lines: [{amount: 100}]
      }
    end

    it "should create a transaction" do
      transaction = @client.create_transaction(@base_transaction)
      expect(transaction).to be_a Object
      expect(transaction["id"]).to be_a Integer
      expect(transaction["status"]).to eq "Saved"
    end

    it "should create a committed transaction" do
      transaction = @client.create_transaction(@base_transaction.merge!(commit: true))

      expect(transaction).to be_a Object
      expect(transaction["id"]).to be_a Integer
      expect(transaction["status"]).to eq "Committed"
    end

    it "should uncommit a transaction" do
      create_transaction = @client.create_transaction(@base_transaction.merge!(commit: true))

      uncommit_transaction = @client.uncommit_transaction(@company_code, create_transaction["code"])

      expect(uncommit_transaction).to be_a Object
      expect(uncommit_transaction["id"]).to be_a Integer
      expect(uncommit_transaction["status"]).to eq "Saved"
    end

    it "should void a transaction" do
      create_transaction = @client.create_transaction(@base_transaction)
      void_transaction = @client.void_transaction(@company_code, create_transaction["code"], code: "DocVoided")

      expect(void_transaction).to be_a Object
      expect(void_transaction["id"]).to be_a Integer

      # The API guide specifies that the status should be "DocVoided", however, it is always "Cancelled"
      expect(void_transaction["status"]).to eq "Cancelled"
    end

    it "should unvoid a transaction" do
      create_transaction = @client.create_transaction(@base_transaction)
      void_transaction = @client.void_transaction(@company_code, create_transaction["code"], code: "DocVoided")

      unvoid_transaction = @client.unvoid_transaction(@company_code, create_transaction["code"])

      expect(unvoid_transaction).to be_a Object
      expect(unvoid_transaction["id"]).to be_a Integer
      expect(unvoid_transaction["status"]).to eq "Saved"
    end

  end


  # Test the option of faraday_response, the returned response should be a type of Faraday response rather than Hashie
  describe ".transaction_with_faraday_response" do
    before do
      @client.faraday_response = true
      @base_transaction = {
        type: 'SalesInvoice',
        companyCode: @company_code,
        date: '2017-06-05',
        customerCode: 'ABC',
        addresses: {
          ShipFrom: {
            line1: "123 Main Street",
            city: "Irvine",
            region: "CA",
            country: "US",
            postalCode: "92615"
          },
          ShipTo: {
            line1: "100 Market Street",
            city: "San Francisco",
            region: "CA",
            country: "US",
            postalCode: "94105"
          }
        },
        lines: [{amount: 100}]
      }
    end

    it "should create a transaction and return the faraday response" do
      faraday_trans = @client.create_transaction(@base_transaction)
      expect(faraday_trans).to be_a Object
      expect(faraday_trans["status"]) == 201
      expect(faraday_trans["reason_phrase"]) == "Created"
      expect(faraday_trans["request_headers"]).to be_a Object
      expect(faraday_trans["body"]).to be_a Object
    end
  end
end
