require 'faraday_middleware'

module AvaTax

  module Connection
    private

    def connection
      options = {
        :headers => {'Accept' => "application/json; charset=utf-8", 'User-Agent' => user_agent},
        :url => endpoint,
      }.merge(connection_options)

      c = Faraday::Connection.new(options)
      c.use Faraday::Response::ParseJson
      c.response :logger if logger
      c.use Faraday::Request::UrlEncoded
      c.basic_auth(username, password)

      c
    end
  end
end
