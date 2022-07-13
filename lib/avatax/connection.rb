require 'faraday_middleware'
require 'faraday_middleware/response_middleware'
require 'faraday_middleware/parse_oj'

module AvaTax
  module Connection
    module FaradayMiddleware
      class ParseOjWithBigDecimal < ::FaradayMiddleware::ResponseMiddleware
        dependency 'oj'

        define_parser do |body|
          Oj.load(body, mode: :compat, bigdecimal_load: :bigdecimal) unless body.strip.empty?
        end
      end
    end

    Faraday::Response.register_middleware oj_with_bigdecimal: FaradayMiddleware::ParseOjWithBigDecimal

    private
    AUTHORIZATION_FILTER_REGEX = /(Authorization\:\ \"Basic\ )(\w+)\=/
    REMOVED_LABEL = '\1[REMOVED]'

    def connection
      client_id = "#{app_name};#{app_version};RubySdk;API_VERSION;#{machine_name}"
      options = {
        :headers =>
          {
           'Accept' => "application/json; charset=utf-8",
           'User-Agent' => user_agent,
           'X-Avalara-Client' => client_id,
           'X-Avalara-UID' => client_uid
          },
        :url => endpoint,
        :proxy => proxy
      }.merge(connection_options)

      Faraday.new(options) do |faraday|
        faraday_response_parser = if Gem::Version.new(RUBY_VERSION) > Gem::Version.new('2.2.2') and response_big_decimal_conversion
                                    :oj_with_bigdecimal
                                  else
                                    :oj
                                  end

        faraday.response faraday_response_parser, content_type: /\bjson$/
        faraday.request :basic_auth, username, password

        # TODO: use the following after upgrading to faraday 2.0
        #   see https://github.com/lostisland/faraday/blob/main/docs/middleware/request/authentication.md
        # faraday.request :authorization, :basic, username, password

        if logger
          faraday.response :logger do |logger|
            logger.filter(AUTHORIZATION_FILTER_REGEX, REMOVED_LABEL)
          end
        end

        if custom_logger
          faraday.response :logger, custom_logger, custom_logger_options do |logger|
            logger.filter(AUTHORIZATION_FILTER_REGEX, REMOVED_LABEL)
          end
        end

        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
