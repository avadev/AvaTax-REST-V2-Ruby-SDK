require File.expand_path('../spec_helper', __FILE__)
begin
  credentials = YAML.load_file(File.expand_path('../credentials.yaml', __FILE__))
rescue
  credentials = {
    "endpoint" => 'https://sandbox-rest.avatax.com',
    "username" => ENV['SANDBOX_USERNAME'],
    "password" => ENV['SANDBOX_PASSWORD'],
  }
end

describe AvaTax do

  describe ".client" do
    it "should be a AvaTax::Client" do
      expect(AvaTax.client).to be_a AvaTax::Client
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      expect(AvaTax.endpoint).to eq credentials['endpoint']
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      AvaTax.endpoint = 'https://sandbox-rest.avatax.com'
      expect(AvaTax.endpoint).to eq 'https://sandbox-rest.avatax.com'
    end
  end

  describe ".configure" do

    AvaTax::Configuration::VALID_OPTIONS_KEYS.each do |key|

      it "should set the #{key}" do
        AvaTax.configure do |config|
          config.send("#{key}=", key)
          expect(AvaTax.send(key)).to eq key
        end
      end
    end
  end
end
