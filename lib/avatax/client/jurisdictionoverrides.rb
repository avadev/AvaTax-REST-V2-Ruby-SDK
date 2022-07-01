module AvaTax
  class Client
    module JurisdictionOverrides 


      # Create one or more overrides
      #
      # Creates one or more jurisdiction override objects for this account.
      #
      # A Jurisdiction Override is a configuration setting that allows you to select the taxing
      # jurisdiction for a specific address. If you encounter an address that is on the boundary
      # between two different jurisdictions, you can choose to set up a jurisdiction override
      # to switch this address to use different taxing jurisdictions.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The ID of the account that owns this override
      # @param model [JurisdictionOverrideModel[]] The jurisdiction override objects to create
      # @return [JurisdictionOverrideModel[]]
      def create_jurisdiction_overrides(accountId, model)        path = "/api/v2/accounts/#{accountId}/jurisdictionoverrides"
        post(path, model, {}, "22.6.1")      end

      # Delete a single override
      #
      # Marks the item object at this URL as deleted.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The ID of the account that owns this override
      # @param id [Integer] The ID of the override you wish to delete
      # @return [ErrorDetail[]]
      def delete_jurisdiction_override(accountId, id)        path = "/api/v2/accounts/#{accountId}/jurisdictionoverrides/#{id}"
        delete(path, {}, "22.6.1")      end

      # Retrieve a single override
      #
      # Get the item object identified by this URL.
      #
      # A Jurisdiction Override is a configuration setting that allows you to select the taxing
      # jurisdiction for a specific address. If you encounter an address that is on the boundary
      # between two different jurisdictions, you can choose to set up a jurisdiction override
      # to switch this address to use different taxing jurisdictions.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The ID of the account that owns this override
      # @param id [Integer] The primary key of this override
      # @return [Object]
      def get_jurisdiction_override(accountId, id)        path = "/api/v2/accounts/#{accountId}/jurisdictionoverrides/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve overrides for this account
      #
      # List all jurisdiction override objects defined for this account.
      #
      # A Jurisdiction Override is a configuration setting that allows you to select the taxing
      # jurisdiction for a specific address. If you encounter an address that is on the boundary
      # between two different jurisdictions, you can choose to set up a jurisdiction override
      # to switch this address to use different taxing jurisdictions.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The ID of the account that owns this override
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* country, Jurisdictions
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_jurisdiction_overrides_by_account(accountId, options={})        path = "/api/v2/accounts/#{accountId}/jurisdictionoverrides"
        get(path, options, "22.6.1")      end

      # Retrieve all overrides
      #
      # Get multiple jurisdiction override objects across all companies.
      #
      # A Jurisdiction Override is a configuration setting that allows you to select the taxing
      # jurisdiction for a specific address. If you encounter an address that is on the boundary
      # between two different jurisdictions, you can choose to set up a jurisdiction override
      # to switch this address to use different taxing jurisdictions.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* country, Jurisdictions
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_jurisdiction_overrides(options={})        path = "/api/v2/jurisdictionoverrides"
        get(path, options, "22.6.1")      end

      # Update a single jurisdictionoverride
      #
      # Replace the existing jurisdictionoverride object at this URL with an updated object.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The ID of the account that this jurisdictionoverride belongs to.
      # @param id [Integer] The ID of the jurisdictionoverride you wish to update
      # @param model [Object] The jurisdictionoverride object you wish to update.
      # @return [Object]
      def update_jurisdiction_override(accountId, id, model)        path = "/api/v2/accounts/#{accountId}/jurisdictionoverrides/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end