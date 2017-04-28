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
      # @param int $accountId The ID of the account that owns this override
      # @param JurisdictionOverrideModel[] $model The jurisdiction override objects to create
      # @return JurisdictionOverrideModel[]
      def createJurisdictionOverrides($accountId, $model)
        path = '/api/v2/accounts/#{accountId}/jurisdictionoverrides';
        post (path)
      end


      # Delete a single override
      # 
      # Marks the item object at this URL as deleted.
      # 
      # @param int $accountId The ID of the account that owns this override
      # @param int $id The ID of the override you wish to delete
      # @return ErrorDetail[]
      def deleteJurisdictionOverride($accountId, $id)
        path = '/api/v2/accounts/#{accountId}/jurisdictionoverrides/#{id}';
        delete (path)
      end


      # Retrieve a single override
      # 
      # Get the item object identified by this URL.
      # 
      # A Jurisdiction Override is a configuration setting that allows you to select the taxing
      # jurisdiction for a specific address. If you encounter an address that is on the boundary
      # between two different jurisdictions, you can choose to set up a jurisdiction override
      # to switch this address to use different taxing jurisdictions.
      # 
      # @param int $accountId The ID of the account that owns this override
      # @param int $id The primary key of this override
      # @return JurisdictionOverrideModel
      def getJurisdictionOverride($accountId, $id)
        path = '/api/v2/accounts/#{accountId}/jurisdictionoverrides/#{id}';
        get (path)
      end


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
      # @param int $accountId The ID of the account that owns this override
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def listJurisdictionOverridesByAccount($accountId, $filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/accounts/#{accountId}/jurisdictionoverrides';
        get (path)
      end


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
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def queryJurisdictionOverrides($filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/jurisdictionoverrides';
        get (path)
      end


      # Update a single jurisdictionoverride
      # 
      # Replace the existing jurisdictionoverride object at this URL with an updated object.
      # 
      # @param int $accountId The ID of the account that this jurisdictionoverride belongs to.
      # @param int $id The ID of the jurisdictionoverride you wish to update
      # @param JurisdictionOverrideModel $model The jurisdictionoverride object you wish to update.
      # @return JurisdictionOverrideModel
      def updateJurisdictionOverride($accountId, $id, $model)
        path = '/api/v2/accounts/#{accountId}/jurisdictionoverrides/#{id}';
        put (path)
      end

    end
  end
end