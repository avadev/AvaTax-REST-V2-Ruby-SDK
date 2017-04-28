module AvaTax
  class Client
    module Upcs 


      # Create a new UPC
      # 
      # Create one or more new UPC objects attached to this company.
      # A UPC represents a single UPC code in your catalog and matches this product to the tax code identified by this UPC.
      # 
      # @param int $companyId The ID of the company that owns this UPC.
      # @param UPCModel[] $model The UPC you wish to create.
      # @return UPCModel[]
      def createUPCs($companyId, $model)
        path = '/api/v2/companies/#{companyId}/upcs';
        post (path)
      end


      # Delete a single UPC
      # 
      # Marks the UPC object identified by this URL as deleted.
      # 
      # @param int $companyId The ID of the company that owns this UPC.
      # @param int $id The ID of the UPC you wish to delete.
      # @return ErrorDetail[]
      def deleteUPC($companyId, $id)
        path = '/api/v2/companies/#{companyId}/upcs/#{id}';
        delete (path)
      end


      # Retrieve a single UPC
      # 
      # Get the UPC object identified by this URL.
      # A UPC represents a single UPC code in your catalog and matches this product to the tax code identified by this UPC.
      # 
      # @param int $companyId The ID of the company that owns this UPC
      # @param int $id The primary key of this UPC
      # @return UPCModel
      def getUPC($companyId, $id)
        path = '/api/v2/companies/#{companyId}/upcs/#{id}';
        get (path)
      end


      # Retrieve UPCs for this company
      # 
      # List all UPC objects attached to this company.
      # A UPC represents a single UPC code in your catalog and matches this product to the tax code identified by this UPC.
      # 
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # 
      # @param int $companyId The ID of the company that owns these UPCs
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def listUPCsByCompany($companyId, $filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/companies/#{companyId}/upcs';
        get (path)
      end


      # Retrieve all UPCs
      # 
      # Get multiple UPC objects across all companies.
      # A UPC represents a single UPC code in your catalog and matches this product to the tax code identified by this UPC.
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
      def queryUPCs($filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/upcs';
        get (path)
      end


      # Update a single UPC
      # 
      # Replace the existing UPC object at this URL with an updated object.
      # A UPC represents a single UPC code in your catalog and matches this product to the tax code identified by this UPC.
      # All data from the existing object will be replaced with data in the object you PUT. 
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # 
      # @param int $companyId The ID of the company that this UPC belongs to.
      # @param int $id The ID of the UPC you wish to update
      # @param UPCModel $model The UPC you wish to update.
      # @return UPCModel
      def updateUPC($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/upcs/#{id}';
        put (path)
      end

    end
  end
end