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

    def delete(path, options={}, apiversion="", headers=Hash.new)
      request(:delete, path, nil, options, apiversion, headers)
    end

    def request(method, path, model, options={}, apiversion="", headers=Hash.new )
      response = connection.send(method) do |request|
        request.headers['X-Avalara-Client'] = request.headers['X-Avalara-Client'].gsub("API_VERSION", apiversion)
        request.headers=request.headers.merge(headers)  unless headers.empty?
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