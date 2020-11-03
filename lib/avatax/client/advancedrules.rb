module AvaTax
  class Client
    module AdvancedRules 


      # Copy an existing advanced rule to a new environment
      #
      # 
      # @param ruleId [String] 
      # @param model [Object] 
      # @return [Object]
      def copy_advanced_rule(ruleId, model)        path = "/api/v2/advancedrules/rules/#{ruleId}/copy"
        put(path, model)      end

      # Create an advanced rule
      #
      # 
      # @param model [Object] The advanced rule you wish to create
      # @return [Object]
      def create_advanced_rule(model)        path = "/api/v2/advancedrules/rules"
        post(path, model)      end

      # Create a lookup file for a company
      #
      # 
      # @param accountId [Integer] The ID of the account for the company
      # @param companyId [Integer] The ID of the company for which the lookup file is to be created
      # @param model [Object] The lookup file you wish to create
      # @return [Object]
      def create_company_lookup_file(accountId, companyId, model)        path = "/api/v2/advancedrules/accounts/#{accountId}/companies/#{companyId}/lookupFiles"
        post(path, model)      end

      # Create a rule execution for a company
      #
      # 
      # @param accountId [Integer] The ID of the account for the company
      # @param companyId [Integer] The ID of the company for which the rule execution is to be created
      # @param model [Object] The rule execution you wish to create
      # @return [Object]
      def create_company_rule_execution(accountId, companyId, model)        path = "/api/v2/advancedrules/accounts/#{accountId}/companies/#{companyId}/executions"
        post(path, model)      end

      # Delete an advanced rule that is not in use by a company
      #
      # 
      # @param ruleId [String] The ID of the advanced rule to be deleted
      # @return [ErrorDetail[]]
      def delete_advanced_rule(ruleId)        path = "/api/v2/advancedrules/rules/#{ruleId}"
        delete(path)      end

      # Delete a lookup file
      #
      # 
      # @param accountId [Integer] The ID of the account for the company the lookup file is for
      # @param id [String] The unique ID/GUID for the company lookup file to be deleted
      # @return [ErrorDetail[]]
      def delete_lookup_file(accountId, id)        path = "/api/v2/advancedrules/accounts/#{accountId}/lookupFiles/#{id}"
        delete(path)      end

      # Delete a rule execution
      #
      # 
      # @param accountId [Integer] The ID of the account for the company the rule execution is for
      # @param ruleExecutionId [String] The unique ID/GUID for the rule execution to be deleted
      # @return [ErrorDetail[]]
      def delete_rule_execution(accountId, ruleExecutionId)        path = "/api/v2/advancedrules/accounts/#{accountId}/executions/#{ruleExecutionId}"
        delete(path)      end

      # Get an advanced rule by rule ID
      #
      # 
      # @param ruleId [String] The ID of the rule to retrieve
      # @return [Object]
      def get_advanced_rule(ruleId)        path = "/api/v2/advancedrules/rules/#{ruleId}"
        get(path)      end

      # Get an advanced rule by name
      #
      # 
      # @param name [String] The name of the rule to retrieve
      # @return [Object]
      def get_advanced_rule_by_name(name)        path = "/api/v2/advancedrules/rules/name/#{name}"
        get(path)      end

      # Retrieve an advanced rule's customer data schema for a company
      #
      # 
      # @param ruleId [String] The ID of the advance rule for which the schema is requested
      # @param accountId [Integer] The ID of the account of the requesting user
      # @param companyId [Integer] The ID of the company of the requesting user
      # @return [Object]
      def get_advanced_rule_customer_data_schema(ruleId, accountId, companyId)        path = "/api/v2/advancedrules/accounts/#{accountId}/companies/#{companyId}/rules/#{ruleId}/schema"
        get(path)      end

      # List all advanced rules
      #
      # 
      # @param fullDetails [Boolean] Retrieve detailed advanced rule properties (limited to tech support level)
      # @param includeTest [Boolean] Include test rules
      # @param includeSystemRules [Boolean] Include rules used to retrieve enumerated values
      # @return [FetchResult]
      def get_advanced_rules(options={})        path = "/api/v2/advancedrules/rules"
        get(path, options)      end

      # Get audit records by account id and date range.
      #
      # 
      # @param accountId [Integer] The ID of the account
      # @param fromDate [String] Date
      # @param toDate [String] Date
      # @return [Object]
      def get_audit_records(accountId, fromDate, toDate)        path = "/api/v2/advancedrules/audits/accounts/#{accountId}/from/#{fromDate}/to/#{toDate}"
        get(path)      end

      # Retrieve companies that have an advanced rule configured in its rule execution configuration
      #
      # 
      # @param ruleId [String] he ID of the advance rule for which companies are requested
      # @return [FetchResult]
      def get_companies_using_advanced_rule(ruleId)        path = "/api/v2/advancedrules/rules/#{ruleId}/companies"
        get(path)      end

      # Get the lookup files for a company
      #
      # 
      # @param accountId [Integer] The account ID for the company
      # @param companyId [Integer] The ID of the company for which to retrieve lookup files
      # @return [FetchResult]
      def get_company_lookup_files(accountId, companyId)        path = "/api/v2/advancedrules/accounts/#{accountId}/companies/#{companyId}/lookupFiles"
        get(path)      end

      # Get the rule executions for a company
      #
      # 
      # @param accountId [Integer] The account ID for the company
      # @param companyId [Integer] The ID of the company for which to retrieve rule executions
      # @param effectiveDate [DateTime] Optional date which the rule executions should be effective
      # @return [FetchResult]
      def get_company_rule_executions(accountId, companyId, options={})        path = "/api/v2/advancedrules/accounts/#{accountId}/companies/#{companyId}/executions"
        get(path, options)      end

      # Get a lookup file for an accountId and companyLookupFileId
      #
      # 
      # @param accountId [Integer] The ID of the account for the lookup file
      # @param id [String] The unique ID/GUID of the company lookup file to return
      # @return [Object]
      def get_lookup_file(accountId, id)        path = "/api/v2/advancedrules/accounts/#{accountId}/lookupFiles/#{id}"
        get(path)      end

      # Get a rule execution for an accountId and ruleExecutionId
      #
      # 
      # @param accountId [Integer] The ID of the account for the rule execution
      # @param ruleExecutionId [String] The unique ID/GUID of the rule execution to return
      # @return [Object]
      def get_rule_execution(accountId, ruleExecutionId)        path = "/api/v2/advancedrules/accounts/#{accountId}/executions/#{ruleExecutionId}"
        get(path)      end

      # Update an advanced rule
      #
      # Creates a new version of the advanced rule
      # @param ruleId [String] The ID of the advanced rule to be updated
      # @param model [Object] The new values for the advanced rule
      # @return [Object]
      def update_advanced_rule(ruleId, model)        path = "/api/v2/advancedrules/rules/#{ruleId}"
        put(path, model)      end

      # Set rule approved or unapproved
      #
      # 
      # @param ruleId [String] The ID of the advanced rule to change the approved state
      # @param model [Object] The value to set approved state
      # @return [Object]
      def update_advanced_rule_approval(ruleId, model)        path = "/api/v2/advancedrules/rules/#{ruleId}/approve"
        post(path, model)      end

      # Set rule visible or not visible for an account
      #
      # 
      # @param ruleId [String] 
      # @param model [Object] 
      # @return [Object]
      def update_advanced_rule_visibility(ruleId, model)        path = "/api/v2/advancedrules/rules/#{ruleId}/visible"
        put(path, model)      end

      # Change the rule execution order for a company
      #
      # 
      # @param accountId [Integer] The ID of the account for the company the rule execution is for
      # @param companyId [Integer] The ID of the company for which the rule execution order is being modified
      # @param model [Object] A list of rule execution IDs for the company indicating the new execution order
      # @return [FetchResult]
      def update_company_rule_execution_order(accountId, companyId, model)        path = "/api/v2/advancedrules/accounts/#{accountId}/companies/#{companyId}/executions/order"
        post(path, model)      end

      # Update a lookup file
      #
      # 
      # @param accountId [Integer] The ID of the account for the company the lookup file is for
      # @param id [String] The unique ID/GUID of the company lookup file to be updated
      # @param model [Object] The new values to update the lookup file
      # @return [Object]
      def update_lookup_file(accountId, id, model)        path = "/api/v2/advancedrules/accounts/#{accountId}/lookupFiles/#{id}"
        put(path, model)      end

      # Update a rule execution
      #
      # 
      # @param accountId [Integer] The ID of the account for the company the rule execution is for
      # @param ruleExecutionId [String] The unique ID/GUID of the rule execution to be updated
      # @param model [Object] The new values to update the rule execution
      # @return [Object]
      def update_rule_execution(accountId, ruleExecutionId, model)        path = "/api/v2/advancedrules/accounts/#{accountId}/executions/#{ruleExecutionId}"
        put(path, model)      end
    end
  end
end