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

  end
end
