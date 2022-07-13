require 'faraday'
require File.expand_path('../version', __FILE__)

module AvaTax
  module Configuration

    VALID_OPTIONS_KEYS = [
      :app_name,
      :app_version,
      :machine_name,
      :environment,
      :endpoint,
      :user_agent,
      :username,
      :password,
      :connection_options,
      :logger,
      :custom_logger,
      :custom_logger_options,
      :proxy,
      :faraday_response,
      :response_big_decimal_conversion,
      :client_uid
    ].freeze

    DEFAULT_APP_NAME = nil
    DEFAULT_APP_VERSION = nil
    DEFAULT_MACHINE_NAME = nil
    DEFAULT_ENDPOINT = 'https://rest.avatax.com'
    DEFAULT_USER_AGENT = "AvaTax Ruby Gem #{AvaTax::VERSION}".freeze
    DEFAULT_USERNAME = nil
    DEFAULT_PASSWORD = nil
    DEFAULT_CONNECTION_OPTIONS = {request: {timeout: 1200}} # timeout in seconds
    DEFAULT_LOGGER = false
    DEFAULT_CUSTOM_LOGGER = nil
    DEFAULT_CUSTOM_LOGGER_OPTIONS = {}
    DEFAULT_PROXY = nil
    DEFAULT_FARADAY_RESPONSE = false
    DEFAULT_RESPONSE_BIG_DECIMAL_CONVERSION = false
    DEFAULT_CLIENT_UID = nil

    attr_accessor *VALID_OPTIONS_KEYS

    # Reset config values when extended
    def self.extended(base)
      base.reset
    end

    # Allow configuration options to be set in a block
    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def reset
      self.app_name = DEFAULT_APP_NAME
      self.app_version = DEFAULT_APP_VERSION
      self.machine_name = DEFAULT_MACHINE_NAME
      self.endpoint = DEFAULT_ENDPOINT
      self.user_agent = DEFAULT_USER_AGENT
      self.username = DEFAULT_USERNAME
      self.password = DEFAULT_PASSWORD
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self.logger = DEFAULT_LOGGER
      self.custom_logger = DEFAULT_CUSTOM_LOGGER
      self.custom_logger_options = DEFAULT_CUSTOM_LOGGER_OPTIONS
      self.proxy = DEFAULT_PROXY
      self.faraday_response = DEFAULT_FARADAY_RESPONSE
      self.response_big_decimal_conversion = DEFAULT_RESPONSE_BIG_DECIMAL_CONVERSION
      self.client_uid = DEFAULT_CLIENT_UID
    end

  end
end
