module AvaTax
  class Client
    module Items 


      # Delete all classifications for an item
      #
      # Delete all the classifications for a given item.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems which may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param itemId [Integer] The ID of the item you wish to delete the classifications.
      # @return [ErrorDetail[]]
      def batch_delete_item_classifications(companyId, itemId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications"
        delete(path, {}, "22.6.1")      end

      # Delete all parameters for an item
      #
      # Delete all the parameters for a given item.
      #
      # Some items can be taxed differently depending on the properties of that item, such as the item grade or by a particular measurement of that item. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an item will be used by default in tax calculation but will not show on the transaction line referencing the item .
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param itemId [Integer] The ID of the item you wish to delete the parameters.
      # @return [ErrorDetail[]]
      def batch_delete_item_parameters(companyId, itemId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters"
        delete(path, {}, "22.6.1")      end

      # Bulk upload items from a product catalog
      #
      # Create/Update one or more item objects attached to this company.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # The tax code takes precedence over the tax code id if both are provided.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this items.
      # @param model [Object] The items you wish to upload.
      # @return [Object]
      def bulk_upload_items(companyId, model)        path = "/api/v2/companies/#{companyId}/items/upload"
        post(path, model, {}, "22.6.1")      end

      # Add classifications to an item.
      #
      # Add classifications to an item.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems which may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      #
      # An item may only have one classification per tax system.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param model [ItemClassificationInputModel[]] The item classifications you wish to create.
      # @return [ItemClassificationOutputModel[]]
      def create_item_classifications(companyId, itemId, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications"
        post(path, model, {}, "22.6.1")      end

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
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item parameter.
      # @param itemId [Integer] The item id.
      # @param model [ItemParameterModel[]] The item parameters you wish to create.
      # @return [ItemParameterModel[]]
      def create_item_parameters(companyId, itemId, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters"
        post(path, model, {}, "22.6.1")      end

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
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param model [ItemModel[]] The item you wish to create.
      # @return [ItemModel[]]
      def create_items(companyId, model)        path = "/api/v2/companies/#{companyId}/items"
        post(path, model, {}, "22.6.1")      end

      # Create tags for a item
      #
      # Creates one or more new `Tag` objects attached to this Item.
      #
      # Item tags puts multiple labels for an item. So that item can be easily grouped by these tags.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items
      # @param itemId [Integer] The ID of the item as defined by the company that owns this tag.
      # @param model [ItemTagDetailModel[]] Tags you wish to associate with the Item
      # @return [ItemTagDetailModel[]]
      def create_item_tags(companyId, itemId, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/tags"
        post(path, model, {}, "22.6.1")      end

      # Create a new tax code classification request
      #
      # Creates a new tax code classification request.
      #
      # Avalara AvaTax system tax codes represent various goods and services classified by industry or consumer categories and
      # major physical similarities. Taxability rules are associated with tax codes. Customers can map their Items to tax codes,
      # allowing them to take advantage of thousands of tax rules in the AvaTax engine and resulting in accurate taxability determinations.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company creating this request.
      # @param model [Object] The request you wish to create.
      # @return [Object]
      def create_tax_code_classification_request(companyId, model)        path = "/api/v2/companies/#{companyId}/classificationrequests/taxcode"
        post(path, model, {}, "22.6.1")      end

      # Delete a single item
      #
      # Deletes the item object at this URL.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details.
      # Use this endpoint to delete an existing item with item code.
      #
      # Deleting an item will also delete the parameters, classifications, and product categories associated with that item.
      #
      # NOTE: If your item code contains any of these characters /, +, ? or a space, please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: 'Item/Code' becomes 'Item_-ava2f-_Code'
      # * Replace '+' with '\_-ava2b-\_' For example: 'Item+Code' becomes 'Item_-ava2b-_Code'
      # * Replace '?' with '\_-ava3f-\_' For example: 'Item?Code' becomes 'Item_-ava3f-_Code'
      # * Replace '%' with '\_-ava25-\_' For example: 'Item%Code' becomes 'Item_-ava25-_Code'
      # * Replace '#' with '\_-ava23-\_' For example: 'Item#Code' becomes 'Item_-ava23-_Code'
      # * Replace ''' with '\_-ava27-\_' For example: 'Item'Code' becomes 'Item_-ava27-_Code'
      # * Replace '"' with '\_-ava22-\_' For example: 'Item"Code' becomes 'Item_-ava22-_Code'
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param itemCode [String] The code of the item you want to delete.
      # @return [ErrorDetail[]]
      def delete_catalogue_item(companyId, itemCode)        path = "/api/v2/companies/#{companyId}/itemcatalogue/#{itemCode}"
        delete(path, {}, "22.6.1")      end

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
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param id [Integer] The ID of the item you wish to delete.
      # @return [ErrorDetail[]]
      def delete_item(companyId, id)        path = "/api/v2/companies/#{companyId}/items/#{id}"
        delete(path, {}, "22.6.1")      end

      # Delete a single item classification.
      #
      # Delete a single item classification.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems which may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param id [Integer] The item classification id.
      # @return [ErrorDetail[]]
      def delete_item_classification(companyId, itemId, id)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications/#{id}"
        delete(path, {}, "22.6.1")      end

      # Delete a single item parameter
      #
      # Delete a single item parameter.
      #
      # Some items can be taxed differently depending on the properties of that item, such as the item grade or by a particular measurement of that item. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an item will be used by default in tax calculation but will not show on the transaction line referencing the item .
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param itemId [Integer] The item id
      # @param id [Integer] The parameter id
      # @return [ErrorDetail[]]
      def delete_item_parameter(companyId, itemId, id)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters/#{id}"
        delete(path, {}, "22.6.1")      end

      # Delete item tag by id
      #
      # Deletes the `Tag` object of an Item at this URL.
      #
      # Item tags puts multiple labels for an item. So that item can be easily grouped by these tags.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items
      # @param itemId [Integer] The ID of the item as defined by the company that owns this tag.
      # @param itemTagDetailId [Integer] The ID of the item tag detail you wish to delete.
      # @return [ErrorDetail[]]
      def delete_item_tag(companyId, itemId, itemTagDetailId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/tags/#{itemTagDetailId}"
        delete(path, {}, "22.6.1")      end

      # Delete all item tags
      #
      # Deletes all `Tags` objects of an Item at this URL.
      #
      # Item tags puts multiple labels for an item. So that item can be easily grouped by these tags.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items.
      # @param itemId [Integer] The ID of the item as defined by the company that owns this tag.
      # @return [ErrorDetail[]]
      def delete_item_tags(companyId, itemId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/tags"
        delete(path, {}, "22.6.1")      end

      # Get the status of classification requests for a company
      #
      # Get the status of tax code classification requests for a company.
      #
      # Avalara AvaTax system tax codes represent various goods and services classified by industry or consumer categories and
      # major physical similarities. Taxability rules are associated with tax codes. Customers can map their Items to tax codes,
      # allowing them to take advantage of thousands of tax rules in the AvaTax engine and resulting in accurate taxability determinations.
      #
      # Enable includeClassificationDetails flag to get details of classification request status.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items
      # @param includeClassificationDetails [Boolean] A Boolean field that specifies whether to get a detailed classification status.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* classificationDetails, totalItems, status
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def get_classification_status(companyId, options={})        path = "/api/v2/companies/#{companyId}/classificationrequests/taxcode"
        get(path, options, "22.6.1")      end

      # Retrieve a single item
      #
      # Get the `Item` object identified by this URL.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item object
      # @param id [Integer] The primary key of this item
      # @param include [String] A comma separated list of additional data to retrieve.
      # @return [Object]
      def get_item(companyId, id, options={})        path = "/api/v2/companies/#{companyId}/items/#{id}"
        get(path, options, "22.6.1")      end

      # Retrieve a single item classification.
      #
      # Retrieve a single item classification.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems which may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param id [Integer] The item classification id.
      # @return [Object]
      def get_item_classification(companyId, itemId, id)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve a single item parameter
      #
      # Retrieve a single item parameter.
      #
      # Some items can be taxed differently depending on the properties of that item, such as the item grade or by a particular measurement of that item. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an item will be used by default in tax calculation but will not show on the transaction line referencing the item .
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param itemId [Integer] The item id
      # @param id [Integer] The parameter id
      # @return [Object]
      def get_item_parameter(companyId, itemId, id)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve tags for an item
      #
      # Get the `Tag` objects of an Item identified by this URL.
      #
      # Item tags puts multiple labels for an item. So that item can be easily grouped by these tags.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items
      # @param itemId [Integer] The ID of the item as defined by the company that owns this tag.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* tagName
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @return [FetchResult]
      def get_item_tags(companyId, itemId, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemId}/tags"
        get(path, options, "22.6.1")      end

      # Retrieve premium classification for a company's item based on its ItemCode and SystemCode.
      #
      # Retrieves the premium classification for an ItemCode and SystemCode.
      #
      # NOTE: If your item code contains any of these characters /, +, ?,",' ,% or #, please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: 'Item/Code' becomes 'Item_-ava2f-_Code'
      # * Replace '+' with '\_-ava2b-\_' For example: 'Item+Code' becomes 'Item_-ava2b-_Code'
      # * Replace '?' with '\_-ava3f-\_' For example: 'Item?Code' becomes 'Item_-ava3f-_Code'
      # * Replace '%' with '\_-ava25-\_' For example: 'Item%Code' becomes 'Item_-ava25-_Code'
      # * Replace '#' with '\_-ava23-\_' For example: 'Item#Code' becomes 'Item_-ava23-_Code'
      # * Replace ''' with '\_-ava27-\_' For example: 'Item'Code' becomes 'Item_-ava27-_Code'
      # * Replace '"' with '\_-ava22-\_' For example: 'Item"Code' becomes 'Item_-ava22-_Code'
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item object
      # @param itemCode [String] The ItemCode of the item for which you want to retrieve premium classification
      # @param systemCode [String] The SystemCode for which you want to retrieve premium classification
      # @return [Object]
      def get_premium_classification(companyId, itemCode, systemCode)        path = "/api/v2/companies/#{companyId}/items/#{itemCode}/premiumClassification/#{systemCode}"
        get(path, {}, "22.6.1")      end

      # Get tax code recommendations
      #
      # Get tax code recommendations.
      #
      # Avalara AvaTax system tax codes represent various goods and services classified by industry or consumer categories and
      # major physical similarities. Taxability rules are associated with tax codes. Customers can map their Items to tax codes,
      # allowing them to take advantage of thousands of tax rules in the AvaTax engine and resulting in accurate taxability determinations.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items
      # @param requestId [Integer] The ID of the classification request
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* recommendations, url
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def get_tax_code_recommendations(companyId, requestId, options={})        path = "/api/v2/companies/#{companyId}/classificationrequests/taxcode/#{requestId}/recommendations"
        get(path, options, "22.6.1")      end

      # Retrieve Restrictions for Item by CountryOfImport
      #
      # Retrieve Restrictions for Item by CountryOfImport. This API will only return import restriction for the countryOfImport.
      #
      # NOTE: If your item code contains any of these characters /, +, ? or a space, please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: 'Item/Code' becomes 'Item_-ava2f-_Code'
      # * Replace '+' with '\_-ava2b-\_' For example: 'Item+Code' becomes 'Item_-ava2b-_Code'
      # * Replace '?' with '\_-ava3f-\_' For example: 'Item?Code' becomes 'Item_-ava3f-_Code'
      # * Replace '%' with '\_-ava25-\_' For example: 'Item%Code' becomes 'Item_-ava25-_Code'
      # * Replace '#' with '\_-ava23-\_' For example: 'Item#Code' becomes 'Item_-ava23-_Code'
      # * Replace ''' with '\_-ava27-\_' For example: 'Item'Code' becomes 'Item_-ava27-_Code'
      # * Replace '"' with '\_-ava22-\_' For example: 'Item"Code' becomes 'Item_-ava22-_Code'
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item object
      # @param itemCode [String] ItemCode for the item
      # @param countryOfImport [String] Country for which you want the restrictions for the Item.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_import_restrictions(companyId, itemCode, countryOfImport, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemCode}/restrictions/import/#{countryOfImport}"
        get(path, options, "22.6.1")      end

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
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* productCode, systemCode
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_item_classifications(companyId, itemId, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications"
        get(path, options, "22.6.1")      end

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
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param itemId [Integer] The item id
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* name, unit, isNeededForCalculation, isNeededForReturns, isNeededForClassification
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_item_parameters(companyId, itemId, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters"
        get(path, options, "22.6.1")      end

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
      # You may specify Tag Name in the `tagName` query parameter if you want to filter items on the basis of tagName
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Parameters
      # * Classifications
      # * Tags
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, source, upc, classifications, parameters, tags
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param tagName [String] Tag Name on the basis of which you want to filter Items
      # @return [FetchResult]
      def list_items_by_company(companyId, options={})        path = "/api/v2/companies/#{companyId}/items"
        get(path, options, "22.6.1")      end

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
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, source, upc, classifications, parameters, tags
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_items(options={})        path = "/api/v2/items"
        get(path, options, "22.6.1")      end

      # Retrieve all items associated with given tag
      #
      # Get multiple item objects associated with given tag.
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
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items.
      # @param tag [String] The master tag to be associated with item.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, source, upc, classifications, parameters, tags
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_items_by_tag(companyId, tag, options={})        path = "/api/v2/companies/#{companyId}/items/bytags/#{tag}"
        get(path, options, "22.6.1")      end

      # Create or update items from a product catalog.
      #
      # Creates/updates one or more item objects with additional properties and the AvaTax category attached to this company.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. Use this endpoint to create
      # a new or update an existing item. This can be used to sync the items with Avalara. For example, an accounting software
      # system can use this to sync all their items from an ERP with Avalara.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param model [ItemCatalogueInputModel[]] The items you want to create or update.
      # @return [Object]
      def sync_item_catalogue(companyId, model)        path = "/api/v2/companies/#{companyId}/itemcatalogue"
        post(path, model, {}, "22.6.1")      end

      # Sync items from a product catalog
      #
      # Syncs a list of items with AvaTax without waiting for them to be created. It is ideal for syncing large product catalogs
      # with AvaTax.
      #
      # Any invalid or duplicate items will be ignored. To diagnose why an item is not created, use the normal create transaction API to receive validation information.
      #
      # This API is currently limited to 1000 items per call (the limit is subject to change).
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param model [Object] The request object.
      # @return [Object]
      def sync_items(companyId, model)        path = "/api/v2/companies/#{companyId}/items/sync"
        post(path, model, {}, "22.6.1")      end

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
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that this item belongs to.
      # @param id [Integer] The ID of the item you wish to update
      # @param model [Object] The item object you wish to update.
      # @return [Object]
      def update_item(companyId, id, model)        path = "/api/v2/companies/#{companyId}/items/#{id}"
        put(path, model, {}, "22.6.1")      end

      # Update an item classification.
      #
      # Update an item classification.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems which may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      #
      # An item may only have one classification per tax system.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param id [Integer] The item classification id.
      # @param model [Object] The item object you wish to update.
      # @return [Object]
      def update_item_classification(companyId, itemId, id, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications/#{id}"
        put(path, model, {}, "22.6.1")      end

      # Update an item parameter
      #
      # Update an item parameter.
      #
      # Some items can be taxed differently depending on the properties of that item, such as the item grade or by a particular measurement of that item. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an item will be used by default in tax calculation but will not show on the transaction line referencing the item .
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id
      # @param id [Integer] The item parameter id
      # @param model [Object] The item object you wish to update.
      # @return [Object]
      def update_item_parameter(companyId, itemId, id, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end