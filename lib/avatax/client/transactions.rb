module AvaTax
  class Client
    module Transactions 


      # Add lines to an existing unlocked transaction
      #
      # Add lines to an existing unlocked transaction.
      #
      #  The `AddLines` API allows you to add additional transaction lines to existing transaction, so that customer will
      #  be able to append multiple calls together and form an extremely large transaction. If customer does not specify line number
      #  in the lines to be added, a new random Guid string will be generated for line number. If customer are not satisfied with
      #  the line number for the transaction lines, they can turn on the renumber switch to have REST v2 automatically renumber all
      #  transaction lines for them, in this case, the line number becomes: "1", "2", "3", ...
      #
      #  A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      #  sales, purchases, inventory transfer, and returns (also called refunds).
      #  You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      #  * Lines
      #  * Details (implies lines)
      #  * Summary (implies details)
      #  * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      #
      #  If you omit the `$include` parameter, the API will assume you want `Summary,Addresses`.
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] information about the transaction and lines to be added
      # @return [Object]
      def add_lines(model, options={})
        path = "/api/v2/companies/transactions/lines/add"
        post(path, model, options)
      end


      # Correct a previously created transaction
      #
      # Replaces the current transaction uniquely identified by this URL with a new transaction.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # When you adjust a committed transaction, the original transaction will be updated with the status code `Adjusted`, and
      # both revisions will be available for retrieval based on their code and ID numbers.
      # Only transactions in `Committed` status are reported by Avalara Managed Returns.
      #
      # Transactions that have been previously reported to a tax authority by Avalara Managed Returns are considered `locked` and are
      # no longer available for adjustments.
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to adjust
      # @param model [Object] The adjustment you wish to make
      # @return [Object]
      def adjust_transaction(companyCode, transactionCode, model)
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/adjust"
        post(path, model)
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
      # @param companyCode [String] The code identifying the company that owns this transaction
      # @param transactionCode [String] The code identifying the transaction
      # @return [Object]
      def audit_transaction(companyCode, transactionCode)
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/audit"
        get(path)
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
      # @param companyCode [String] The code identifying the company that owns this transaction
      # @param transactionCode [String] The code identifying the transaction
      # @param documentType [String] The document type of the original transaction (See DocumentType::* for a list of allowable values)
      # @return [Object]
      def audit_transaction_with_type(companyCode, transactionCode, documentType)
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/types/#{documentType}/audit"
        get(path)
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
      # @param model [Object] bulk lock request
      # @return [Object]
      def bulk_lock_transaction(model)
        path = "/api/v2/transactions/lock"
        post(path, model)
      end


      # Change a transaction's code
      #
      # Renames a transaction uniquely identified by this URL by changing its code to a new code.
      # After this API call succeeds, the transaction will have a new URL matching its new code.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to change
      # @param model [Object] The code change request you wish to execute
      # @return [Object]
      def change_transaction_code(companyCode, transactionCode, model)
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/changecode"
        post(path, model)
      end


      # Commit a transaction for reporting
      #
      # Marks a transaction by changing its status to 'Committed'.
      # Transactions that are committed are available to be reported to a tax authority by Avalara Managed Returns.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # Any changes made to a committed transaction will generate a transaction history.
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to commit
      # @param model [Object] The commit request you wish to execute
      # @return [Object]
      def commit_transaction(companyCode, transactionCode, model)
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/commit"
        post(path, model)
      end


      # Create a new transaction
      #
      # Records a new transaction or adjust an existing in AvaTax.
      #
      # The `CreateOrAdjustTransaction` endpoint is used to create a new transaction if the input transaction does not exist
      # or if there exists a transaction identified by code, the original transaction will be adjusted by using the meta data
      # in the input transaction
      #
      # If you don't specify type in the provided data, a new transaction with type of SalesOrder will be recorded by default.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      #
      # If you omit the `$include` parameter, the API will assume you want `Summary,Addresses`.
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] The transaction you wish to create
      # @return [Object]
      def create_or_adjust_transaction(model, options={})
        path = "/api/v2/transactions/createoradjust"
        post(path, model, options)
      end


      # Create a new transaction
      #
      # Records a new transaction in AvaTax.
      #
      # The `CreateTransaction` endpoint uses the configuration values specified by your company to identify the correct tax rules
      # and rates to apply to all line items in this transaction, and reports the total tax calculated by AvaTax based on your
      # company's configuration and the data provided in this API call.
      #
      # If you don't specify type in the provided data, a new transaction with type of SalesOrder will be recorded by default.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      #
      # If you omit the `$include` parameter, the API will assume you want `Summary,Addresses`.
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] The transaction you wish to create
      # @return [Object]
      def create_transaction(model)
        path = "/api/v2/transactions/create"
        post(path, model)
      end


      # Remove lines from an existing unlocked transaction
      #
      # Remove lines to an existing unlocked transaction.
      #
      #  The `DeleteLines` API allows you to remove transaction lines from existing unlocked transaction, so that customer will
      #  be able to delete transaction lines and adjust original transaction the way they like
      #
      #  A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      #  sales, purchases, inventory transfer, and returns (also called refunds).
      #  You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      #  * Lines
      #  * Details (implies lines)
      #  * Summary (implies details)
      #  * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      #
      #  If you omit the `$include` parameter, the API will assume you want `Summary,Addresses`.
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] information about the transaction and lines to be removed
      # @return [Object]
      def delete_lines(model, options={})
        path = "/api/v2/companies/transactions/lines/delete"
        post(path, model, options)
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
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param include [String] Specifies objects to include in this fetch call
      # @return [Object]
      def get_transaction_by_code(companyCode, transactionCode, options={})
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}"
        get(path, options)
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
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param documentType [String] The transaction type to retrieve (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @return [Object]
      def get_transaction_by_code_and_type(companyCode, transactionCode, documentType, options={})
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/types/#{documentType}"
        get(path, options)
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
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # @param id [Integer] The unique ID number of the transaction to retrieve
      # @param include [String] Specifies objects to include in this fetch call
      # @return [Object]
      def get_transaction_by_id(id, options={})
        path = "/api/v2/transactions/#{id}"
        get(path, options)
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
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param include [String] Specifies objects to include in this fetch call
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_transactions_by_company(companyCode, options={})
        path = "/api/v2/companies/#{companyCode}/transactions"
        get(path, options)
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
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to lock
      # @param model [Object] The lock request you wish to execute
      # @return [Object]
      def lock_transaction(companyCode, transactionCode, model)
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/lock"
        post(path, model)
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
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      #
      # If you omit the `$include` parameter, the API will assume you want `Summary,Addresses`.
      # @param companyCode [String] The code of the company that made the original sale
      # @param transactionCode [String] The transaction code of the original sale
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] Information about the refund to create
      # @return [Object]
      def refund_transaction(companyCode, transactionCode, model, options={})
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/refund"
        post(path, model, options)
      end


      # Perform multiple actions on a transaction
      #
      # Performs the same functions as /verify, /changecode, and /commit. You may specify one or many actions in each call to this endpoint.
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to settle
      # @param model [Object] The settle request containing the actions you wish to execute
      # @return [Object]
      def settle_transaction(companyCode, transactionCode, model)
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/settle"
        post(path, model)
      end


      # Verify a transaction
      #
      # Verifies that the transaction uniquely identified by this URL matches certain expected values.
      # If the transaction does not match these expected values, this API will return an error code indicating which value did not match.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to settle
      # @param model [Object] The settle request you wish to execute
      # @return [Object]
      def verify_transaction(companyCode, transactionCode, model)
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/verify"
        post(path, model)
      end


      # Void a transaction
      #
      # Voids the current transaction uniquely identified by this URL.
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # When you void a transaction, that transaction's status is recorded as 'DocVoided'.
      # Transactions that have been previously reported to a tax authority by Avalara Managed Returns are no longer available to be voided.
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to void
      # @param model [Object] The void request you wish to execute
      # @return [Object]
      def void_transaction(companyCode, transactionCode, model)
        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/void"
        post(path, model)
      end

    end
  end
end