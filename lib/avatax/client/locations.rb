module AvaTax
  class Client
    module Locations 


      # Point of sale data file generation
      # 
      # Builds a point-of-sale data file containing tax rates and rules for this location, containing tax rates for all
      # items defined for this company. This data file can be used to correctly calculate tax in the event a 
      # point-of-sale device is not able to reach AvaTax.
      # This data file can be customized for specific partner devices and usage conditions.
      # The result of this API is the file you requested in the format you requested using the 'responseType' field.
      # This API builds the file on demand, and is limited to a maximum of 7500 items.
      # 
      # @param int $companyId The ID number of the company that owns this location.
      # @param int $id The ID number of the location to retrieve point-of-sale data.
      # @param string $date The date for which point-of-sale data would be calculated (today by default)
      # @param string $format The format of the file (JSON by default) (See PointOfSaleFileType::* for a list of allowable values)
      # @param string $partnerId If specified, requests a custom partner-formatted version of the file. (See PointOfSalePartnerId::* for a list of allowable values)
      # @param boolean $includeJurisCodes When true, the file will include jurisdiction codes in the result.
      # @return FileResult
      def buildPointOfSaleDataForLocation($companyId, $id, $date, $format, $partnerId, $includeJurisCodes)
        path = '/api/v2/companies/#{companyId}/locations/#{id}/pointofsaledata';
        get (path)
      end


      # Create a new location
      # 
      # Create one or more new location objects attached to this company.
      # 
      # @param int $companyId The ID of the company that owns this location.
      # @param LocationModel[] $model The location you wish to create.
      # @return LocationModel[]
      def createLocations($companyId, $model)
        path = '/api/v2/companies/#{companyId}/locations';
        post (path)
      end


      # Delete a single location
      # 
      # Mark the location object at this URL as deleted.
      # 
      # @param int $companyId The ID of the company that owns this location.
      # @param int $id The ID of the location you wish to delete.
      # @return ErrorDetail[]
      def deleteLocation($companyId, $id)
        path = '/api/v2/companies/#{companyId}/locations/#{id}';
        delete (path)
      end


      # Retrieve a single location
      # 
      # Get the location object identified by this URL.
      # An 'Location' represents a physical address where a company does business.
      # Many taxing authorities require that you define a list of all locations where your company does business.
      # These locations may require additional custom configuration or tax registration with these authorities.
      # For more information on metadata requirements, see the '/api/v2/definitions/locationquestions' API.
      # 
      # @param int $companyId The ID of the company that owns this location
      # @param int $id The primary key of this location
      # @return LocationModel
      def getLocation($companyId, $id)
        path = '/api/v2/companies/#{companyId}/locations/#{id}';
        get (path)
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
      # 
      # @param int $companyId The ID of the company that owns these locations
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def listLocationsByCompany($companyId, $filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/companies/#{companyId}/locations';
        get (path)
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
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def queryLocations($filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/locations';
        get (path)
      end


      # Update a single location
      # 
      # Replace the existing location object at this URL with an updated object.
      # All data from the existing object will be replaced with data in the object you PUT. 
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # 
      # @param int $companyId The ID of the company that this location belongs to.
      # @param int $id The ID of the location you wish to update
      # @param LocationModel $model The location you wish to update.
      # @return LocationModel
      def updateLocation($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/locations/#{id}';
        put (path)
      end


      # Validate the location against local requirements
      # 
      # Returns validation information for this location.
      # This API call is intended to compare this location against the currently known taxing authority rules and regulations,
      # and provide information about what additional work is required to completely setup this location.
      # 
      # @param int $companyId The ID of the company that owns this location
      # @param int $id The primary key of this location
      # @return LocationValidationModel
      def validateLocation($companyId, $id)
        path = '/api/v2/companies/#{companyId}/locations/#{id}/validate';
        get (path)
      end

    end
  end
end