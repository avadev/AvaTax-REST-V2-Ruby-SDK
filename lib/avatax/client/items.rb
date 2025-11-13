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
      # @return [AssociatedObjectDeletedErrorDetailsModel[]]
      def batch_delete_item_classifications(companyId, itemId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications"
        delete(path, {}, AvaTax::VERSION)      end

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
      # @return [AssociatedObjectDeletedErrorDetailsModel[]]
      def batch_delete_item_parameters(companyId, itemId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters"
        delete(path, {}, AvaTax::VERSION)      end

      # Bulk upload items from a product catalog
      #
      # Create/Update one or more item objects attached to this company.
      #
      # Recommended number of items to create/update in a single call is upto 100.
      #
      # Currently, the maximum number of items that can be created/updated in a single call is 500 (This limit is subject to change).
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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this items.
      # @param model [Object] The items you wish to upload.
      # @return [Object]
      def bulk_upload_items(companyId, model)        path = "/api/v2/companies/#{companyId}/items/upload"
        post(path, model, {}, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param model [ItemClassificationInputModel[]] The item classifications you wish to create.
      # @return [ItemClassificationOutputModel[]]
      def create_item_classifications(companyId, itemId, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications"
        post(path, model, {}, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item parameter.
      # @param itemId [Integer] The item id.
      # @param model [ItemParameterModel[]] The item parameters you wish to create.
      # @return [ItemParameterModel[]]
      def create_item_parameters(companyId, itemId, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters"
        post(path, model, {}, AvaTax::VERSION)      end

      # Create a new item
      #
      # Creates one or more new item objects attached to this company.
      #
      # Recommended number of items to create in a single call is upto 50.
      #
      # Currently, the maximum number of items that can be created in a single call is 500 (This limit is subject to change).
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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param processRecommendationsSynchronously [Boolean] If true then Indix api will be called synchronously to get tax code recommendations.
      # @param model [ItemModel[]] The item you wish to create.
      # @return [ItemModel[]]
      def create_items(companyId, model, options={})        path = "/api/v2/companies/#{companyId}/items"
        post(path, model, options, AvaTax::VERSION)      end

      # Create tags for a item
      #
      # Creates one or more new `Tag` objects attached to this Item.
      #
      # Item tags puts multiple labels for an item. So that item can be easily grouped by these tags.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items
      # @param itemId [Integer] The ID of the item as defined by the company that owns this tag.
      # @param model [ItemTagDetailInputModel[]] Tags you wish to associate with the Item
      # @return [ItemTagDetailOutputModel[]]
      def create_item_tags(companyId, itemId, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/tags"
        post(path, model, {}, AvaTax::VERSION)      end

      # Create a new tax code classification request
      #
      # Creates a new tax code classification request.
      #
      # Avalara AvaTax system tax codes represent various goods and services classified by industry or consumer categories and
      # major physical similarities. Taxability rules are associated with tax codes. Customers can map their Items to tax codes
      # allowing them to take advantage of thousands of tax rules in the AvaTax engine resulting in accurate taxability determinations.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that creates this request.
      # @param model [Object] The request you wish to create.
      # @return [Object]
      def create_tax_code_classification_request(companyId, model)        path = "/api/v2/companies/#{companyId}/classificationrequests/taxcode"
        post(path, model, {}, AvaTax::VERSION)      end

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
      # @return [ObjectDeletedErrorModel[]]
      def delete_catalogue_item(companyId, itemCode)        path = "/api/v2/companies/#{companyId}/itemcatalogue/#{itemCode}"
        delete(path, {}, AvaTax::VERSION)      end

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
      # @return [ObjectDeletedErrorModel[]]
      def delete_item(companyId, id)        path = "/api/v2/companies/#{companyId}/items/#{id}"
        delete(path, {}, AvaTax::VERSION)      end

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
      # @return [ObjectDeletedErrorModel[]]
      def delete_item_classification(companyId, itemId, id)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications/#{id}"
        delete(path, {}, AvaTax::VERSION)      end

      # Delete the image associated with an item.
      #
      # Delete the image associated with an item.
      #
      # Permanently deletes both the image and its association with the specified item.
      # This endpoint allows users to manage product visual representations by removing outdated or incorrect images,
      # and cleaning up unused resources in the system.
      # Once deleted, the image association cannot be recovered. To use the image again, it must be re-uploaded and
      # re-linked with the item.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID of the company.
      # @param itemId [Integer] The unique ID of the item.
      # @param imageId [String] The unique ID of the image to delete.
      # @return [AssociatedObjectDeletedErrorDetailsModel[]]
      def delete_item_image(companyId, itemId, imageId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/images/#{imageId}"
        delete(path, {}, AvaTax::VERSION)      end

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
      # @return [ObjectDeletedErrorModel[]]
      def delete_item_parameter(companyId, itemId, id)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters/#{id}"
        delete(path, {}, AvaTax::VERSION)      end

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
      # @return [ObjectDeletedErrorModel[]]
      def delete_item_tag(companyId, itemId, itemTagDetailId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/tags/#{itemTagDetailId}"
        delete(path, {}, AvaTax::VERSION)      end

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
      # @return [AssociatedObjectDeletedErrorDetailsModel[]]
      def delete_item_tags(companyId, itemId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/tags"
        delete(path, {}, AvaTax::VERSION)      end

      # Dismiss the `Status` and `Details` values of the given ItemHSCodeClassificationStatus.
      #
      # Dismiss the existing `Status` and `Details` of the ItemHSCodeClassificationStatus object at this URL with an updated object.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company to which this item belongs.
      # @param itemId [Integer] The ID of the item whose classification status you want to update.
      # @param country [String] The country of the HS code classification request status record that is to be updated.
      # @return [Object]
      def dismiss_h_s_code_classification_status(companyId, itemId, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemId}/hscode-classifications-status/$dismiss"
        put(path, options, AvaTax::VERSION)      end

      # Retrieve the HS code classification SLA details for a company.
      #
      # This endpoint returns the SLA details for HS code classification for the
      # specified company. The response includes information about processing times,
      # service commitments, and other relevant SLA terms.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company for which to retrieve the SLA details.
      # @return [Object]
      def get_h_s_code_classification_s_l_a(companyId)        path = "/api/v2/companies/#{companyId}/items/hscode-classification/$get-sla"
        get(path, {}, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item object
      # @param id [Integer] The primary key of this item
      # @param include [String] A comma separated list of additional data to retrieve.
      # @return [Object]
      def get_item(companyId, id, options={})        path = "/api/v2/companies/#{companyId}/items/#{id}"
        get(path, options, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param id [Integer] The item classification id.
      # @return [Object]
      def get_item_classification(companyId, itemId, id)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications/#{id}"
        get(path, {}, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param itemId [Integer] The item id
      # @param id [Integer] The parameter id
      # @return [Object]
      def get_item_parameter(companyId, itemId, id)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters/#{id}"
        get(path, {}, AvaTax::VERSION)      end

      # Retrieve tags for an item
      #
      # Get the `Tag` objects of an Item identified by this URL.
      #
      # Item tags puts multiple labels for an item. So that item can be easily grouped by these tags.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items
      # @param itemId [Integer] The ID of the item as defined by the company that owns this tag.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* tagName
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @return [FetchResult]
      def get_item_tags(companyId, itemId, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemId}/tags"
        get(path, options, AvaTax::VERSION)      end

      # Get Item TaxCode Recommendations
      #
      # Provides at least three tax-code recommendations for the given company ID and item ID
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] 
      # @param itemId [Integer] 
      # @return [TaxCodeRecommendationOutputModel[]]
      def get_item_tax_code_recommendations(companyId, itemId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/taxcoderecommendations"
        get(path, {}, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item object
      # @param itemCode [String] The ItemCode of the item for which you want to retrieve premium classification
      # @param systemCode [String] The SystemCode for which you want to retrieve premium classification
      # @param country [String] Optional: Provide the country for which you want to retrieve the premium classification.
      # @return [Object]
      def get_premium_classification(companyId, itemCode, systemCode, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemCode}/premiumClassification/#{systemCode}"
        get(path, options, AvaTax::VERSION)      end

      # Get the image associated with an item.
      #
      # Get the image file for the specified image ID linked to the item.
      #
      # This endpoint allows users to retrieve and display product images in user interfaces or to verify the current
      # image associated with a specific item.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID of the company.
      # @param itemId [Integer] The unique ID of the item.
      # @param imageId [String] The unique ID of the image to retrieve.
      # @return [Object]
      def get_product_image(companyId, itemId, imageId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/images/#{imageId}"
        get(path, {}, AvaTax::VERSION)      end

      # Create an HS code classification request.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company for which you want to create this HS code classification request.
      # @param model [ItemHSCodeClassificationInputModel[]] Item HSCodeClassification input Model
      # @return [ItemHSCodeClassificationOutputModel[]]
      def initiate_h_s_code_classification(companyId, model)        path = "/api/v2/companies/#{companyId}/items/$initiate-hscode-classification"
        post(path, model, {}, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item object
      # @param itemCode [String] ItemCode for the item
      # @param countryOfImport [String] Country for which you want the restrictions for the Item.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_import_restrictions(companyId, itemCode, countryOfImport, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemCode}/restrictions/import/#{countryOfImport}"
        get(path, options, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* productCode, systemCode, country, IsPremium, ClassificationEvent
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_item_classifications(companyId, itemId, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications"
        get(path, options, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param itemId [Integer] The item id
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* name, unit, isNeededForCalculation, isNeededForReturns, isNeededForClassification
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_item_parameters(companyId, itemId, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve premium classification for an item based on its `companyId` and `itemCode`.
      #
      # Retrieve the premium classification for an Item based on its `itemCode` and `companyId`.
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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item object.
      # @param itemCode [String] The item code of the item for which you want to retrieve premium classification.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* HsCode, justification, createdDate, createdUserId
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @return [FetchResult]
      def list_item_premium_classifications(companyId, itemCode, options={})        path = "/api/v2/companies/#{companyId}/items/#{itemCode}/premiumClassifications"
        get(path, options, AvaTax::VERSION)      end

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
      # You may specify comma seperated item status in the `itemStatus` query parameter if you want to filter items on the basis of item status
      #
      # You may specify Tax Code recommendation status in the `taxCodeRecommendationStatus` query parameter if you want to filter items on the basis of tax code recommendation status
      #
      # You can specify an HS code classification status in the `hsCodeClassificationStatus` query parameter if you want to filter items based on an HS code classification status.
      #
      # You can specify a comma-separated list of countries in the `hsCodeExistsInCountries` query parameter if you want to filter items based on whether an HS code exists for the provided countries.
      #
      # You can specify a comma-separated list of countries in the `hsCodeDoesNotExistsInCountries` query parameter if you want to filter items on the basis of whether an HS code does not exist for the provided countries.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Parameters
      # * Classifications
      # * Tags
      # * Properties
      # * TaxCodeRecommendationStatus
      # * HsCodeClassificationStatus
      # * TaxCodeDetails
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, source, sourceEntityId, itemType, upc, summary, classifications, parameters, tags, properties, itemStatus, taxCodeRecommendationStatus, taxCodeRecommendations, taxCodeDetails, hsCodeClassificationStatus, image
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param tagName [String] Tag Name on the basis of which you want to filter Items
      # @param itemStatus [String] A comma separated list of item status on the basis of which you want to filter Items
      # @param taxCodeRecommendationStatus [String] Tax code recommendation status on the basis of which you want to filter Items
      # @param hsCodeClassificationStatus [String] HS code classification status on the basis of which you want to filter items.
      # @param hsCodeExistsInCountries [String] A comma-separated list of countries for which the HS code is assigned and based on which you want to filter the items.
      # @param hsCodeDoesNotExistsInCountries [String] A comma-separated list of countries for which the HS code is not assigned and based on which you want to filter the items.
      # @return [FetchResult]
      def list_items_by_company(companyId, options={})        path = "/api/v2/companies/#{companyId}/items"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve the parameters by companyId and itemId.
      #
      # Returns the list of parameters based on the company's service types and the item code.
      # Ignores nexus if a service type is configured in the 'IgnoreNexusForServiceTypes' configuration section.
      # Ignores nexus for the AvaAlcohol service type.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] Company Identifier.
      # @param itemId [Integer] Item Identifier.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* serviceTypes, regularExpression, attributeSubType, values
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_recommended_parameter_by_company_id_and_item_id(companyId, itemId, options={})        path = "/api/v2/definitions/companies/#{companyId}/items/#{itemId}/parameters"
        get(path, options, AvaTax::VERSION)      end

      # Patch a single item
      #
      # Update the existing item object at this URL with the specified patch changes.
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # Only specified fields in the existing object will be updated with the data you provide via PATCH.
      # To set a field's value to null, you can either set the field to null explicitly or omit it from the PATCH request.
      #
      # The tax code takes precedence over the tax code ID if both are provided.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that this item belongs to.
      # @param id [Integer] The ID of the item you want to update.
      # @param model [Operation[]] A JSON patch (refer to https://datatracker.ietf.org/doc/html/rfc6902).
      # @return [Object]
      def patch_item(companyId, id, model)        path = "/api/v2/companies/#{companyId}/items/#{id}"
        patch(path, model, {}, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, source, sourceEntityId, itemType, upc, summary, classifications, parameters, tags, properties, itemStatus, taxCodeRecommendationStatus, taxCodeRecommendations, taxCodeDetails, hsCodeClassificationStatus, image
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_items(options={})        path = "/api/v2/items"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve items for this company based on System Code and filter criteria(optional) provided
      #
      # Retrieve items based on System Code
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # Search for specific objects by passing the `$filter` criteria in the body; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      #
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items
      # @param systemCode [String] System code on the basis of which you want to filter Items
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param model [Object] A filter statement to select specific records, as defined by https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md#97-filtering .
      # @return [FetchResult]
      def query_items_by_system_code(companyId, systemCode, model, options={})        path = "/api/v2/companies/#{companyId}/items/internal/bySystemCode/#{systemCode}"
        post(path, model, options, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that defined these items.
      # @param tag [String] The master tag to be associated with item.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, source, sourceEntityId, itemType, upc, summary, classifications, parameters, tags, properties, itemStatus, taxCodeRecommendationStatus, taxCodeRecommendations, taxCodeDetails, hsCodeClassificationStatus, image
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_items_by_tag(companyId, tag, options={})        path = "/api/v2/companies/#{companyId}/items/bytags/#{tag}"
        get(path, options, AvaTax::VERSION)      end

      # Create or update items from a product catalog.
      #
      # Creates/updates one or more item objects with additional properties and the AvaTax category attached to this company.
      #
      # Recommended number of items to create/update in a single call is upto 100.
      #
      # Currently, the maximum number of items that can be created/updated in a single call is 1000 (This limit is subject to change).
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. Use this endpoint to create
      # a new or update an existing item. This can be used to sync the items with Avalara. For example, an accounting software
      # system can use this to sync all their items from an ERP with Avalara.
      #
      # Parameters and Classifications can be added with the Item.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param model [ItemCatalogueInputModel[]] The items you want to create or update.
      # @return [Object]
      def sync_item_catalogue(companyId, model)        path = "/api/v2/companies/#{companyId}/itemcatalogue"
        post(path, model, {}, AvaTax::VERSION)      end

      # Sync items from a product catalog
      #
      # Syncs a list of items with AvaTax without waiting for them to be created. It is ideal for syncing large product catalogs
      # with AvaTax.
      #
      # Any invalid or duplicate items will be ignored. To diagnose why an item is not created, use the normal create transaction API to receive validation information.
      #
      # This API is currently limited to 500 items per call (the limit is subject to change).
      #
      # Items are a way of separating your tax calculation process from your tax configuration details. If you choose, you
      # can provide `itemCode` values for each `CreateTransaction()` API call rather than specifying tax codes, parameters, descriptions,
      # and other data fields. AvaTax will automatically look up each `itemCode` and apply the correct tax codes and parameters
      # from the item table instead. This allows your CreateTransaction call to be as simple as possible, and your tax compliance
      # team can manage your item catalog and adjust the tax behavior of items without having to modify your software.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this item.
      # @param model [Object] The request object.
      # @return [Object]
      def sync_items(companyId, model)        path = "/api/v2/companies/#{companyId}/items/sync"
        post(path, model, {}, AvaTax::VERSION)      end

      # Update an existing image for an item.
      #
      # This endpoint allows users to update the existing image associated with a specific item by uploading a new image file.
      #
      # The updated image serves as the item's visual representation and will be used for tax code recommendation purposes.
      #
      # Restrictions:
      # - Supported formats: JPEG, GIF, PNG
      # - Maximum file size: 10MB
      # - Maximum file name length allowed: 200 characters
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID of the company.
      # @param itemId [Integer] The unique ID of the item.
      # @param imageId [String] The unique ID of the image to update.
      # @param imageFile [Object] 
      # @return [Object]
      def update_image(companyId, itemId, imageId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/images/#{imageId}"
        put(path, {}, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that this item belongs to.
      # @param id [Integer] The ID of the item you wish to update
      # @param isRecommendationSelected [Boolean] If true then Set recommendation status to RecommendationSelected
      # @param isRecommendationRejected [Boolean] If true then Set recommendation status to RecommendationRejected, When the taxCode recommendation status is RecommendationAvailable. Else will be thrown as error
      # @param model [Object] The item object you wish to update.
      # @return [Object]
      def update_item(companyId, id, model, options={})        path = "/api/v2/companies/#{companyId}/items/#{id}"
        put(path, model, options, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id.
      # @param id [Integer] The item classification id.
      # @param model [Object] The item object you wish to update.
      # @return [Object]
      def update_item_classification(companyId, itemId, id, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications/#{id}"
        put(path, model, {}, AvaTax::VERSION)      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param itemId [Integer] The item id
      # @param id [Integer] The item parameter id
      # @param model [Object] The item object you wish to update.
      # @return [Object]
      def update_item_parameter(companyId, itemId, id, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters/#{id}"
        put(path, model, {}, AvaTax::VERSION)      end

      # Upload an image for an item.
      #
      # This endpoint allows users to upload an image file for a specific item.
      #
      # The uploaded image serves as the item's visual representation and will be used for tax code recommendation purposes.
      #
      # Restrictions:
      # - Supported formats: JPEG, GIF, PNG
      # - Maximum file size: 10MB
      # - Maximum file name length allowed: 200 characters
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID of the company.
      # @param itemId [Integer] The unique ID of the item.
      # @param imageFile [Object] 
      # @return [Object]
      def upload_image(companyId, itemId)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/images"
        post(path, {}, {}, AvaTax::VERSION)      end

      # Add/update item classifications.
      #
      # Add/update classifications to an item.
      #
      # A classification is the code for a product in a particular tax system. Classifications enable an item to be used in multiple tax systems that may have different tax rates for a product.
      #
      # When an item is used in a transaction, the applicable classification will be used to determine the appropriate tax rate.
      #
      # An item may only have one classification per tax system per country.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company ID.
      # @param itemId [Integer] The item ID.
      # @param model [ItemClassificationInputModel[]] The item classifications you want to create.
      # @return [ItemClassificationOutputModel[]]
      def upsert_item_classifications(companyId, itemId, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/classifications"
        put(path, model, {}, AvaTax::VERSION)      end

      # Add/update an item parameter.
      #
      # Add/update an item parameter.
      #
      # Some items can be taxed differently depending on the properties of that item, such as the item grade or by a particular measurement of that item. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an item will be used by default in tax calculation but will not show on the transaction line referencing the item .
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that this item belongs to.
      # @param itemId [Integer] The ID of the item you want to update.
      # @param model [ItemParameterModel[]] The item parameter object you want to upsert.
      # @return [ItemParameterModel[]]
      def upsert_item_parameter(companyId, itemId, model)        path = "/api/v2/companies/#{companyId}/items/#{itemId}/parameters"
        put(path, model, {}, AvaTax::VERSION)      end
    end
  end
end