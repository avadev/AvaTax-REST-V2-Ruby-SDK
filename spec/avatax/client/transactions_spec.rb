require File.expand_path('../../../spec_helper', __FILE__)

describe AvaTax::Client do
  before do
    @client = AvaTax::Client.new()
  end

  describe ".transactions" do
    it "should create a transaction" do
      createTransactionModel = Object.new
      createTransactionModel.type = 'SalesInvoice'
      createTransactionModel.companyCode = 'DEFAULT'
      createTransactionModel.date = '2017-06-15'
      createTransactionModel.customerCode = 'ABC'
      createTransactionModel.addresses = Array.new
      createTransactionModel.addresses[0].SingleLocation = Object.new
      createTransactionModel.addresses[0].SingleLocation.line1 = '2000 Main Street'
      createTransactionModel.addresses[0].SingleLocation.city = 'Irvine'
      createTransactionModel.addresses[0].SingleLocation.region = 'CA'
      createTransactionModel.addresses[0].SingleLocation.country = 'US'
      createTransactionModel.addresses[0].SingleLocation.postalCode = '92614'
      createTransactionModel.lines = Array.new
      createTransactionModel.lines[0].amount = 100
      
      transaction = @client.create_transaction(createTransactionModel, null)
      expect(transaction).to be_a Object
      expect(transaction['code']).to be_a String
      expect(transaction['tax']).to gt 0.0
    end
  end
end
