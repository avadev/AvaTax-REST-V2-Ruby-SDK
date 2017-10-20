require File.expand_path('../../../spec_helper', __FILE__)

describe AvaTax::Client do

  describe ".accounts" do
    it "should return an array of accounts" do
      accounts = @client.query_accounts
      expect(accounts).to be_a Object
      expect(accounts['value'].first['id']).to be_a Integer
    end
  end

end
