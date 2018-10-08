module AvaTax
  class Client
    module Items 


      # Create a new item
      #
      # Creates one or more new item objects attached to this company.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param model [ItemModel[]] The item you wish to create.
      # @return [ItemModel[]]
      def create_items(companyId, model)
        path = "/api/v2/companies/#{companyId}/items"
        post(path, model)
      end


      # Delete a single item
      #
      # Marks the item object at this URL as deleted.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param id [Integer] The ID of the item you wish to delete.
      # @return [ErrorDetail[]]
      def delete_item(companyId, id)
        path = "/api/v2/companies/#{companyId}/items/#{id}"
        delete(path)
      end


      # Retrieve a single item
      #
      # Get the `Item` object identified by this URL.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      # @param companyId [Integer] The ID of the company that owns this item object
      # @param id [Integer] The primary key of this item
      # @return [Object]
      def get_item(companyId, id)
        path = "/api/v2/companies/#{companyId}/items/#{id}"
        get(path)
      end


      # Retrieve items for this company
      #
      # List all items defined for the current company.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      #
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Attributes
      # @param companyId [Integer] The ID of the company that defined these items
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_items_by_company(companyId, options={})
        path = "/api/v2/companies/#{companyId}/items"
        get(path, options)
      end


      # Retrieve all items
      #
      # Get multiple item objects across all companies.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      #
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Attributes
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_items(options={})
        path = "/api/v2/items"
        get(path, options)
      end


      # Update a single item
      #
      # Replace the existing `Item` object at this URL with an updated object.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # All data from the existing object will be replaced with data in the object you PUT. To set a field's value to null,
      # you may either set its value to null or omit that field from the object you post.
      # @param companyId [Integer] The ID of the company that this item belongs to.
      # @param id [Integer] The ID of the item you wish to update
      # @param model [Object] The item object you wish to update.
      # @return [Object]
      def update_item(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/items/#{id}"
        put(path, model)
      end

    end
  end
end