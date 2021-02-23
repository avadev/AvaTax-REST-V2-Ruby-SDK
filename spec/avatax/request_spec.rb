require File.expand_path('../../spec_helper', __FILE__)

describe AvaTax::Request do

  describe ".request" do
    it "should default to a 1200 second timeout" do
      @client.faraday_response = true
      response = @client.request(:get, 'path', 'model')
      expect(response.env.request['timeout']).to eq(1200)
    end

    it "should allow setting a custom timeout" do
      @client.faraday_response = true
      @client.connection_options = {
        request: {
          open_timeout: 5,
          timeout: 10
        }
      }
      response = @client.request(:get, 'path', 'model')
      expect(response.env.request['open_timeout']).to eq(5)
      expect(response.env.request['timeout']).to eq(10)
    end
  end
end
