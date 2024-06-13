module AvaTax
  class Client
    module GLAccount 


      # Bulk upload GL accounts
      #
      # Allows a bulk upload of GL accounts for the specified company. Use the companyid path parameter to identify the company for which the GL accounts should be uploaded.
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this GL account object
      # @param model [Object] The GL account bulk upload model.
      # @return [Object]
      def bulk_upload_g_l_accounts(companyid, model)        path = "/api/v2/companies/#{companyid}/glaccounts/$upload"
        post(path, model, {}, AvaTax::VERSION)      end

      # Create a new GL account
      #
      # Creates one or more new GL account objects attached to this company.
      #
      # A GL account is a general ledger account that can be passed to transactions at the line level to apply the multiple rules of the transactions, including exemptions, allocations, etc. to a specific general ledger.
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this GL Account object
      # @param model [Object] The GL Account you want to create
      # @return [Object]
      def create_g_l_account(companyid, model)        path = "/api/v2/companies/#{companyid}/glaccounts"
        post(path, model, {}, AvaTax::VERSION)      end

      # Delete the GL account associated with the given company ID and GL account ID
      #
      # Deletes the GL account associated with the specified `glaccountid` and `companyid`
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this GL account object
      # @param glaccountid [Integer] The primary key of this GL account
      # @return [Object]
      def delete_g_l_account(companyid, glaccountid)        path = "/api/v2/companies/#{companyid}/glaccounts/#{glaccountid}"
        delete(path, {}, AvaTax::VERSION)      end

      # Retrieve a single GL account
      #
      # Retrieve details of a single GL account identified by its `glaccountid` and `companyid`
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this GL account object
      # @param glaccountid [Integer] The primary key of this GL account
      # @return [Object]
      def get_g_l_account_by_id(companyid, glaccountid)        path = "/api/v2/companies/#{companyid}/glaccounts/#{glaccountid}"
        get(path, {}, AvaTax::VERSION)      end

      # Retrieve GL accounts for this company
      #
      # Retrieves a list of GL accounts attached to this company. You can apply filters to retrieve specific records.
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns these GL accounts
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* companyId, meta, defaultItem
      # @param include [String] A comma separated list of objects to fetch underneath this company. Any object with a URL path underneath this company can be fetched by specifying its name.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_g_l_accounts_by_company(companyid, options={})        path = "/api/v2/companies/#{companyid}/glaccounts"
        get(path, options, AvaTax::VERSION)      end

      # Update a single GL account
      #
      # Updates a single GL account owned by the company. Use the glaccountid path parameter to identify the GL account to update.
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this GL Account object
      # @param glaccountid [Integer] The primary key of this GL Account
      # @param model [Object] The GL account object you want to update
      # @return [Object]
      def update_g_l_account(companyid, glaccountid, model)        path = "/api/v2/companies/#{companyid}/glaccounts/#{glaccountid}"
        put(path, model, {}, AvaTax::VERSION)      end
    end
  end
end