require File.expand_path('../spec_helper', __FILE__)

describe AvaTax do
  after do
    AvaTax.reset
  end

  context "when delegating to a client" do

     before do
       stub_get("/api/v2/accounts").
         to_return(:body => fixture("accounts.json"), :headers => {:content_type => "application/json; charset=utf-8"})
     end

     it "should get the correct resource" do
       AvaTax.accounts()
       expect(a_get("/api/v2/accounts")).to have_been_made
     end

     it "should return the same results as a client" do
       expect(AvaTax.accounts()).to eq AvaTax::Client.new().accounts()
     end

   end

  describe ".client" do
    it "should be a AvaTax::Client" do
      expect(AvaTax.client).to be_a AvaTax::Client
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      expect(AvaTax.endpoint).to eq AvaTax::Configuration::DEFAULT_ENDPOINT
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
