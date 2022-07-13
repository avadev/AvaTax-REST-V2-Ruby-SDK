module AvaTax
  class Client
    module Batches 


      # Cancel an in progress batch
      #
      # Marks the in progress batch identified by this URL as cancelled.
      #
      # Only JSON batches can be cancelled. If you attempt to cancel a file batch, you will receive an error message.
      #
      # Only in progress batches can be cancelled. If you attempt to cancel a batch that its status is not Waiting or Processing, you will receive an error message.
      # Cancelling an in progress batch does not delete any transactions that were created before the cancellation.
      #
      # Because the batch system processes with a degree of concurrency, and
      # because of batch sizes in the queue vary, AvaTax API is unable to accurately
      # predict when a batch will complete. If high performance processing is
      # required, please use the
      # [CreateTransaction API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/).
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this batch.
      # @param id [Integer] The ID of the batch to cancel.
      # @return [Object]
      def cancel_batch(companyId, id)        path = "/api/v2/companies/#{companyId}/batches/#{id}/cancel"
        post(path, {}, "22.6.1")      end

      # Create a new batch
      #
      # Create one or more new batch objects attached to this company.
      #
      # Each batch object may have one or more file objects (currently only one file is supported).
      #
      # When a batch is created, it is added to the AvaTax Batch Queue and will be
      # processed as quickly as possible in the order it was received. To check the
      # status of a batch, fetch the batch and retrieve the results of the batch
      # operation.
      #
      # Because the batch system processes with a degree of concurrency, and
      # because of batch sizes in the queue vary, AvaTax API is unable to accurately
      # predict when a batch will complete. If high performance processing is
      # required, please use the
      # [CreateTransaction API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/).
      #
      # The maximum content length of the request body is limited to 28.6 MB. If this limit
      # is exceeded, a 404 Not Found status will be returned (possibly with a CORS error if
      # the API is called from a browser). In this situation, please split the request into
      # smaller batches.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this batch.
      # @param model [BatchModel[]] The batch you wish to create.
      # @return [BatchModel[]]
      def create_batches(companyId, model)        path = "/api/v2/companies/#{companyId}/batches"
        post(path, model, {}, "22.6.1")      end

      # Create a new transaction batch
      #
      # Create a new transaction batch objects attached to this company.
      #
      # When a transaction batch is created, it is added to the AvaTax Batch v2 Queue and will be
      # processed as quickly as possible in the order it was received. To check the
      # status of a batch, fetch the batch and retrieve the results of the batch
      # operation.
      #
      # Because the batch system processes with a degree of concurrency, and
      # because of batch sizes in the queue vary, AvaTax API is unable to accurately
      # predict when a batch will complete. If high performance processing is
      # required, please use the
      # [CreateTransaction API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/).
      #
      # The maximum content length of the request body is limited to 28.6 MB. If this limit
      # is exceeded, a 404 Not Found status will be returned (possibly with a CORS error if
      # the API is called from a browser). In this situation, please split the request into
      # smaller batches.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this batch.
      # @param model [Object] The transaction batch you wish to create.
      # @return [Object]
      def create_transaction_batch(companyId, model)        path = "/api/v2/companies/#{companyId}/batches/transactions"
        post(path, model, {}, "22.6.1")      end

      # Delete a single batch
      #
      # Marks the batch identified by this URL as deleted.
      #
      # If you attempt to delete a batch that is being processed, you will receive an error message.
      # Deleting a batch does not delete any transactions that were created by importing the batch.
      #
      # Because the batch system processes with a degree of concurrency, and
      # because of batch sizes in the queue vary, AvaTax API is unable to accurately
      # predict when a batch will complete. If high performance processing is
      # required, please use the
      # [CreateTransaction API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/).
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, CSPAdmin, CSPTester, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this batch.
      # @param id [Integer] The ID of the batch to delete.
      # @return [ErrorDetail[]]
      def delete_batch(companyId, id)        path = "/api/v2/companies/#{companyId}/batches/#{id}"
        delete(path, {}, "22.6.1")      end

      # Download a single batch file
      #
      # Download a single batch file identified by this URL.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this batch
      # @param batchId [Integer] The ID of the batch object
      # @param id [Integer] The primary key of this batch file object
      # @return [Object]
      def download_batch(companyId, batchId, id)        path = "/api/v2/companies/#{companyId}/batches/#{batchId}/files/#{id}/attachment"
        get(path, {}, "22.6.1")      end

      # Retrieve a single batch
      #
      # Get the batch object identified by this URL. A batch object is a large
      # collection of API calls stored in a compact file.
      #
      # Use this endpoint to retrieve the results or check the status of a batch.
      #
      # When a batch is created, it is added to the AvaTax Batch Queue and will be
      # processed as quickly as possible in the order it was received. To check the
      # status of a batch, fetch the batch and retrieve the results of the batch
      # operation.
      #
      # Because the batch system processes with a degree of concurrency, and
      # because of batch sizes in the queue vary, AvaTax API is unable to accurately
      # predict when a batch will complete. If high performance processing is
      # required, please use the
      # [CreateTransaction API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/).
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this batch
      # @param id [Integer] The primary key of this batch
      # @return [Object]
      def get_batch(companyId, id)        path = "/api/v2/companies/#{companyId}/batches/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve all batches for this company
      #
      # List all batch objects attached to the specified company.
      #
      # A batch object is a large collection of API calls stored in a compact file.
      #
      # Search for specific objects using the criteria in the `$filter` parameter;
      # full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # Use [GetBatch](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Batches/GetBatch/)
      # to retrieve the results, or check the status, of an individual batch.
      #
      # When a batch is created, it is added to the AvaTax Batch Queue and will be
      # processed as quickly as possible in the order it was received. To check the
      # status of a batch, fetch the batch and retrieve the results of the batch
      # operation.
      #
      # Because the batch system processes with a degree of concurrency, and
      # because of batch sizes in the queue vary, AvaTax API is unable to accurately
      # predict when a batch will complete. If high performance processing is
      # required, please use the
      # [CreateTransaction API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/).
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns these batches
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* files
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_batches_by_company(companyId, options={})        path = "/api/v2/companies/#{companyId}/batches"
        get(path, options, "22.6.1")      end

      # Retrieve all batches
      #
      # Get multiple batch objects across all companies.
      #
      # A batch object is a large collection of API calls stored in a compact file.
      #
      # Search for specific objects using the criteria in the `$filter` parameter;
      # full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # When a batch is created, it is added to the AvaTax Batch Queue and will be
      # processed as quickly as possible in the order it was received. To check the
      # status of a batch, fetch the batch and retrieve the results of the batch
      # operation.
      #
      # Because the batch system processes with a degree of concurrency, and
      # because of batch sizes in the queue vary, AvaTax API is unable to accurately
      # predict when a batch will complete. If high performance processing is
      # required, please use the
      # [CreateTransaction API](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/CreateTransaction/).
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* files
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_batches(options={})        path = "/api/v2/batches"
        get(path, options, "22.6.1")      end
    end
  end
end