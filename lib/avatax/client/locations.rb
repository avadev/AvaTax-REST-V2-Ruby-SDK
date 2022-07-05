module AvaTax
  class Client
    module Locations 


      # Add parameters to a location.
      #
      # Add parameters to a location.
      #
      # Some locations can be taxed differently depending on the properties of that location. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a location will be used by default in tax calculation but will not show on the transaction line referencing the location.
      #
      # A parameter specified on a transaction line will override a location parameter if they share the same parameter name.
      #
      # To see available parameters for this location, call `/api/v2/definitions/parameters?$filter=attributeType eq Company`
      #
      # Some parameters are only available for use if you have subscribed to specific AvaTax services. To see which parameters you are able to use, add the query parameter "$showSubscribed=true" to the parameter definition call above.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPAdmin, CSPTester, FirmAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this location parameter.
      # @param locationId [Integer] The location id.
      # @param model [LocationParameterModel[]] The location parameters you wish to create.
      # @return [LocationParameterModel[]]
      def create_location_parameters(companyId, locationId, model)        path = "/api/v2/companies/#{companyId}/locations/#{locationId}/parameters"
        post(path, model, {}, "22.6.1")      end

      # Create a new location
      #
      # Create one or more new location objects attached to this company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPAdmin, CSPTester, FirmAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this location.
      # @param model [LocationModel[]] The location you wish to create.
      # @return [LocationModel[]]
      def create_locations(companyId, model)        path = "/api/v2/companies/#{companyId}/locations"
        post(path, model, {}, "22.6.1")      end

      # Delete a single location
      #
      # Mark the location object at this URL as deleted.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPAdmin, CSPTester, FirmAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this location.
      # @param id [Integer] The ID of the location you wish to delete.
      # @return [ErrorDetail[]]
      def delete_location(companyId, id)        path = "/api/v2/companies/#{companyId}/locations/#{id}"
        delete(path, {}, "22.6.1")      end

      # Delete a single location parameter
      #
      # Delete a single location parameter.
      #
      # Some locations can be taxed differently depending on the properties of that location. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a location will be used by default in tax calculation but will not show on the transaction line referencing the location.
      #
      # A parameter specified on a transaction line will override a location parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPAdmin, CSPTester, FirmAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param locationId [Integer] The location id
      # @param id [Integer] The parameter id
      # @return [ErrorDetail[]]
      def delete_location_parameter(companyId, locationId, id)        path = "/api/v2/companies/#{companyId}/locations/#{locationId}/parameters/#{id}"
        delete(path, {}, "22.6.1")      end

      # Retrieve a single location
      #
      # Get the location object identified by this URL.
      # An 'Location' represents a physical address where a company does business.
      # Many taxing authorities require that you define a list of all locations where your company does business.
      # These locations may require additional custom configuration or tax registration with these authorities.
      # For more information on metadata requirements, see the '/api/v2/definitions/locationquestions' API.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * LocationSettings
      # * parameters
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this location
      # @param id [Integer] The primary key of this location
      # @param include [String] A comma separated list of additional data to retrieve.
      # @return [Object]
      def get_location(companyId, id, options={})        path = "/api/v2/companies/#{companyId}/locations/#{id}"
        get(path, options, "22.6.1")      end

      # Retrieve a single company location parameter
      #
      # Retrieve a single location parameter.
      #
      # Some locations can be taxed differently depending on the properties of that location. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a location will be used by default in tax calculation but will not show on the transaction line referencing the location.
      #
      # A parameter specified on a transaction line will override a location parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param locationId [Integer] The location id
      # @param id [Integer] The parameter id
      # @return [Object]
      def get_location_parameter(companyId, locationId, id)        path = "/api/v2/companies/#{companyId}/locations/#{locationId}/parameters/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve parameters for a location
      #
      # List parameters for a location.
      #
      # Some locations can be taxed differently depending on the properties of that location. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a location will be used by default in tax calculation but will not show on the transaction line referencing the location.
      #
      # A parameter specified on a transaction line will override a location parameter if they share the same parameter name.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param locationId [Integer] The ID of the location
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* name, unit
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_location_parameters(companyId, locationId, options={})        path = "/api/v2/companies/#{companyId}/locations/#{locationId}/parameters"
        get(path, options, "22.6.1")      end

      # Retrieve locations for this company
      #
      # List all location objects defined for this company.
      # An 'Location' represents a physical address where a company does business.
      # Many taxing authorities require that you define a list of all locations where your company does business.
      # These locations may require additional custom configuration or tax registration with these authorities.
      # For more information on metadata requirements, see the '/api/v2/definitions/locationquestions' API.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * LocationSettings
      # * parameters
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns these locations
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* isMarketplaceOutsideUsa, settings, parameters
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_locations_by_company(companyId, options={})        path = "/api/v2/companies/#{companyId}/locations"
        get(path, options, "22.6.1")      end

      # Retrieve all locations
      #
      # Get multiple location objects across all companies.
      # An 'Location' represents a physical address where a company does business.
      # Many taxing authorities require that you define a list of all locations where your company does business.
      # These locations may require additional custom configuration or tax registration with these authorities.
      # For more information on metadata requirements, see the '/api/v2/definitions/locationquestions' API.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * LocationSettings
      # * parameters
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* isMarketplaceOutsideUsa, settings, parameters
      # @param include [String] A comma separated list of additional data to retrieve. You may specify `LocationSettings` to retrieve location settings.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_locations(options={})        path = "/api/v2/locations"
        get(path, options, "22.6.1")      end

      # Update a single location
      #
      # Replace the existing location object at this URL with an updated object.
      # All data from the existing object will be replaced with data in the object you PUT.
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPAdmin, CSPTester, FirmAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that this location belongs to.
      # @param id [Integer] The ID of the location you wish to update
      # @param model [Object] The location you wish to update.
      # @return [Object]
      def update_location(companyId, id, model)        path = "/api/v2/companies/#{companyId}/locations/#{id}"
        put(path, model, {}, "22.6.1")      end

      # Update a location parameter
      #
      # Update a location parameter.
      #
      # Some locations can be taxed differently depending on the properties of that location. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a location will be used by default in tax calculation but will not show on the transaction line referencing the location.
      #
      # A parameter specified on a transaction line will override a location parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPAdmin, CSPTester, FirmAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param locationId [Integer] The location id
      # @param id [Integer] The location parameter id
      # @param model [Object] The location parameter object you wish to update.
      # @return [Object]
      def update_location_parameter(companyId, locationId, id, model)        path = "/api/v2/companies/#{companyId}/locations/#{locationId}/parameters/#{id}"
        put(path, model, {}, "22.6.1")      end

      # Validate the location against local requirements
      #
      # Returns validation information for this location.
      # This API call is intended to compare this location against the currently known taxing authority rules and regulations,
      # and provide information about what additional work is required to completely setup this location.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this location
      # @param id [Integer] The primary key of this location
      # @return [Object]
      def validate_location(companyId, id)        path = "/api/v2/companies/#{companyId}/locations/#{id}/validate"
        get(path, {}, "22.6.1")      end
    end
  end
end