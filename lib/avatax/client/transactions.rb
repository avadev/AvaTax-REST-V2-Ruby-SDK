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
      #  You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      #  * Lines
      #  * Details (implies lines)
      #  * Summary (implies details)
      #  * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      #
      #  If you omit the `$include` parameter, the API will assume you want `Summary,Addresses`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] information about the transaction and lines to be added
      # @return [Object]
      def add_lines(model, options={})        path = "/api/v2/companies/transactions/lines/add"
        post(path, model, options, "22.6.1")      end

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
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to adjust
      # @param documentType [String] (Optional): The document type of the transaction to adjust. (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @param model [Object] The adjustment you wish to make
      # @return [Object]
      def adjust_transaction(companyCode, transactionCode, model, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/adjust"
        post(path, model, options, "22.6.1")      end

      # Get audit information about a transaction
      #
      # Retrieve audit information about a transaction stored in AvaTax.
      #
      # The `AuditTransaction` API retrieves audit information related to a specific transaction. This audit
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
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ProStoresOperator, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The code identifying the company that owns this transaction
      # @param transactionCode [String] The code identifying the transaction
      # @return [Object]
      def audit_transaction(companyCode, transactionCode)        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/audit"
        get(path, {}, "22.6.1")      end

      # Get audit information about a transaction
      #
      # Retrieve audit information about a transaction stored in AvaTax.
      #
      # The `AuditTransaction` API retrieves audit information related to a specific transaction. This audit
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
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ProStoresOperator, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The code identifying the company that owns this transaction
      # @param transactionCode [String] The code identifying the transaction
      # @param documentType [String] The document type of the original transaction (See DocumentType::* for a list of allowable values)
      # @return [Object]
      def audit_transaction_with_type(companyCode, transactionCode, documentType)        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/types/#{documentType}/audit"
        get(path, {}, "22.6.1")      end

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
      # ### Security Policies
      #
      # * This API requires the user role Compliance Root User.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] bulk lock request
      # @return [Object]
      def bulk_lock_transaction(model)        path = "/api/v2/transactions/lock"
        post(path, model, {}, "22.6.1")      end

      # Change a transaction's code
      #
      # Renames a transaction uniquely identified by this URL by changing its `code` value.
      #
      # This API is available as long as the transaction is in `saved` or `posted` status. When a transaction
      # is `committed`, it can be modified by using the [AdjustTransaction](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Transactions/AdjustTransaction/) method.
      #
      # After this API call succeeds, the transaction will have a new URL matching its new `code`.
      #
      # If you have more than one document with the same `code`, specify the `documentType` parameter to choose between them.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, ProStoresOperator, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to change
      # @param documentType [String] (Optional): The document type of the transaction to change document code. If not provided, the default is SalesInvoice. (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @param model [Object] The code change request you wish to execute
      # @return [Object]
      def change_transaction_code(companyCode, transactionCode, model, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/changecode"
        post(path, model, options, "22.6.1")      end

      # Commit a transaction for reporting
      #
      # Marks a transaction by changing its status to `Committed`.
      #
      # Transactions that are committed are available to be reported to a tax authority by Avalara Managed Returns.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # If you have more than one document with the same `code`, specify the `documentType` parameter to choose between them.
      #
      # Any changes made to a committed transaction will generate a transaction history.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, ProStoresOperator, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to commit
      # @param documentType [String] (Optional): The document type of the transaction to commit. If not provided, the default is SalesInvoice. (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @param model [Object] The commit request you wish to execute
      # @return [Object]
      def commit_transaction(companyCode, transactionCode, model, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/commit"
        post(path, model, options, "22.6.1")      end

      # Create or adjust a transaction
      #
      # Records a new transaction or adjust an existing transaction in AvaTax.
      #
      # The `CreateOrAdjustTransaction` endpoint is used to create a new transaction or update an existing one. This API
      # can help you create an idempotent service that creates transactions
      # If there exists a transaction identified by code, the original transaction will be adjusted by using the meta data
      # in the input transaction.
      #
      # The `CreateOrAdjustTransaction` API cannot modify any transaction that has been reported to a tax authority using
      # the Avalara Managed Returns Service or any other tax filing service. If you call this API to attempt to modify
      # a transaction that has been reported on a tax filing, you will receive the error `CannotModifyLockedTransaction`.
      #
      # To generate a refund for a transaction, use the `RefundTransaction` API.
      #
      # If you don't specify the field `type` in your request, you will get an estimate of type `SalesOrder`, which will not be recorded in the database.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * ForceTimeout - Simulates a timeout. This adds a 30 second delay and error to your API call. This can be used to test your code to ensure it can respond correctly in the case of a dropped connection.
      #
      # If you omit the `$include` parameter, the API will assume you want `Summary,Addresses`.
      #
      # NOTE: Avoid using the following strings in your transaction codes as they are encoding strings and will be interpreted differently:
      # * \_-ava2f-\_
      # * \_-ava2b-\_
      # * \_-ava3f-\_
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] The transaction you wish to create or adjust
      # @return [Object]
      def create_or_adjust_transaction(model, options={})        path = "/api/v2/transactions/createoradjust"
        post(path, model, options, "22.6.1")      end

      # Create a new transaction
      #
      # Records a new transaction in AvaTax.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # The `CreateTransaction` endpoint uses the tax profile of your company to identify the correct tax rules
      # and rates to apply to all line items in this transaction. The end result will be the total tax calculated by AvaTax based on your
      # company's configuration and the data provided in this API call.
      #
      # The `CreateTransaction` API will report an error if a committed transaction already exists with the same `code`. To
      # avoid this error, use the `CreateOrAdjustTransaction` API - it will create the transaction if it does not exist, or
      # update it if it does exist.
      #
      # To generate a refund for a transaction, use the `RefundTransaction` API.
      #
      # The field `type` identifies the kind of transaction - for example, a sale, purchase, or refund. If you do not specify
      # a `type` value, you will receive an estimate of type `SalesOrder`, which will not be recorded.
      #
      # The origin and destination locations for a transaction must be identified by either address or geocode. For address-based transactions, please
      # provide addresses in the fields `line`, `city`, `region`, `country` and `postalCode`. For geocode-based transactions, please provide the geocode
      # information in the fields `latitude` and `longitude`. If either `latitude` or `longitude` or both are null, the transaction will be calculated
      # using the best available address location information.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * ForceTimeout - Simulates a timeout. This adds a 30 second delay and error to your API call. This can be used to test your code to ensure it can respond correctly in the case of a dropped connection.
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # If you omit the `$include` parameter, the API will assume you want `Summary,Addresses`.
      #
      # NOTE: Avoid using the following strings in your transaction codes as they are encoding strings and will be interpreted differently:
      # * \_-ava2f-\_
      # * \_-ava2b-\_
      # * \_-ava3f-\_
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] The transaction you wish to create
      # @return [Object]
      def create_transaction(model, options={})        path = "/api/v2/transactions/create"
        post(path, model, options, "22.6.1")      end

      # Remove lines from an existing unlocked transaction
      #
      # Remove lines to an existing unlocked transaction.
      #
      #  The `DeleteLines` API allows you to remove transaction lines from existing unlocked transaction, so that customer will
      #  be able to delete transaction lines and adjust original transaction the way they like
      #
      #  A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      #  sales, purchases, inventory transfer, and returns (also called refunds).
      #  You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      #  * Lines
      #  * Details (implies lines)
      #  * Summary (implies details)
      #  * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      #
      #  If you omit the `$include` parameter, the API will assume you want `Summary,Addresses`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] information about the transaction and lines to be removed
      # @return [Object]
      def delete_lines(model, options={})        path = "/api/v2/companies/transactions/lines/delete"
        post(path, model, options, "22.6.1")      end

      # Retrieve a single transaction by code
      #
      # Get the current transaction identified by this company code, transaction code, and document type.
      #
      # A transaction is uniquely identified by `companyCode`, `code` (often called Transaction Code), and `documentType`.
      #
      # For compatibility purposes, when this API finds multiple transactions with the same transaction code, and if you have not specified
      # the `type` parameter to this API, it will default to selecting the `SalesInvoices` transaction. To change this behavior, use the
      # optional `documentType` parameter to specify the specific document type you wish to find.
      #
      # If this transaction was adjusted, the return value of this API will be the current transaction with this code.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ProStoresOperator, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param documentType [String] (Optional): The document type of the transaction to retrieve (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @return [Object]
      def get_transaction_by_code(companyCode, transactionCode, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}"
        get(path, options, "22.6.1")      end

      # Retrieve a single transaction by code
      #
      # DEPRECATED: Please use the `GetTransactionByCode` API instead.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ProStoresOperator, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param documentType [String] The transaction type to retrieve (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @return [Object]
      def get_transaction_by_code_and_type(companyCode, transactionCode, documentType, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/types/#{documentType}"
        get(path, options, "22.6.1")      end

      # Retrieve a single transaction by ID
      #
      # Get the unique transaction identified by this URL.
      #
      # This endpoint retrieves the exact transaction identified by this ID number, as long as it is the most version of the transaction.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ProStoresOperator, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The unique ID number of the transaction to retrieve
      # @param include [String] Specifies objects to include in this fetch call
      # @return [Object]
      def get_transaction_by_id(id, options={})        path = "/api/v2/transactions/#{id}"
        get(path, options, "22.6.1")      end

      # Retrieve all transactions
      #
      # List all transactions attached to this company.
      #
      # This endpoint is limited to returning 1,000 transactions at a time maximum.
      #
      # When listing transactions, you must specify a `date` range filter. If you do not specify a `$filter` that includes a `date` field
      # criteria, the query will default to looking at only those transactions with `date` in the past 30 days.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ProStoresOperator, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param dataSourceId [Integer] Optionally filter transactions to those from a specific data source.
      # @param include [String] Specifies objects to include in this fetch call
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* exchangeRateCurrencyCode, totalDiscount, lines, addresses, locationTypes, summary, taxDetailsByTaxType, parameters, userDefinedFields, messages, invoiceMessages, isFakeTransaction, deliveryTerms
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_transactions_by_company(companyCode, options={})        path = "/api/v2/companies/#{companyCode}/transactions"
        get(path, options, "22.6.1")      end

      # Lock a single transaction
      #
      # Lock a transaction uniquely identified by this URL.
      #
      # This API is mainly used for connector developers to simulate what happens when the Returns product locks a document.
      # After this API call succeeds, the document will be locked and can't be voided or adjusted.
      #
      # This API is only available to customers in Sandbox with AvaTaxPro subscription. On production servers, this API is available by invitation only.
      #
      # If you have more than one document with the same `code`, specify the `documentType` parameter to choose between them.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to lock
      # @param documentType [String] (Optional): The document type of the transaction to lock. If not provided, the default is SalesInvoice. (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @param model [Object] The lock request you wish to execute
      # @return [Object]
      def lock_transaction(companyCode, transactionCode, model, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/lock"
        post(path, model, options, "22.6.1")      end

      # Create a refund for a transaction
      #
      # Create a refund for a transaction.
      #
      # The `RefundTransaction` API allows you to quickly and easily create a `ReturnInvoice` representing a refund
      # for a previously created `SalesInvoice` transaction. You can choose to create a full or partial refund, and
      # specify individual line items from the original sale for refund.
      #
      # The `RefundTransaction` API ensures that the tax amount you refund to the customer exactly matches the tax that
      # was calculated during the original transaction, regardless of any changes to your company's configuration, rules,
      # nexus, or any other setting.
      #
      # This API is intended to be a shortcut to allow you to quickly and accurately generate a refund for the following
      # common refund scenarios:
      #
      # * A full refund of a previous sale
      # * Refunding the tax that was charged on a previous sale, when the customer provides an exemption certificate after the purchase
      # * Refunding one or more items (lines) from a previous sale
      # * Granting a customer a percentage refund of a previous sale
      #
      # For more complex scenarios than the ones above, please use `CreateTransaction` with document type `ReturnInvoice` to
      # create a custom refund transaction.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      # If you omit the `$include` parameter, the API will assume you want `Summary,Addresses`.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The code of the company that made the original sale
      # @param transactionCode [String] The transaction code of the original sale
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param documentType [String] (Optional): The document type of the transaction to refund. If not provided, the default is SalesInvoice. (See DocumentType::* for a list of allowable values)
      # @param useTaxDateOverride [Boolean] (Optional): If set to true, processes refund using taxDateOverride rather than taxAmountOverride (Note: taxAmountOverride is not allowed for SST states).
      # @param model [Object] Information about the refund to create
      # @return [Object]
      def refund_transaction(companyCode, transactionCode, model, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/refund"
        post(path, model, options, "22.6.1")      end

      # Perform multiple actions on a transaction
      #
      # Performs one or more actions against the current transaction uniquely identified by this URL.
      #
      # The `SettleTransaction` API call can perform the work of `ChangeCode`, `VerifyTransaction`, and `CommitTransaction`.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # If you have more than one document with the same `code`, specify the `documentType` parameter to choose between them.
      #
      # This API is available for users who want to execute more than one action at a time.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, ProStoresOperator, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to settle
      # @param documentType [String] (Optional): The document type of the transaction to settle. If not provided, the default is SalesInvoice. (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @param model [Object] The data from an external system to reconcile against AvaTax
      # @return [Object]
      def settle_transaction(companyCode, transactionCode, model, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/settle"
        post(path, model, options, "22.6.1")      end

      # Uncommit a transaction for reporting
      #
      # Adjusts a transaction by changing it to an uncommitted status.
      #
      # Transactions that have been previously reported to a tax authority by Avalara Managed Returns are considered `locked` and are
      # no longer available to be uncommitted.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to Uncommit
      # @param documentType [String] (Optional): The document type of the transaction to Uncommit. If not provided, the default is SalesInvoice. (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @return [Object]
      def uncommit_transaction(companyCode, transactionCode, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/uncommit"
        post(path, options, "22.6.1")      end

      # Unvoids a transaction
      #
      # Unvoids a voided transaction
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to commit
      # @param documentType [String] (Optional): The document type of the transaction to commit. If not provided, the default is SalesInvoice. (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @return [Object]
      def unvoid_transaction(companyCode, transactionCode, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/unvoid"
        post(path, options, "22.6.1")      end

      # Verify a transaction
      #
      # Verifies that the transaction uniquely identified by this URL matches certain expected values.
      #
      # If the transaction does not match these expected values, this API will return an error code indicating which value did not match.
      #
      # If you have more than one document with the same `code`, specify the `documentType` parameter to choose between them.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, ProStoresOperator, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to settle
      # @param documentType [String] (Optional): The document type of the transaction to verify. If not provided, the default is SalesInvoice. (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @param model [Object] The data from an external system to reconcile against AvaTax
      # @return [Object]
      def verify_transaction(companyCode, transactionCode, model, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/verify"
        post(path, model, options, "22.6.1")      end

      # Void a transaction
      #
      # Voids the current transaction uniquely identified by this URL.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # When you void a transaction, that transaction's status is recorded as `DocVoided`.
      #
      # If you have more than one document with the same `code`, specify the `documentType` parameter to choose between them.
      #
      # Transactions that have been previously reported to a tax authority by Avalara Managed Returns are no longer available to be voided.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Lines
      # * Details (implies lines)
      # * Summary (implies details)
      # * Addresses
      # * SummaryOnly (omit lines and details - reduces API response size)
      # * LinesOnly (omit details - reduces API response size)
      # * TaxDetailsByTaxType - Includes the aggregated tax, exempt tax, taxable and non-taxable for each tax type returned in the transaction summary.
      #
      # NOTE: If your companyCode or transactionCode contains any of these characters /, +, ? or a space please use the following encoding before making a request:
      # * Replace '/' with '\_-ava2f-\_' For example: document/Code becomes document_-ava2f-_Code
      # * Replace '+' with '\_-ava2b-\_' For example: document+Code becomes document_-ava2b-_Code
      # * Replace '?' with '\_-ava3f-\_' For example: document?Code becomes document_-ava3f-_Code
      # * Replace '%' with '\_-ava25-\_' For example: document%Code becomes document_-ava25-_Code
      # * Replace '#' with '\_-ava23-\_' For example: document#Code becomes document_-ava23-_Code
      # * Replace ' ' with '%20' For example: document Code becomes document%20Code
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CSPTester, ProStoresOperator, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyCode [String] The company code of the company that recorded this transaction
      # @param transactionCode [String] The transaction code to void
      # @param documentType [String] (Optional): The document type of the transaction to void. If not provided, the default is SalesInvoice. (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @param model [Object] The void request you wish to execute. To void a transaction the code must be set to 'DocVoided'
      # @return [Object]
      def void_transaction(companyCode, transactionCode, model, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/void"
        post(path, model, options, "22.6.1")      end
    end
  end
end