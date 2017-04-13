module AvaTax
  class Client
    module Transactions 


      # Correct a previously created transaction
      # 
      # Replaces the current transaction uniquely identified by this URL with a new transaction.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # When you adjust a committed transaction, the original transaction will be updated with the status code 'Adjusted', and
      # both revisions will be available for retrieval based on their code and ID numbers.
      # Only transactions in 'Committed' status are reported by Avalara Managed Returns.
      # Transactions that have been previously reported to a tax authority by Avalara Managed Returns are no longer available for adjustments.
      # 
     * @param AdjustTransactionModel $model The adjustment you wish to make
      # @return TransactionModel
      def adjustTransaction($companyCode, $transactionCode, $model)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/adjust';
        post (path)
      end


      # Get audit information about a transaction
      # 
      # Retrieve audit information about a transaction stored in AvaTax.
      #  
      # The 'AuditTransaction' endpoint retrieves audit information related to a specific transaction. This audit 
      # information includes the following:
      # 
      # * The `CompanyId` of the company that created the transaction
      # * The server timestamp representing the exact server time when the transaction was created
      # * The server duration - how long it took to process this transaction
      # * Whether exact API call details were logged
      # * A reconstructed API call showing what the original CreateTransaction call looked like
      # 
      # This API can be used to examine information about a previously created transaction.
      # 
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # 
      # @return AuditTransactionModel
      def auditTransaction($companyCode, $transactionCode)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/audit';
        get (path)
      end


      # Get audit information about a transaction
      # 
      # Retrieve audit information about a transaction stored in AvaTax.
      #  
      # The 'AuditTransaction' endpoint retrieves audit information related to a specific transaction. This audit 
      # information includes the following:
      # 
      # * The `CompanyId` of the company that created the transaction
      # * The server timestamp representing the exact server time when the transaction was created
      # * The server duration - how long it took to process this transaction
      # * Whether exact API call details were logged
      # * A reconstructed API call showing what the original CreateTransaction call looked like
      # 
      # This API can be used to examine information about a previously created transaction.
      # 
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # 
      # @return AuditTransactionModel
      def auditTransactionWithType($companyCode, $transactionCode, $documentType)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/types/#{documentType}/audit';
        get (path)
      end


      # Lock a set of documents
      # 
      # This API is available by invitation only.
      # 
      # Lock a set of transactions uniquely identified by DocumentIds provided. This API allows locking multiple documents at once.
      # After this API call succeeds, documents will be locked and can't be voided.
      # 
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # 
     * @param BulkLockTransactionModel $model bulk lock request
      # @return BulkLockTransactionResult
      def bulkLockTransaction($model)
        path = '/api/v2/transactions/lock';
        post (path)
      end


      # Change a transaction's code
      # 
      # Renames a transaction uniquely identified by this URL by changing its code to a new code.
      # After this API call succeeds, the transaction will have a new URL matching its new code.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # 
     * @param ChangeTransactionCodeModel $model The code change request you wish to execute
      # @return TransactionModel
      def changeTransactionCode($companyCode, $transactionCode, $model)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/changecode';
        post (path)
      end


      # Commit a transaction for reporting
      # 
      # Marks a transaction by changing its status to 'Committed'.
      # Transactions that are committed are available to be reported to a tax authority by Avalara Managed Returns.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # Any changes made to a committed transaction will generate a transaction history.
      # 
     * @param CommitTransactionModel $model The commit request you wish to execute
      # @return TransactionModel
      def commitTransaction($companyCode, $transactionCode, $model)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/commit';
        post (path)
      end


      # Create a new transaction
      # 
      # Records a new transaction in AvaTax.
      # 
      # The `CreateTransaction` endpoint uses the configuration values specified by your company to identify the correct tax rules
      # and rates to apply to all line items in this transaction, and reports the total tax calculated by AvaTax based on your
      # company's configuration and the data provided in this API call.
      # 
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #  
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      #  
      # If you don't specify '$include' parameter, it will include both details and addresses.
      # 
      # @param string $include A comma separated list of child objects to return underneath the primary object.
     * @param CreateTransactionModel $model The transaction you wish to create
      # @return TransactionModel
      def createTransaction($include, $model)
        path = '/api/v2/transactions/create';
        post (path)
      end


      # Retrieve a single transaction by code
      # 
      # Get the current transaction identified by this URL.
      # If this transaction was adjusted, the return value of this API will be the current transaction with this code, and previous revisions of
      # the transaction will be attached to the 'history' data field.
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #  
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # 
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @return TransactionModel
      def getTransactionByCode($companyCode, $transactionCode, $include)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}';
        get (path)
      end


      # Retrieve a single transaction by code
      # 
      # Get the current transaction identified by this URL.
      # If this transaction was adjusted, the return value of this API will be the current transaction with this code, and previous revisions of
      # the transaction will be attached to the 'history' data field.
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #  
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # 
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @return TransactionModel
      def getTransactionByCodeAndType($companyCode, $transactionCode, $documentType, $include)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/types/#{documentType}';
        get (path)
      end


      # Retrieve a single transaction by ID
      # 
      # Get the unique transaction identified by this URL.
      # This endpoint retrieves the exact transaction identified by this ID number even if that transaction was later adjusted
      # by using the 'Adjust Transaction' endpoint.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #  
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # 
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @return TransactionModel
      def getTransactionById($id, $include)
        path = '/api/v2/transactions/#{id}';
        get (path)
      end


      # Retrieve all transactions
      # 
      # List all transactions attached to this company.
      # This endpoint is limited to returning 1,000 transactions at a time maximum.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # 
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #  
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # 
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def listTransactionsByCompany($companyCode, $include, $filter, $top, $skip, $orderBy)
        path = '/api/v2/companies/#{companyCode}/transactions';
        get (path)
      end


      # Lock a single transaction
      # 
      # Lock a transaction uniquely identified by this URL. 
      # 
      # This API is mainly used for connector developer to simulate what happens when Returns product locks a document.
      # After this API call succeeds, the document will be locked and can't be voided or adjusted.
      # 
      # This API is only available to customers in Sandbox with AvaTaxPro subscription. On production servers, this API is available by invitation only.
      # 
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # 
     * @param LockTransactionModel $model The lock request you wish to execute
      # @return TransactionModel
      def lockTransaction($companyCode, $transactionCode, $model)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/lock';
        post (path)
      end


      # Create a refund for a transaction
      # 
      # Create a refund for a transaction.
      # 
      # The `RefundTransaction` API allows you to quickly and easily create a `ReturnInvoice` representing a refund
      # for a previously created `SalesInvoice` transaction. You can choose to create a full or partial refund, and
      # specify individual line items from the original sale for refund.
      # 
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #  
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      #  
      # If you don't specify '$include' parameter, it will include both details and addresses.
      # 
      # @param string $include A comma separated list of child objects to return underneath the primary object.
     * @param RefundTransactionModel $model Information about the refund to create
      # @return TransactionModel
      def refundTransaction($companyCode, $transactionCode, $include, $model)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/refund';
        post (path)
      end


      # Perform multiple actions on a transaction
      # 
      # Performs the same functions as /verify, /changecode, and /commit. You may specify one or many actions in each call to this endpoint.
      # 
     * @param SettleTransactionModel $model The settle request containing the actions you wish to execute
      # @return TransactionModel
      def settleTransaction($companyCode, $transactionCode, $model)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/settle';
        post (path)
      end


      # Verify a transaction
      # 
      # Verifies that the transaction uniquely identified by this URL matches certain expected values.
      # If the transaction does not match these expected values, this API will return an error code indicating which value did not match.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # 
     * @param VerifyTransactionModel $model The settle request you wish to execute
      # @return TransactionModel
      def verifyTransaction($companyCode, $transactionCode, $model)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/verify';
        post (path)
      end


      # Void a transaction
      # 
      # Voids the current transaction uniquely identified by this URL.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # When you void a transaction, that transaction's status is recorded as 'DocVoided'.
      # Transactions that have been previously reported to a tax authority by Avalara Managed Returns are no longer available to be voided.
      # 
     * @param VoidTransactionModel $model The void request you wish to execute
      # @return TransactionModel
      def voidTransaction($companyCode, $transactionCode, $model)
        path = '/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/void';
        post (path)
      end

    end
  end
end