require File.expand_path('../../../spec_helper', __FILE__)

describe AvaTax::Client do
  before do
    @client = AvaTax::Client.new()
  end

  describe ".accounts" do
    before do
      stub_get("/api/v2/accounts").
        to_return(:body => fixture("accounts.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should get the correct resource" do
      @client.query_accounts()
      expect(a_get("/api/v2/accounts")).to have_been_made
    end

    it "should return an array of accounts" do
      accounts = @client.query_accounts
      expect(accounts).to be_a Object
      expect(accounts['value'].first['id']).to equal 200000251
      expect(accounts.value.first.id).to equal 200000251
    end
  end
end
