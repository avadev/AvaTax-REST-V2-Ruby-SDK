require 'faraday_middleware'

module AvaTax

  module Connection
    private
    AUTHORIZATION_FILTER_REGEX = /(Authorization)([^&]+)/
    REMOVED_LABEL = '\1 [REMOVED]'

    def connection
      client_id = "#{app_name};#{app_version};RubySdk;API_VERSION;#{machine_name}"
      options = {
        :headers =>
          {
           'Accept' => "application/json; charset=utf-8",
           'User-Agent' => user_agent,
           'X-Avalara-Client' => client_id
          },
        :url => endpoint,
        :proxy => proxy
      }.merge(connection_options)

      Faraday.new(options) do |faraday|
        if Gem::Version.new(RUBY_VERSION) > Gem::Version.new('2.2.2') and response_big_decimal_conversion
          Oj.default_options = {
            bigdecimal_load: :bigdecimal
          }
        end
        faraday.request :instrumentation
        faraday.response :json, content_type: /\bjson$/

        # DONE: use the following after upgrading to faraday 2.0
        #   see https://github.com/lostisland/faraday/blob/main/docs/middleware/request/authentication.md
        faraday.request :authorization, :basic, username, password

        default_logger_options = { headers: true, bodies: log_request_and_response_info }
        if logger
          faraday.response :logger, nil, default_logger_options do |logger|
            logger.filter(AUTHORIZATION_FILTER_REGEX, REMOVED_LABEL)
          end
        end

        if custom_logger
          faraday.response :logger, custom_logger, default_logger_options.merge(custom_logger_options) do |logger|
            logger.filter(AUTHORIZATION_FILTER_REGEX, REMOVED_LABEL)
          end
        end

        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
