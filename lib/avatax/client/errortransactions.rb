module AvaTax
  class Client
    module ErrorTransactions 


      # Delete a batch of error transactions
      #
      # Delete a batch of error transactions attached to a company.
      #
      # If any of the provided error transaction isn't found then it'll be treated as a success.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ProStoresOperator, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param model [Object] The request that contains error transactions to be deleted
      # @return [Object]
      def delete_error_transactions(model)
        path = "/api/v2/errortransactions"
        delete(path, model)
      end


      # Retrieve list of error transactions
      #
      # List error transactions attached to this company. Results are dependent on `$filter` if provided.
      #
      # This endpoint is limited to returning 250 error transactions at a time maximum.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ProStoresOperator, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyCode [String] The company code to filter on. This query parameter is required.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* companyId, avataxErrorJson, avataxCreateTransactionJson
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_error_transactions(options={})
        path = "/api/v2/errortransactions"
        get(path, options)
      end

    end
  end
end