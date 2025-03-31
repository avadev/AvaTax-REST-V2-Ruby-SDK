require File.expand_path('../../../spec_helper', __FILE__)

describe AvaTax::Client do
  describe ".items" do
    it "should create and update an item for the first company" do
      # Get the first company
      companies = @client.query_companies()
      company = companies["value"][0]
      company_id = company["id"]
      puts "Using company ID: #{company_id}"

      # Create a new item
      item_code = "TEST_ITEM_#{Time.now.to_i}"
      item_model = {
        "itemCode" => item_code,
        "description" => "Test Item Created via RSpec",
        "taxCode" => "P0000000"
      }

      created_response = @client.create_items(company_id, [item_model])
      created_item = created_response.first

      # Assert item creation
      expect(created_item).to be_a(Hash)
      expect(created_item["itemCode"]).to eq(item_code)
      expect(created_item["description"]).to eq("Test Item Created via RSpec")
      expect(created_item["taxCode"]).to eq("P0000000")

      puts "Created item: #{created_item}"

      # Prepare JSON Patch operation
      item_id = created_item["id"]
      patch_operations = [
        {
          "op" => "replace",
          "path" => "/description",
          "value" => "Updated Description via RSpec"
        }
      ]

      # Call patch_item
      updated_item = @client.patch_item(company_id, item_id, patch_operations)

      expect(updated_item).to be_a(Hash)
      expect(updated_item["id"]).to eq(item_id)
      expect(updated_item["description"]).to eq("Updated Description via RSpec")

      puts "Updated item: #{updated_item}"
    end
  end
end