require File.expand_path('../../lib/avatax', __FILE__)
require 'rspec'
require 'yaml'


AvaTax.configure do |config|
  if File.exist?(File.expand_path('../credentials.yaml', __FILE__))
    credentials = YAML.load_file(File.expand_path('../credentials.yaml', __FILE__))
    config.endpoint = credentials['endpoint']
    config.username = credentials['username']
    config.password = credentials['password']
  else
    config.endpoint = 'https://sandbox-rest.avatax.com'
    config.username = ENV['SANDBOX_USERNAME']
    config.password = ENV['SANDBOX_PASSWORD']
  end
end

client = AvaTax::Client.new({ logger: true, log_request_and_response_info: true })
companies = client.query_companies

# Find the first active company manually
active_company = companies["value"].find { |company| company["isActive"] == true }

raise "No active company found" unless active_company

RSpec.configure do |config|
  config.before {
    @client = client
    @company_code = active_company["companyCode"]
  }
end
