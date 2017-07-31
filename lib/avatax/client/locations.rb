module AvaTax
  class Client
    module Locations 


      # Create a new location
      #
      # Create one or more new location objects attached to this company.
      # @param companyId [Integer] The ID of the company that owns this location.
      # @param model [object[]] The location you wish to create.
      # @return [object[]]
      def create_locations(companyId, model)
        path = "/api/v2/companies/#{companyId}/locations"
        post(path, model)
      end


      # Delete a single location
      #
      # Mark the location object at this URL as deleted.
      # @param companyId [Integer] The ID of the company that owns this location.
      # @param id [Integer] The ID of the location you wish to delete.
      # @return [object[]]
      def delete_location(companyId, id)
        path = "/api/v2/companies/#{companyId}/locations/#{id}"
        delete(path)
      end


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
      # @param companyId [Integer] The ID of the company that owns this location
      # @param id [Integer] The primary key of this location
      # @param include [String] A comma separated list of child objects to return underneath the primary object.
      # @return [Object]
      def get_location(companyId, id, options={})
        path = "/api/v2/companies/#{companyId}/locations/#{id}"
        get(path, options)
      end


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
      # @param companyId [Integer] The ID of the company that owns these locations
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param include [String] A comma separated list of child objects to return underneath the primary object.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_locations_by_company(companyId, options={})
        path = "/api/v2/companies/#{companyId}/locations"
        get(path, options)
      end


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
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param include [String] A comma separated list of child objects to return underneath the primary object.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_locations(options={})
        path = "/api/v2/locations"
        get(path, options)
      end


      # Update a single location
      #
      # Replace the existing location object at this URL with an updated object.
      # All data from the existing object will be replaced with data in the object you PUT.
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # @param companyId [Integer] The ID of the company that this location belongs to.
      # @param id [Integer] The ID of the location you wish to update
      # @param model [Object] The location you wish to update.
      # @return [Object]
      def update_location(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/locations/#{id}"
        put(path, model)
      end


      # Validate the location against local requirements
      #
      # Returns validation information for this location.
      # This API call is intended to compare this location against the currently known taxing authority rules and regulations,
      # and provide information about what additional work is required to completely setup this location.
      # @param companyId [Integer] The ID of the company that owns this location
      # @param id [Integer] The primary key of this location
      # @return [Object]
      def validate_location(companyId, id)
        path = "/api/v2/companies/#{companyId}/locations/#{id}/validate"
        get(path)
      end

    end
  end
end