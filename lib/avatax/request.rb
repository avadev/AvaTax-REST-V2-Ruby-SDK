require 'faraday'
require 'json'
require "erb"


module AvaTax
  module Request

    def get(path, options={}, apiversion="", headers=Hash.new)
      request(:get, path, nil, options, apiversion, headers)
    end

    def post(path, model, options={}, apiversion="", headers=Hash.new)
      request(:post, path, model, options, apiversion, headers)
    end

    def put(path, model, options={}, apiversion="", headers=Hash.new)
      request(:put, path, model, options, apiversion, headers)
    end

    def patch(path, model, options={}, apiversion="", headers=Hash.new)
      request(:patch, path, model, options, apiversion, headers)
    end

    def delete(path, options={}, apiversion="", headers=Hash.new)
      request(:delete, path, nil, options, apiversion, headers)
    end

    def request(method, path, model, options={}, apiversion="", headers=Hash.new )
      started_at = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      response = connection.send(method) do |request|
        request.headers['X-Avalara-Client'] = request.headers['X-Avalara-Client'].gsub("API_VERSION", apiversion)
        request.headers=request.headers.merge(headers)  unless headers.empty?
        case method
        when :get, :delete
          request.url("#{encode_path(path)}?#{URI.encode_www_form(options)}")
        when :post, :put, :patch
          request.url("#{encode_path(path)}?#{URI.encode_www_form(options)}")
          request.headers['Content-Type'] = 'application/json'
          request.body = model.to_json unless model.empty?
        end
      end

      if faraday_response
        response
      else
        response.body
      end
    ensure
      log_request_duration(response ? response.env.url : path, started_at)
    end

    private

    def encode_path(path)
      path.split('/').map { |part| ERB::Util.url_encode(part) }.join('/')
    end

    def log_request_duration(url, started_at)
      duration_logger = custom_logger || (logger && default_duration_logger)
      return unless duration_logger

      duration = (Process.clock_gettime(Process::CLOCK_MONOTONIC) - started_at) * 1000
      duration_logger.info "The request to #{url} took #{duration} ms."
    end

    # The default logger in Faraday is configured exactly the same as this one, but we cannot get a reference to it, so we will instantiate our own.
    def default_duration_logger
      @default_duration_logger ||= Logger.new(STDOUT)
    end
  end
end