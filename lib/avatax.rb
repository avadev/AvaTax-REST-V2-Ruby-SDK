require File.expand_path('../avatax/configuration', __FILE__)
require File.expand_path('../avatax/api', __FILE__)
require File.expand_path('../avatax/client', __FILE__)

module AvaTax
  extend Configuration

  # Alias for Avatax::Client.new
  #
  # @return [Avatax::Client]
  def self.client(options={})
    AvaTax::Client.new(options)
  end

  # Delegate to AvaTax::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to AvaTax::Client
  def self.respond_to?(method, include_all=false)
    return client.respond_to?(method, include_all) || super
  end

end
