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
      pending('AvaTax sandbox credentials not set') if ENV['SANDBOX_USERNAME'].to_s.empty?

      transaction = @client.create_transaction(@base_transaction)
      expect(transaction).to be_a Object
      expect(transaction["id"]).to be_a Integer
      expect(transaction["status"]).to eq "Saved"
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
