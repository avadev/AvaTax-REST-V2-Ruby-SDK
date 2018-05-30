module AvaTax
  class Client
    module AdvancedRules 


      # Approve an advanced rule script to run.
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration.
      # @param accountId [Integer] The ID of the account that owns the Advanced Rule.
      # @param scriptType [String] The script transform type: Request or Response. (See AdvancedRuleScriptType::* for a list of allowable values)
      # @return [Object]
      def approve_advanced_rule_script(accountId, scriptType)
        path = "/api/v2/accounts/#{accountId}/advancedrulescripts/#{scriptType}/approve"
        post(path)
      end


      # Create an advanced rule.
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration.
      # @param accountId [Integer] The ID of the account that will own the Advanced Rule.
      # @param scriptType [String] The script transform type, Request or Response. (See AdvancedRuleScriptType::* for a list of allowable values)
      # @param crashBehavior [String] The behavior the script should take if it crashes: Fail or Proceed. (See AdvancedRuleCrashBehavior::* for a list of allowable values)
      # @param file [Object] The JavaScript file containing the advanced rule.
      # @return [String]
      def create_advanced_rule_script(accountId, scriptType, options={})
        path = "/api/v2/accounts/#{accountId}/advancedrulescripts/#{scriptType}"
        post(path, options)
      end


      # Create a lookup table for an advanced rule
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration.
      # @param accountId [Integer] The ID of the account that owns the Advanced Rule.
      # @param csvTableName [String] The name to assign the CSV lookup table.
      # @param file [Object] A CSV file containing lookup data for an advanced rule.
      # @return [String]
      def create_advanced_rule_table(accountId, csvTableName)
        path = "/api/v2/accounts/#{accountId}/advancedruletables/#{csvTableName}"
        post(path)
      end


      # Delete an account's active advanced rule
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration.
      # @param accountId [Integer] The ID of the account that owns the Advanced Rule.
      # @param scriptType [String] The script transform type: Request or Response. (See AdvancedRuleScriptType::* for a list of allowable values)
      # @return [ErrorDetail[]]
      def delete_advanced_rule_script(accountId, scriptType)
        path = "/api/v2/accounts/#{accountId}/advancedrulescripts/#{scriptType}"
        delete(path)
      end


      # Delete a lookup table for an advanced rule.
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration.
      # @param accountId [Integer] The ID of the account that owns the Advanced Rule.
      # @param csvTableName [String] The name of the CSV lookup table to delete.
      # @return [ErrorDetail[]]
      def delete_advanced_rule_table(accountId, csvTableName)
        path = "/api/v2/accounts/#{accountId}/advancedruletables/#{csvTableName}"
        delete(path)
      end


      # Disable an advanced rule so that it cannot be run.
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration. ///
      # @param accountId [Integer] 
      # @param scriptType [String] The script transform type: Request or Response. (See AdvancedRuleScriptType::* for a list of allowable values)
      # @return [Object]
      def disable_advanced_rule_script(accountId, scriptType)
        path = "/api/v2/accounts/#{accountId}/advancedrulescripts/#{scriptType}/disable"
        post(path)
      end


      # Enable an approved advanced rule so that it can be run.
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration.
      # @param accountId [Integer] 
      # @param scriptType [String] The script transform type: Request or Response. (See AdvancedRuleScriptType::* for a list of allowable values)
      # @return [Object]
      def enable_advanced_rule_script(accountId, scriptType)
        path = "/api/v2/accounts/#{accountId}/advancedrulescripts/#{scriptType}/enable"
        post(path)
      end


      # Get an account's advanced rule script.
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration.
      # @param accountId [Integer] The ID of the account that owns the Advanced Rule.
      # @param scriptType [String] The script transform type: Request or Response. (See AdvancedRuleScriptType::* for a list of allowable values)
      # @return [Object]
      def get_advanced_rule_script(accountId, scriptType)
        path = "/api/v2/accounts/#{accountId}/advancedrulescripts/#{scriptType}"
        get(path)
      end


      # Get an advanced rule lookup table for an account
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration.
      # @param accountId [Integer] The ID of the account that owns the Advanced Rule.
      # @param csvTableName [String] The name of the CSV lookup table to get.
      # @return [Object]
      def get_advanced_rule_table(accountId, csvTableName)
        path = "/api/v2/accounts/#{accountId}/advancedruletables/#{csvTableName}"
        get(path)
      end


      # Get all advanced rule lookup tables for an account
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration.
      # @param accountId [Integer] The ID of the account that owns the Advanced Rule.
      # @return [Object]
      def get_advanced_rule_tables(accountId)
        path = "/api/v2/accounts/#{accountId}/advancedruletables"
        get(path)
      end


      # Unapprove an advanced rule script so that it cannot be run.
      #
      # This API is available by invite only and implementation support is required.
      # Please contact your Customer Account Manager if you are interested in using
      # Advanced Rules in your AvaTax integration.
      # @param accountId [Integer] The ID of the account that owns the Advanced Rule.
      # @param scriptType [String] The script transform type: Request or Response. (See AdvancedRuleScriptType::* for a list of allowable values)
      # @return [Object]
      def unapprove_advanced_rule_script(accountId, scriptType)
        path = "/api/v2/accounts/#{accountId}/advancedrulescripts/#{scriptType}/unapprove"
        post(path)
      end

    end
  end
end