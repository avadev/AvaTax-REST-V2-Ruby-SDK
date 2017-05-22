require 'yaml'
require File.expand_path('../../lib/avatax', __FILE__)

credentials = YAML.load_file(File.expand_path('../credentials.yaml', __FILE__))

AvaTax.configure do |config|
  config.endpoint = credentials['endpoint']
  config.username = credentials['username']
  config.password = credentials['password']
end

@client = AvaTax::Client.new(:logger => true)

puts @client.query_companies
