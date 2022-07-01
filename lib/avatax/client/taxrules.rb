module AvaTax
  class Client
    module TaxRules 


      # Create a new tax rule
      #
      # Create one or more custom tax rules attached to this company.
      #
      # A tax rule represents a rule that changes the default AvaTax behavior for a product or jurisdiction. Custom tax rules
      # can be used to change the taxability of an item, to change the tax base of an item, or to change the tax rate
      # charged when selling an item. Tax rules can also change tax behavior depending on the `entityUseCode` value submitted
      # with the transaction.
      #
      # You can create custom tax rules to customize the behavior of AvaTax to match specific rules that are custom to your
      # business. If you have obtained a ruling from a tax auditor that requires custom tax calculations, you can use
      # custom tax rules to redefine the behavior for your company or item.
      #
      # Please use custom tax rules carefully and ensure that these tax rules match the behavior agreed upon with your
      # auditor, legal representative, and accounting team.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this tax rule.
      # @param model [TaxRuleModel[]] The tax rule you wish to create.
      # @return [TaxRuleModel[]]
      def create_tax_rules(companyId, model)        path = "/api/v2/companies/#{companyId}/taxrules"
        post(path, model, {}, "22.6.1")      end

      # Delete a single tax rule
      #
      # Mark the custom tax rule identified by this URL as deleted.
      #
      # A tax rule represents a rule that changes the default AvaTax behavior for a product or jurisdiction. Custom tax rules
      # can be used to change the taxability of an item, to change the tax base of an item, or to change the tax rate
      # charged when selling an item. Tax rules can also change tax behavior depending on the `entityUseCode` value submitted
      # with the transaction.
      #
      # You can create custom tax rules to customize the behavior of AvaTax to match specific rules that are custom to your
      # business. If you have obtained a ruling from a tax auditor that requires custom tax calculations, you can use
      # custom tax rules to redefine the behavior for your company or item.
      #
      # Please use custom tax rules carefully and ensure that these tax rules match the behavior agreed upon with your
      # auditor, legal representative, and accounting team.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this tax rule.
      # @param id [Integer] The ID of the tax rule you wish to delete.
      # @return [ErrorDetail[]]
      def delete_tax_rule(companyId, id)        path = "/api/v2/companies/#{companyId}/taxrules/#{id}"
        delete(path, {}, "22.6.1")      end

      # Retrieve a single tax rule
      #
      # Get the taxrule object identified by this URL.
      #
      # A tax rule represents a rule that changes the default AvaTax behavior for a product or jurisdiction. Custom tax rules
      # can be used to change the taxability of an item, to change the tax base of an item, or to change the tax rate
      # charged when selling an item. Tax rules can also change tax behavior depending on the `entityUseCode` value submitted
      # with the transaction.
      #
      # You can create custom tax rules to customize the behavior of AvaTax to match specific rules that are custom to your
      # business. If you have obtained a ruling from a tax auditor that requires custom tax calculations, you can use
      # custom tax rules to redefine the behavior for your company or item.
      #
      # Please use custom tax rules carefully and ensure that these tax rules match the behavior agreed upon with your
      # auditor, legal representative, and accounting team.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this tax rule
      # @param id [Integer] The primary key of this tax rule
      # @return [Object]
      def get_tax_rule(companyId, id)        path = "/api/v2/companies/#{companyId}/taxrules/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve tax rules for this company
      #
      # List all taxrule objects attached to this company.
      #
      # A tax rule represents a rule that changes the default AvaTax behavior for a product or jurisdiction. Custom tax rules
      # can be used to change the taxability of an item, to change the tax base of an item, or to change the tax rate
      # charged when selling an item. Tax rules can also change tax behavior depending on the `entityUseCode` value submitted
      # with the transaction.
      #
      # You can create custom tax rules to customize the behavior of AvaTax to match specific rules that are custom to your
      # business. If you have obtained a ruling from a tax auditor that requires custom tax calculations, you can use
      # custom tax rules to redefine the behavior for your company or item.
      #
      # Please use custom tax rules carefully and ensure that these tax rules match the behavior agreed upon with your
      # auditor, legal representative, and accounting team.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns these tax rules
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, taxTypeCode, taxRuleProductDetail, rateTypeCode, taxTypeGroup, taxSubType, unitOfBasis
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_tax_rules(companyId, options={})        path = "/api/v2/companies/#{companyId}/taxrules"
        get(path, options, "22.6.1")      end

      # Retrieve all tax rules
      #
      # Get multiple taxrule objects across all companies.
      #
      # A tax rule represents a rule that changes the default AvaTax behavior for a product or jurisdiction. Custom tax rules
      # can be used to change the taxability of an item, to change the tax base of an item, or to change the tax rate
      # charged when selling an item. Tax rules can also change tax behavior depending on the `entityUseCode` value submitted
      # with the transaction.
      #
      # You can create custom tax rules to customize the behavior of AvaTax to match specific rules that are custom to your
      # business. If you have obtained a ruling from a tax auditor that requires custom tax calculations, you can use
      # custom tax rules to redefine the behavior for your company or item.
      #
      # Please use custom tax rules carefully and ensure that these tax rules match the behavior agreed upon with your
      # auditor, legal representative, and accounting team.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, taxTypeCode, taxRuleProductDetail, rateTypeCode, taxTypeGroup, taxSubType, unitOfBasis
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_tax_rules(options={})        path = "/api/v2/taxrules"
        get(path, options, "22.6.1")      end

      # Update a single tax rule
      #
      # Replace the existing custom tax rule object at this URL with an updated object.
      #
      # A tax rule represents a rule that changes the default AvaTax behavior for a product or jurisdiction. Custom tax rules
      # can be used to change the taxability of an item, to change the tax base of an item, or to change the tax rate
      # charged when selling an item. Tax rules can also change tax behavior depending on the `entityUseCode` value submitted
      # with the transaction.
      #
      # You can create custom tax rules to customize the behavior of AvaTax to match specific rules that are custom to your
      # business. If you have obtained a ruling from a tax auditor that requires custom tax calculations, you can use
      # custom tax rules to redefine the behavior for your company or item.
      #
      # Please use custom tax rules carefully and ensure that these tax rules match the behavior agreed upon with your
      # auditor, legal representative, and accounting team.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that this tax rule belongs to.
      # @param id [Integer] The ID of the tax rule you wish to update
      # @param model [Object] The tax rule you wish to update.
      # @return [Object]
      def update_tax_rule(companyId, id, model)        path = "/api/v2/companies/#{companyId}/taxrules/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end