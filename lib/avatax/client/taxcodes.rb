module AvaTax
  class Client
    module TaxCodes 


      # Create a new tax code
      # 
      # Create one or more new taxcode objects attached to this company.
      # A 'TaxCode' represents a uniquely identified type of product, good, or service.
      # Avalara supports correct tax rates and taxability rules for all TaxCodes in all supported jurisdictions.
      # If you identify your products by tax code in your 'Create Transacion' API calls, Avalara will correctly calculate tax rates and
      # taxability rules for this product in all supported jurisdictions.
      # 
     * @param TaxCodeModel[] $model The tax code you wish to create.
      # @return TaxCodeModel[]
      def createTaxCodes($companyId, $model)
        path = '/api/v2/companies/#{companyId}/taxcodes';
        post (path)
      end


      # Delete a single tax code
      # 
      # Marks the existing TaxCode object at this URL as deleted.
      # 
      # @return ErrorDetail[]
      def deleteTaxCode($companyId, $id)
        path = '/api/v2/companies/#{companyId}/taxcodes/#{id}';
        delete (path)
      end


      # Retrieve a single tax code
      # 
      # Get the taxcode object identified by this URL.
      # A 'TaxCode' represents a uniquely identified type of product, good, or service.
      # Avalara supports correct tax rates and taxability rules for all TaxCodes in all supported jurisdictions.
      # If you identify your products by tax code in your 'Create Transacion' API calls, Avalara will correctly calculate tax rates and
      # taxability rules for this product in all supported jurisdictions.
      # 
      # @return TaxCodeModel
      def getTaxCode($companyId, $id)
        path = '/api/v2/companies/#{companyId}/taxcodes/#{id}';
        get (path)
      end


      # Retrieve tax codes for this company
      # 
      # List all taxcode objects attached to this company.
      # A 'TaxCode' represents a uniquely identified type of product, good, or service.
      # Avalara supports correct tax rates and taxability rules for all TaxCodes in all supported jurisdictions.
      # If you identify your products by tax code in your 'Create Transacion' API calls, Avalara will correctly calculate tax rates and
      # taxability rules for this product in all supported jurisdictions.
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
      def listTaxCodesByCompany($companyId, $filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/companies/#{companyId}/taxcodes';
        get (path)
      end


      # Retrieve all tax codes
      # 
      # Get multiple taxcode objects across all companies.
      # A 'TaxCode' represents a uniquely identified type of product, good, or service.
      # Avalara supports correct tax rates and taxability rules for all TaxCodes in all supported jurisdictions.
      # If you identify your products by tax code in your 'Create Transacion' API calls, Avalara will correctly calculate tax rates and
      # taxability rules for this product in all supported jurisdictions.
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
      def queryTaxCodes($filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/taxcodes';
        get (path)
      end


      # Update a single tax code
      # 
      # Replace the existing taxcode object at this URL with an updated object.
      # A 'TaxCode' represents a uniquely identified type of product, good, or service.
      # Avalara supports correct tax rates and taxability rules for all TaxCodes in all supported jurisdictions.
      # If you identify your products by tax code in your 'Create Transacion' API calls, Avalara will correctly calculate tax rates and
      # taxability rules for this product in all supported jurisdictions.
      # All data from the existing object will be replaced with data in the object you PUT. 
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # 
     * @param TaxCodeModel $model The tax code you wish to update.
      # @return TaxCodeModel
      def updateTaxCode($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/taxcodes/#{id}';
        put (path)
      end

    end
  end
end