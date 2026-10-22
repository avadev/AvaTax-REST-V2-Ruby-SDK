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

  describe "request duration logging" do
    it "does not register a notification subscriber per client" do
      expect { 3.times { AvaTax::Client.new } }
        .not_to change { ActiveSupport::Notifications.notifier.listeners_for("request.faraday").size }
    end

    it "logs the duration once per request, only to the client that made it" do
      log = StringIO.new
      other_log = StringIO.new
      client = AvaTax::Client.new(custom_logger: Logger.new(log), custom_logger_options: {})
      AvaTax::Client.new(custom_logger: Logger.new(other_log), custom_logger_options: {})

      client.ping

      expect(log.string.scan(/The request to \S+ took \S+ ms\./).size).to eq(1)
      expect(other_log.string).to be_empty
    end
  end
end
