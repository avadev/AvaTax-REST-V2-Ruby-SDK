require File.expand_path('../../../spec_helper', __FILE__)

describe AvaTax::Client do

  describe ".accounts" do
    it "should return an array of accounts" do
      pending('AvaTax sandbox credentials not set') if ENV['SANDBOX_USERNAME'].to_s.empty?

      accounts = @client.query_accounts
      expect(accounts).to be_a Object
      expect(accounts.dig('value', 0, 'id')).to be_a Integer
    end
  end

end
