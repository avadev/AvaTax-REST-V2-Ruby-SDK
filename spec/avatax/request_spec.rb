require File.expand_path('../../spec_helper', __FILE__)
require 'logger'

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

  describe 'filter credentials from logs' do
    let(:string_io) { StringIO.new }
    let(:logger) { Logger.new(string_io) }

    it 'replaces credentials with a label' do
      # Make 'name:pass' string length a multiple of three so the base64
      # encoded string will not have padding characters '=' at the end.
      @client.username = 'name'
      @client.password = 'pass'

      @client.custom_logger = logger
      response = @client.request(:get, 'path', 'model')

      expect(response.env.request_headers).to include('Authorization' => 'Basic bmFtZTpwYXNz')
      expect(string_io.string).to match(/Authorization: "Basic \[REMOVED\]"/)
    end
  end
end
