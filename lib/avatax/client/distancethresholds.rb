module AvaTax
  class Client
    module DistanceThresholds 


      # Create one or more DistanceThreshold objects
      #
      # Create one or more DistanceThreshold objects for this company.
      #
      # A company-distance-threshold model indicates the distance between a company
      # and the taxing borders of various countries. Distance thresholds are necessary
      # to correctly calculate some value-added taxes.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that owns this DistanceThreshold
      # @param model [CompanyDistanceThresholdModel[]] The DistanceThreshold object or objects you wish to create.
      # @return [CompanyDistanceThresholdModel[]]
      def create_distance_threshold(companyId, model)        path = "/api/v2/companies/#{companyId}/distancethresholds"
        post(path, model, {}, "22.6.1")      end

      # Delete a single DistanceThreshold object
      #
      # Marks the DistanceThreshold object identified by this URL as deleted.
      #
      # A company-distance-threshold model indicates the distance between a company
      # and the taxing borders of various countries. Distance thresholds are necessary
      # to correctly calculate some value-added taxes.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that owns this DistanceThreshold
      # @param id [Integer] The unique ID number of the DistanceThreshold object you wish to delete.
      # @return [ErrorDetail[]]
      def delete_distance_threshold(companyId, id)        path = "/api/v2/companies/#{companyId}/distancethresholds/#{id}"
        delete(path, {}, "22.6.1")      end

      # Retrieve a single DistanceThreshold
      #
      # Retrieves a single DistanceThreshold object defined by this URL.
      #
      # A company-distance-threshold model indicates the distance between a company
      # and the taxing borders of various countries. Distance thresholds are necessary
      # to correctly calculate some value-added taxes.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this DistanceThreshold object
      # @param id [Integer] The unique ID number referring to this DistanceThreshold object
      # @return [Object]
      def get_distance_threshold(companyId, id)        path = "/api/v2/companies/#{companyId}/distancethresholds/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve all DistanceThresholds for this company.
      #
      # Lists all DistanceThreshold objects that belong to this company.
      #
      # A company-distance-threshold model indicates the distance between a company
      # and the taxing borders of various countries. Distance thresholds are necessary
      # to correctly calculate some value-added taxes.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company whose DistanceThreshold objects you wish to list.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_distance_thresholds(companyId, options={})        path = "/api/v2/companies/#{companyId}/distancethresholds"
        get(path, options, "22.6.1")      end

      # Retrieve all DistanceThreshold objects
      #
      # Lists all DistanceThreshold objects that belong to this account.
      #
      # A company-distance-threshold model indicates the distance between a company
      # and the taxing borders of various countries. Distance thresholds are necessary
      # to correctly calculate some value-added taxes.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_distance_thresholds(options={})        path = "/api/v2/distancethresholds"
        get(path, options, "22.6.1")      end

      # Update a DistanceThreshold object
      #
      # Replace the existing DistanceThreshold object at this URL with an updated object.
      #
      # A company-distance-threshold model indicates the distance between a company
      # and the taxing borders of various countries. Distance thresholds are necessary
      # to correctly calculate some value-added taxes.
      #
      # All data from the existing object will be replaced with data in the object you PUT.
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that owns this DistanceThreshold object.
      # @param id [Integer] The unique ID number of the DistanceThreshold object to replace.
      # @param model [Object] The new DistanceThreshold object to store.
      # @return [Object]
      def update_distance_threshold(companyId, id, model)        path = "/api/v2/companies/#{companyId}/distancethresholds/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end