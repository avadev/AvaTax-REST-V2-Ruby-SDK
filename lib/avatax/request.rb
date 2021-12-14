require 'faraday'
require 'json'
require "erb"


module AvaTax
  module Request

    def get(path, options={}, apiversion="")
      request(:get, path, nil, options, apiversion)
    end

    def post(path, model, options={}, apiversion="")
      request(:post, path, model, options, apiversion)
    end

    def put(path, model, options={}, apiversion="")
      request(:put, path, model, options, apiversion)
    end

    def delete(path, options={}, apiversion="")
      request(:delete, path, nil, options, apiversion)
    end

    def request(method, path, model, options={}, apiversion="")
      response = connection.send(method) do |request|
        request.headers['X-Avalara-Client'] = request.headers['X-Avalara-Client'].gsub("API_VERSION", apiversion)
        case method
        when :get, :delete
          request.url("#{encode_path(path)}?#{URI.encode_www_form(options)}")
        when :post, :put
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
    end

    private

    def encode_path(path)
      path.split('/').map { |part| ERB::Util.url_encode(part) }.join('/')
    end
  end
end