module AvaTax
  class Client
    module Upcs 


      # Create a new UPC
      #
      # Create one or more new UPC objects attached to this company.
      # A UPC represents a single UPC code in your catalog and matches this product to the tax code identified by this UPC.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaUpc.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this UPC.
      # @param model [UPCModel[]] The UPC you wish to create.
      # @return [UPCModel[]]
      def create_u_p_cs(companyId, model)        path = "/api/v2/companies/#{companyId}/upcs"
        post(path, model, {}, "22.6.1")      end

      # Delete a single UPC
      #
      # Marks the UPC object identified by this URL as deleted.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaUpc.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this UPC.
      # @param id [Integer] The ID of the UPC you wish to delete.
      # @return [ErrorDetail[]]
      def delete_u_p_c(companyId, id)        path = "/api/v2/companies/#{companyId}/upcs/#{id}"
        delete(path, {}, "22.6.1")      end

      # Retrieve a single UPC
      #
      # Get the UPC object identified by this URL.
      # A UPC represents a single UPC code in your catalog and matches this product to the tax code identified by this UPC.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaUpc.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this UPC
      # @param id [Integer] The primary key of this UPC
      # @return [Object]
      def get_u_p_c(companyId, id)        path = "/api/v2/companies/#{companyId}/upcs/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve UPCs for this company
      #
      # List all UPC objects attached to this company.
      # A UPC represents a single UPC code in your catalog and matches this product to the tax code identified by this UPC.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaUpc.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns these UPCs
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_u_p_cs_by_company(companyId, options={})        path = "/api/v2/companies/#{companyId}/upcs"
        get(path, options, "22.6.1")      end

      # Retrieve all UPCs
      #
      # Get multiple UPC objects across all companies.
      # A UPC represents a single UPC code in your catalog and matches this product to the tax code identified by this UPC.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaUpc.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_u_p_cs(options={})        path = "/api/v2/upcs"
        get(path, options, "22.6.1")      end

      # Update a single UPC
      #
      # Replace the existing UPC object at this URL with an updated object.
      # A UPC represents a single UPC code in your catalog and matches this product to the tax code identified by this UPC.
      # All data from the existing object will be replaced with data in the object you PUT.
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaUpc.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that this UPC belongs to.
      # @param id [Integer] The ID of the UPC you wish to update
      # @param model [Object] The UPC you wish to update.
      # @return [Object]
      def update_u_p_c(companyId, id, model)        path = "/api/v2/companies/#{companyId}/upcs/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end