module AvaTax
  class Client
    module CurrencyRoundingRules 


      # Create one or more currency rounding rules
      #
      # Create one or more currency rounding rules for this account. Each rule sets the rounding
      # precision for a currency over an effective-date window.
      #
      # Windows for the same currency may overlap - for a given tax date the rule with the latest
      # `effDate` whose window contains that date applies. Two rules that share a `currencyCode`
      # and `effDate` are ambiguous and are rejected, whether the duplicate is against an existing
      # rule or against another rule in the same request.
      #
      # A rule can only be created for a currency that already has an Avalara system default (see
      # `GET api/v2/definitions/currencyroundingrules`).
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AvaTaxOnlyAccountAdmin, BatchServiceAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The unique ID number of the account that owns these currency rounding rules.
      # @param model [AccountCurrencyRoundingRuleModel[]] The currency rounding rule object or objects you wish to create.
      # @return [AccountCurrencyRoundingRuleModel[]]
      def create_currency_rounding_rules(accountId, model)        path = "/api/v2/accounts/#{accountId}/currencyroundingrules"
        post(path, model, {}, AvaTax::VERSION)      end

      # Delete a single currency rounding rule
      #
      # Deletes the currency rounding rule identified by this URL. After deletion, calculation for
      # that currency falls back to the Avalara default rule (or standard decimal precision if none).
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AvaTaxOnlyAccountAdmin, BatchServiceAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The unique ID number of the account that owns this currency rounding rule.
      # @param id [Integer] The unique ID number of the currency rounding rule to delete.
      # @return [ErrorDetail[]]
      def delete_currency_rounding_rule(accountId, id)        path = "/api/v2/accounts/#{accountId}/currencyroundingrules/#{id}"
        delete(path, {}, AvaTax::VERSION)      end

      # Retrieve a single currency rounding rule
      #
      # Retrieves a single currency rounding rule identified by this URL.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ECMAccountUser, ECMCompanyUser, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The ID of the account that owns this currency rounding rule.
      # @param id [Integer] The unique ID number of the currency rounding rule to retrieve.
      # @return [Object]
      def get_currency_rounding_rule(accountId, id)        path = "/api/v2/accounts/#{accountId}/currencyroundingrules/#{id}"
        get(path, {}, AvaTax::VERSION)      end

      # Retrieve all currency rounding rules for this account.
      #
      # Lists all account-specific currency rounding rules for this account.
      #
      # Only rules created for this account are returned. When no rule exists for a currency on a
      # transaction's tax date, the tax engine automatically applies the Avalara system default for
      # that currency; if no system default exists, standard decimal precision is used (no rounding).
      #
      # Each rule's `precision` is `0` (whole currency unit) or `2` (standard decimal cents).
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderBy` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ECMAccountUser, ECMCompanyUser, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The ID of the account whose currency rounding rules you wish to list.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* createdDate, createdUserId, modifiedUserId
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_currency_rounding_rules(accountId, options={})        path = "/api/v2/accounts/#{accountId}/currencyroundingrules"
        get(path, options, AvaTax::VERSION)      end

      # Update a currency rounding rule
      #
      # Replace the existing currency rounding rule at this URL with an updated object.
      #
      # All data from the existing object will be replaced with data in the object you PUT.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AvaTaxOnlyAccountAdmin, BatchServiceAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The unique ID number of the account that owns this currency rounding rule.
      # @param id [Integer] The unique ID number of the currency rounding rule to replace.
      # @param model [Object] The new currency rounding rule object to store.
      # @return [Object]
      def update_currency_rounding_rule(accountId, id, model)        path = "/api/v2/accounts/#{accountId}/currencyroundingrules/#{id}"
        put(path, model, {}, AvaTax::VERSION)      end
    end
  end
end