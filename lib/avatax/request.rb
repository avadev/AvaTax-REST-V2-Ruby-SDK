require 'faraday'
require 'json'

module AvaTax
  module Request

    def get(path, options={})
      request(:get, path, nil, options)
    end

    def post(path, model, options={})
      request(:post, path, model, options)
    end

    def put(path, model, options={})
      request(:put, path, model, options)
    end

    def delete(path, options={})
      request(:delete, path, nil, options)
    end

    def request(method, path, model, options={})
      response = connection.send(method) do |request|
        case method
        when :get, :delete
          request.url("#{URI.encode(path)}?#{URI.encode_www_form(options)}")
        when :post, :put
          request.url("#{URI.encode(path)}?#{URI.encode_www_form(options)}")
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
  end
end
