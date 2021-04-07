require_relative "../spec_helper"

describe AvaTax::API do
  context "connection" do

    it "uses custom ParseOj for regular config" do
      faraday_instance_double = double.as_null_object

      expect(Faraday).to receive(:new).and_yield(faraday_instance_double)
      expect(faraday_instance_double).to receive(:response).with(:oj, { content_type: /\bjson$/ })

      # default setting
      expect(Oj.default_options[:bigdecimal_load]).to eq(:auto)

      AvaTax::API.new.send(:connection)
    end

    it "uses custom ParseOjWithBigDecimal when response_big_decimal_conversion provided" do
      faraday_instance_double = double.as_null_object

      expect(Faraday).to receive(:new).and_yield(faraday_instance_double)
      expect(faraday_instance_double).to receive(:response).with(:oj_with_bigdecimal, { content_type: /\bjson$/ })

      # default setting
      expect(Oj.default_options[:bigdecimal_load]).to eq(:auto)

      AvaTax::API.new(response_big_decimal_conversion: true).send(:connection)
    end
  end
end
