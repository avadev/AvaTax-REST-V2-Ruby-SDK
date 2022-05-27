require File.expand_path('../../spec_helper', __FILE__)

describe AvaTax::Connection do
  describe "AUTHORIZATION_FILTER_REGEX" do
    let(:message) do
      <<EOS
Accept: "application/json; charset=utf-8"
User-Agent: "AvaTax Ruby Gem 19.7.0"
X-Avalara-Client: ";;RubySdk;19.7.0;"
Authorization: "Basic #{encoded_token}"
Content-Type: "application/json"
EOS
    end

    context "a base 64 encoded value ending with =" do
      let(:encoded_token) { "YmFzZTY0cGFzc3dvcmQuUmVhbGx5Pwo=" }

      it "should match regex" do
        expect(message).to match(described_class::AUTHORIZATION_FILTER_REGEX)
      end

      it "should capture the whole auth token" do
        groups = message.match(described_class::AUTHORIZATION_FILTER_REGEX)
        expect(groups[2]).to eq(encoded_token)
      end
    end

    context "a base 64 encoded value NOT ending with =" do
      let(:encoded_token) { "bm9hcGlrZXlpbjIwMTkK" }

      it "should match regex" do
        expect(message).to match(described_class::AUTHORIZATION_FILTER_REGEX)
      end

      it "should capture the whole auth token" do
        groups = message.match(described_class::AUTHORIZATION_FILTER_REGEX)
        expect(groups[2]).to eq(encoded_token)
      end
    end
  end
end

