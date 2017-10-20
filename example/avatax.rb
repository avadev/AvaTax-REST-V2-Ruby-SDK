require 'yaml'
require File.expand_path('../../lib/avatax', __FILE__)

credentials = YAML.load_file(File.expand_path('../credentials.yaml', __FILE__))

AvaTax.configure do |config|
  begin
    credentials = YAML.load_file(File.expand_path('../credentials.yaml', __FILE__))
    config.endpoint = credentials['endpoint']
    config.username = credentials['username']
    config.password = credentials['password']
  rescue
    config.endpoint = 'https://sandbox-rest.avatax.com'
    config.username = ENV['SANDBOX_USERNAME']
    config.password = ENV['SANDBOX_PASSWORD']
  end
end

@client = AvaTax::Client.new(:logger => true)

#puts @client.query_companies

createTransactionModel = {
  type: 'SalesInvoice',
  companyCode: 'DEFAULT',
  date: '2017-06-05',
  customerCode: 'ABC',
  "addresses": {
    "ShipFrom": {
      "line1": "123 Main Street",
      "city": "Irvine",
      "region": "CA",
      "country": "US",
      "postalCode": "92615"
    },
    "ShipTo": {
      "line1": "100 Market Street",
      "city": "San Francisco",
      "region": "CA",
      "country": "US",
      "postalCode": "94105"
    }
  },
  lines: [{amount: 100}]
}
transaction = @client.create_transaction(createTransactionModel)
puts transaction
