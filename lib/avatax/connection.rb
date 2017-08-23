require 'faraday_middleware'

module AvaTax

  module Connection
    private

    def connection
      client_id = "#{app_name};#{app_version};RubySdk;#{AvaTax::VERSION.dup};#{machine_name}"
      options = {
        :headers =>
          {
           'Accept' => "application/json; charset=utf-8",
           'User-Agent' => user_agent,
           'X-Avalara-Client' => client_id
          },
        :url => endpoint,
        :proxy => proxy,
      }.merge(connection_options)

      c = Faraday::Connection.new(options)
      if logger
        c.response :logger do |logger|
          logger.filter(/(Authorization\:\ \"Basic\ )(\w+)\=/, '\1[REMOVED]')
        end
      end
      c.use Faraday::Request::UrlEncoded
      c.use Faraday::Response::ParseJson
      c.basic_auth(username, password)

      c
    end
  end
end
