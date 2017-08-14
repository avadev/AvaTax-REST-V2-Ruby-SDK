require 'faraday_middleware/parse_oj'

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

      Faraday.new(options) do |faraday|
        Oj.default_options = {
          bigdecimal_load: :bigdecimal
        }

        faraday.response :oj, content_type: /\bjson$/
        faraday.basic_auth(username, password)

        if logger
          faraday.response :logger do |logger|
            logger.filter(/(Authorization\:\ \"Basic\ )(\w+)\=/, '\1[REMOVED]')
          end
        end

        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
