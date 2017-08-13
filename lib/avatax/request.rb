require 'hashie'

module AvaTax
  module Request

    def get(path, options={})
      request(:get, path, options)
    end

    def post(path, options={})
      request(:post, path, options)
    end

    def put(path, options={})
      request(:put, path, options)
    end

    def delete(path, options={})
      request(:delete, path, options)
    end

    def request(method, path, options)
      response = connection.send(method) do |request|
        case method
        when :get, :delete
          request.url(URI.encode(path), options)
        when :post, :put
          request.path = URI.encode(path)
          request.headers['Content-Type'] = 'application/json'
          puts "BODY", options.to_json
          request.body = options.to_json unless options.empty?
        end
      end

      ::Hashie::Mash.new response.body
    end

  end
end
