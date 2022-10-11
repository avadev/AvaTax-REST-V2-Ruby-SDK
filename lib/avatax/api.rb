require File.expand_path('../connection', __FILE__)
require File.expand_path('../request', __FILE__)
require 'active_support/notifications'
require 'logger'

module AvaTax
  class API

    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize(options={})
      options = AvaTax.options.merge(options)
      default_logger =  Logger.new(STDOUT)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
      ActiveSupport::Notifications.subscribe("request.faraday") do |name, starts, ends, _, env|
        url      = env[:url]
        duration = (ends - starts) * 1000

        if custom_logger
          custom_logger.info "The request to #{url} took #{duration} ms."
        else
          default_logger.info "The request to #{url} took #{duration} ms."
        end
      end
    end

    def config
      conf = {}
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        conf[key] = send key
      end
      conf
    end

    include Connection
    include Request
  end
end
