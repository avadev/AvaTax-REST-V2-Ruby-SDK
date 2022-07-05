module AvaTax
  class Client
    module MultiDocument 


      # Adjust a MultiDocument transaction
      #
      # Adjusts the current MultiDocument transaction uniquely identified by this URL.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # When you adjust a transaction, that transaction's status is recorded as `Adjusted`.
      #
      # Both the revisions will be available for retrieval based on their code and ID numbers. Only transactions in Committed status can be reported on a tax filing by Avalara's Managed Returns Service.
      #
      # Transactions that have been previously reported to a tax authority by Avalara Managed Returns are considered locked and are no longer available for adjustments.
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
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param code [String] The transaction code for this MultiDocument transaction
      # @param type [String] The transaction type for this MultiDocument transaction (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in this fetch call
      # @param model [Object] The adjust request you wish to execute
      # @return [Object]
      def adjust_multi_document_transaction(code, type, model, options={})        path = "/api/v2/transactions/multidocument/#{code}/type/#{type}/adjust"
        post(path, model, options, "22.6.1")      end

      # Get audit information about a MultiDocument transaction
      #
      # Retrieve audit information about a MultiDocument transaction stored in AvaTax.
      #
      # The audit API retrieves audit information related to a specific MultiDocument transaction. This audit
      # information includes the following:
      #
      # * The `code` of the MultiDocument transaction
      # * The `type` of the MultiDocument transaction
      # * The server timestamp representing the exact server time when the transaction was created
      # * The server duration - how long it took to process this transaction
      # * Whether exact API call details were logged
      # * A reconstructed API call showing what the original create call looked like
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
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param code [String] The transaction code for this MultiDocument transaction
      # @param type [String] The transaction type for this MultiDocument transaction (See DocumentType::* for a list of allowable values)
      # @return [Object]
      def audit_multi_document_transaction(code, type)        path = "/api/v2/transactions/multidocument/#{code}/type/#{type}/audit"
        get(path, {}, "22.6.1")      end

      # Commit a MultiDocument transaction
      #
      # Marks a list of transactions by changing its status to `Committed`.
      #
      # Transactions that are committed are available to be reported to a tax authority by Avalara Managed Returns.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # Any changes made to a committed transaction will generate a transaction history.
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
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] The commit request you wish to execute
      # @return [Object]
      def commit_multi_document_transaction(model)        path = "/api/v2/transactions/multidocument/commit"
        post(path, model, {}, "22.6.1")      end

      # Create a new MultiDocument transaction
      #
      # Records a new MultiDocument transaction in AvaTax.
      #
      # A traditional transaction requires exactly two parties: a seller and a buyer. MultiDocument transactions can
      # involve a marketplace of vendors, each of which contributes some portion of the final transaction. Within
      # a MultiDocument transaction, each individual buyer and seller pair are matched up and converted to a separate
      # document. This separation of documents allows each seller to file their taxes separately.
      #
      # This API will report an error if you attempt to create a transaction when one already exists with the specified `code`.
      # If you would like the API to automatically update the transaction when it already exists, please set the `allowAdjust`
      # value to `true`.
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
      #
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
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] the multi document transaction model
      # @return [Object]
      def create_multi_document_transaction(model, options={})        path = "/api/v2/transactions/multidocument"
        post(path, model, options, "22.6.1")      end

      # Retrieve a MultiDocument transaction
      #
      # Get the current MultiDocument transaction identified by this URL.
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
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param code [String] The multidocument code to retrieve
      # @param type [String] The transaction type to retrieve (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @return [Object]
      def get_multi_document_transaction_by_code_and_type(code, type, options={})        path = "/api/v2/transactions/multidocument/#{code}/type/#{type}"
        get(path, options, "22.6.1")      end

      # Retrieve a MultiDocument transaction by ID
      #
      # Get the unique MultiDocument transaction identified by this URL.
      #
      # A traditional transaction requires exactly two parties: a seller and a buyer. MultiDocument transactions can
      # involve a marketplace of vendors, each of which contributes some portion of the final transaction. Within
      # a MultiDocument transaction, each individual buyer and seller pair are matched up and converted to a separate
      # document. This separation of documents allows each seller to file their taxes separately.
      #
      # This endpoint retrieves the exact transaction identified by this ID number even if that transaction was later adjusted
      # by using the `AdjustTransaction` endpoint.
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
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The unique ID number of the MultiDocument transaction to retrieve
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @return [Object]
      def get_multi_document_transaction_by_id(id, options={})        path = "/api/v2/transactions/multidocument/#{id}"
        get(path, options, "22.6.1")      end

      # Retrieve all MultiDocument transactions
      #
      # List all MultiDocument transactions within this account.
      #
      # This endpoint is limited to returning 1,000 MultiDocument transactions at a time. To retrieve more than 1,000 MultiDocument
      # transactions, please use the pagination features of the API.
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
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* documents
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_multi_document_transactions(options={})        path = "/api/v2/transactions/multidocument"
        get(path, options, "22.6.1")      end

      # Create a refund for a MultiDocument transaction
      #
      # Create a refund for a MultiDocument transaction.
      #
      # A traditional transaction requires exactly two parties: a seller and a buyer. MultiDocument transactions can
      # involve a marketplace of vendors, each of which contributes some portion of the final transaction. Within
      # a MultiDocument transaction, each individual buyer and seller pair are matched up and converted to a separate
      # document. This separation of documents allows each seller to file their taxes separately.
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
      #
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
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param code [String] The code of this MultiDocument transaction
      # @param type [String] The type of this MultiDocument transaction (See DocumentType::* for a list of allowable values)
      # @param include [String] Specifies objects to include in the response after transaction is created
      # @param model [Object] Information about the refund to create
      # @return [Object]
      def refund_multi_document_transaction(code, type, model, options={})        path = "/api/v2/transactions/multidocument/#{code}/type/#{type}/refund"
        post(path, model, options, "22.6.1")      end

      # Verify a MultiDocument transaction
      #
      # Verifies that the MultiDocument transaction uniquely identified by this URL matches certain expected values.
      #
      # If the transaction does not match these expected values, this API will return an error code indicating which value did not match.
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
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] Information from your accounting system to verify against this MultiDocument transaction as it is stored in AvaTax
      # @return [Object]
      def verify_multi_document_transaction(model)        path = "/api/v2/transactions/multidocument/verify"
        post(path, model, {}, "22.6.1")      end

      # Void a MultiDocument transaction
      #
      # Voids the current transaction uniquely identified by this URL.
      #
      # A transaction represents a unique potentially taxable action that your company has recorded, and transactions include actions like
      # sales, purchases, inventory transfer, and returns (also called refunds).
      #
      # When you void a transaction, that transaction's status is recorded as `DocVoided`.
      #
      # Transactions that have been previously reported to a tax authority by Avalara Managed Returns Service are considered `locked`,
      # and they are no longer available to be voided.
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
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param code [String] The transaction code for this MultiDocument transaction
      # @param type [String] The transaction type for this MultiDocument transaction (See DocumentType::* for a list of allowable values)
      # @param model [Object] The void request you wish to execute
      # @return [Object]
      def void_multi_document_transaction(code, type, model)        path = "/api/v2/transactions/multidocument/#{code}/type/#{type}/void"
        post(path, model, {}, "22.6.1")      end
    end
  end
end