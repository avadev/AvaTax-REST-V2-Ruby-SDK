module AvaTax
  class Client
    module Items 


      # Add classifications to an item.
      #
      # Add classifications to an item.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems which may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      #
      # An item may only have one classification per tax system.
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param model [ItemClassificationInputModel[]] The item classifications you wish to create.
      # @return [ItemClassificationOutputModel[]]
      def create_item_classifications(companyId, itemId, model)
        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications"
        post(path, model)
      end


      # Add parameters to an item.
      #
      # Add parameters to an item.
      #
      # Some items can be taxed differently depending on the properties of that item, such as the item grade or by a particular measurement of that item. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an item will be used by default in tax calculation but will not show on the transaction line referencing the item .
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.
      #
      # To see available parameters for this item, call `/api/v2/definitions/parameters?$filter=attributeType eq Product`
      #
      # Some parameters are only available for use if you have subscribed to specific AvaTax services. To see which parameters you are able to use, add the query parameter "$showSubscribed=true" to the parameter definition call above.
      # @param companyId [Integer] The ID of the company that owns this item parameter.
      # @param itemId [Integer] The item id.
      # @param model [ItemParameterModel[]] The item parameters you wish to create.
      # @return [ItemParameterModel[]]
      def create_item_parameters(companyId, itemId, model)
        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters"
        post(path, model)
      end


      # Create a new item
      #
      # Creates one or more new item objects attached to this company.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # The tax code takes precedence over the tax code id if both are provided.
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param model [ItemModel[]] The item you wish to create.
      # @return [ItemModel[]]
      def create_items(companyId, model)
        path = "/api/v2/companies/#{companyId}/items"
        post(path, model)
      end


      # Delete a single item
      #
      # Deletes the item object at this URL.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # Deleting an item will also delete the parameters and classifications associated with that item.
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param id [Integer] The ID of the item you wish to delete.
      # @return [ErrorDetail[]]
      def delete_item(companyId, id)
        path = "/api/v2/companies/#{companyId}/items/#{id}"
        delete(path)
      end


      # Delete a single item classification.
      #
      # Delete a single item classification.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems which may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param id [Integer] The item classification id.
      # @return [ErrorDetail[]]
      def delete_item_classification(companyId, itemId, id)
        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications/#{id}"
        delete(path)
      end


      # Delete a single item parameter
      #
      # Delete a single item parameter.
      #
      # Some items can be taxed differently depending on the properties of that item, such as the item grade or by a particular measurement of that item. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an item will be used by default in tax calculation but will not show on the transaction line referencing the item .
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.
      # @param companyId [Integer] The company id
      # @param itemId [Integer] The item id
      # @param id [Integer] The parameter id
      # @return [ErrorDetail[]]
      def delete_item_parameter(companyId, itemId, id)
        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters/#{id}"
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
      # @param include [String] A comma separated list of additional data to retrieve.
      # @return [Object]
      def get_item(companyId, id, options={})
        path = "/api/v2/companies/#{companyId}/items/#{id}"
        get(path, options)
      end


      # Retrieve a single item classification.
      #
      # Retrieve a single item classification.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems which may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param id [Integer] The item classification id.
      # @return [Object]
      def get_item_classification(companyId, itemId, id)
        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications/#{id}"
        get(path)
      end


      # Retrieve a single item parameter
      #
      # Retrieve a single item parameter.
      #
      # Some items can be taxed differently depending on the properties of that item, such as the item grade or by a particular measurement of that item. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an item will be used by default in tax calculation but will not show on the transaction line referencing the item .
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.
      # @param companyId [Integer] The company id
      # @param itemId [Integer] The item id
      # @param id [Integer] The parameter id
      # @return [Object]
      def get_item_parameter(companyId, itemId, id)
        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters/#{id}"
        get(path)
      end


      # Retrieve classifications for an item.
      #
      # List classifications for an item.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems which may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      #
      # Search for specific objects using the criteria in the `$filter` classification; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` classifications.
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_item_classifications(companyId, itemId, options={})
        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications"
        get(path, options)
      end


      # Retrieve parameters for an item
      #
      # List parameters for an item.
      #
      # Some items can be taxed differently depending on the properties of that item, such as the item grade or by a particular measurement of that item. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an item will be used by default in tax calculation but will not show on the transaction line referencing the item .
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # @param companyId [Integer] The company id
      # @param itemId [Integer] The item id
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_item_parameters(companyId, itemId, options={})
        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters"
        get(path, options)
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
      # * Parameters
      # * Classifications
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
      #
      # The tax code takes precedence over the tax code id if both are provided.
      # @param companyId [Integer] The ID of the company that this item belongs to.
      # @param id [Integer] The ID of the item you wish to update
      # @param model [Object] The item object you wish to update.
      # @return [Object]
      def update_item(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/items/#{id}"
        put(path, model)
      end


      # Update an item classification.
      #
      # Update an item classification.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems which may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      #
      # An item may only have one classification per tax system.
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param id [Integer] The item classification id.
      # @param model [Object] The item object you wish to update.
      # @return [Object]
      def update_item_classification(companyId, itemId, id, model)
        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications/#{id}"
        put(path, model)
      end


      # Update an item parameter
      #
      # Update an item parameter.
      #
      # Some items can be taxed differently depending on the properties of that item, such as the item grade or by a particular measurement of that item. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an item will be used by default in tax calculation but will not show on the transaction line referencing the item .
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id
      # @param id [Integer] The item parameter id
      # @param model [Object] The item object you wish to update.
      # @return [Object]
      def update_item_parameter(companyId, itemId, id, model)
        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters/#{id}"
        put(path, model)
      end

    end
  end
end