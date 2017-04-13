module AvaTax
  class Client
    module Nexus 


      # Create a new nexus
      # 
      # Creates one or more new nexus objects attached to this company.
      # The concept of 'Nexus' indicates a place where your company has sufficient physical presence and is obligated
      # to collect and remit transaction-based taxes.
      # When defining companies in AvaTax, you must declare nexus for your company in order to correctly calculate tax
      # in all jurisdictions affected by your transactions.
      # Note that not all fields within a nexus can be updated; Avalara publishes a list of all defined nexus at the
      # '/api/v2/definitions/nexus' endpoint.
      # You may only define nexus matching the official list of declared nexus.
      # 
     * @param NexusModel[] $model The nexus you wish to create.
      # @return NexusModel[]
      def createNexus($companyId, $model)
        path = '/api/v2/companies/#{companyId}/nexus';
        post (path)
      end


      # Delete a single nexus
      # 
      # Marks the existing nexus object at this URL as deleted.
      # 
      # @return ErrorDetail[]
      def deleteNexus($companyId, $id)
        path = '/api/v2/companies/#{companyId}/nexus/#{id}';
        delete (path)
      end


      # Retrieve a single nexus
      # 
      # Get the nexus object identified by this URL.
      # The concept of 'Nexus' indicates a place where your company has sufficient physical presence and is obligated
      # to collect and remit transaction-based taxes.
      # When defining companies in AvaTax, you must declare nexus for your company in order to correctly calculate tax
      # in all jurisdictions affected by your transactions.
      # 
      # @return NexusModel
      def getNexus($companyId, $id)
        path = '/api/v2/companies/#{companyId}/nexus/#{id}';
        get (path)
      end


      # List company nexus related to a tax form
      # 
      # Retrieves a list of nexus related to a tax form.
      # 
      # The concept of `Nexus` indicates a place where your company has sufficient physical presence and is obligated
      # to collect and remit transaction-based taxes.
      # 
      # When defining companies in AvaTax, you must declare nexus for your company in order to correctly calculate tax
      # in all jurisdictions affected by your transactions.
      # 
      # This API is intended to provide useful information when examining a tax form. If you are about to begin filing
      # a tax form, you may want to know whether you have declared nexus in all the jurisdictions related to that tax 
      # form in order to better understand how the form will be filled out.
      # 
      # @return NexusByTaxFormModel
      def getNexusByFormCode($companyId, $formCode)
        path = '/api/v2/companies/#{companyId}/nexus/byform/#{formCode}';
        get (path)
      end


      # Retrieve nexus for this company
      # 
      # List all nexus objects defined for this company.
      # The concept of 'Nexus' indicates a place where your company has sufficient physical presence and is obligated
      # to collect and remit transaction-based taxes.
      # When defining companies in AvaTax, you must declare nexus for your company in order to correctly calculate tax
      # in all jurisdictions affected by your transactions.
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
      def listNexusByCompany($companyId, $filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/companies/#{companyId}/nexus';
        get (path)
      end


      # Retrieve all nexus
      # 
      # Get multiple nexus objects across all companies.
      # The concept of 'Nexus' indicates a place where your company has sufficient physical presence and is obligated
      # to collect and remit transaction-based taxes.
      # When defining companies in AvaTax, you must declare nexus for your company in order to correctly calculate tax
      # in all jurisdictions affected by your transactions.
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
      def queryNexus($filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/nexus';
        get (path)
      end


      # Update a single nexus
      # 
      # Replace the existing nexus object at this URL with an updated object.
      # The concept of 'Nexus' indicates a place where your company has sufficient physical presence and is obligated
      # to collect and remit transaction-based taxes.
      # When defining companies in AvaTax, you must declare nexus for your company in order to correctly calculate tax
      # in all jurisdictions affected by your transactions.
      # Note that not all fields within a nexus can be updated; Avalara publishes a list of all defined nexus at the
      # '/api/v2/definitions/nexus' endpoint.
      # You may only define nexus matching the official list of declared nexus.
      # All data from the existing object will be replaced with data in the object you PUT. 
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # 
     * @param NexusModel $model The nexus object you wish to update.
      # @return NexusModel
      def updateNexus($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/nexus/#{id}';
        put (path)
      end

    end
  end
end