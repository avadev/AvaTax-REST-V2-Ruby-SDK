module AvaTax
  class Client
    module Accounts 


      # Reset this account's license key
      #
      # Resets the existing license key for this account to a new key.
      #
      # To reset your account, you must specify the ID of the account you wish to reset and confirm the action.
      #
      # This API is only available to account administrators for the account in question, and may only be called after
      # an account has been activated by reading and accepting Avalara's terms and conditions. To activate your account
      # please log onto the AvaTax website or call the `ActivateAccount` API.
      #
      # You can only reset license with 'Default' license key name.
      # Resetting a license key cannot be undone. Any previous license keys will immediately cease to work when a new key is created.
      #
      # When you call this API, all account administrators for this account will receive an email with the newly updated license key.
      # The email will specify which user reset the license key and it will contain the new key to use to update your connectors.
      # Note: The reset license key functionality will only be available for existing active license key i.e. when you reset license key for the account, the Default license key will be reset.The reset license key functionality is not available for newly created license keys i.e. license keys other than Default
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the account you wish to update.
      # @param model [Object] A request confirming that you wish to reset the license key of this account.
      # @return [Object]
      def account_reset_license_key(id, model)        path = "/api/v2/accounts/#{id}/resetlicensekey"
        post(path, model, {}, "22.6.1")      end

      # Activate an account by accepting terms and conditions
      #
      # Activate the account specified by the unique accountId number.
      #
      # This activation request can only be called by account administrators. You must indicate
      # that you have read and accepted Avalara's terms and conditions to call this API.
      #
      # Once you have activated your account, use the `AccountResetLicenseKey` API to generate
      # a license key for your account.
      #
      # If you have not read or accepted the terms and conditions, this API call will return the
      # unchanged account model.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the account to activate
      # @param model [Object] The activation request
      # @return [Object]
      def activate_account(id, model)        path = "/api/v2/accounts/#{id}/activate"
        post(path, model, {}, "22.6.1")      end

      # Retrieve audit history for an account.
      #
      # Retrieve audit trace history for an account.
      #
      # Your audit trace history contains a record of all API calls made against the AvaTax REST API that returned an error. You can use this API to investigate
      # problems and see exactly what information was sent back and forth between your code and AvaTax.
      #
      # When specifying a start and end datetime, please include a valid timezone indicator, such as the "Z" present in the examples for the start and end query parameters.
      # You can learn more about valid time zone designators at https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators.
      #
      # This API enforces limits to the amount of data retrieved. These limits are subject to change.
      #
      # * You may request data from a maximum of a one-hour time period.
      # * The amount of data and number of API calls returned by this API are limited and may be adjusted at any time.
      # * Old records may be migrated out of immediately available storage. To request older data, please contact your account manager.
      # * New records must migrate to available storage before they can be retrieved. You may need to wait a period of time before newly created records can be fetched.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the account you wish to audit.
      # @param start [DateTime] The start datetime of audit history you with to retrieve, e.g. "2018-06-08T17:00:00Z". Defaults to the past 15 minutes.
      # @param end [DateTime] The end datetime of audit history you with to retrieve, e.g. "2018-06-08T17:15:00Z. Defaults to the current time. Maximum of an hour after the start time.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @return [FetchResult]
      def audit_account(id, options={})        path = "/api/v2/accounts/#{id}/audit"
        get(path, options, "22.6.1")      end

      # Create license key for this account
      #
      # Creates a new license key for this account.
      #
      # To create a license key for your account, you must specify the ID of the account and license key name.
      #
      # This API is only available to account administrators for the account in question, and may only be called after
      # an account has been activated by reading and accepting Avalara's terms and conditions. To activate your account
      # please log onto the AvaTax website or call the `ActivateAccount` API.
      #
      # You will reference this key using license key name. The existing license key will be using 'Default' as license key name.
      # Hence make sure that the license key name is unique per account considering the existing license key name 'Default'
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the account you wish to update.
      # @param model [Object] 
      # @return [Object]
      def create_license_key(id, model)        path = "/api/v2/accounts/#{id}/licensekey"
        post(path, model, {}, "22.6.1")      end

      # Delete license key for this account by license key name
      #
      # Deletes the license key for this account using license key name.
      #
      # To delete a license key for your account, you must specify the accountID of the account and license key name.
      #
      # This API is only available to account administrators for the account in question.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the account you wish to update.
      # @param licensekeyname [String] The license key name you wish to update.
      # @return [ErrorDetail[]]
      def delete_license_key(id, licensekeyname)        path = "/api/v2/accounts/#{id}/licensekey/#{licensekeyname}"
        delete(path, {}, "22.6.1")      end

      # Retrieve a single account
      #
      # Get the account object identified by this URL.
      # You may use the '$include' parameter to fetch additional nested data:
      #
      # * Subscriptions
      # * Users
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the account to retrieve
      # @param include [String] A comma separated list of special fetch options
      # @return [Object]
      def get_account(id, options={})        path = "/api/v2/accounts/#{id}"
        get(path, options, "22.6.1")      end

      # Get configuration settings for this account
      #
      # Retrieve a list of all configuration settings tied to this account.
      #
      # Configuration settings provide you with the ability to control features of your account and of your
      # tax software. The category names `TaxServiceConfig` and `AddressServiceConfig` are reserved for
      # Avalara internal software configuration values; to store your own account-level settings, please
      # create a new category name that begins with `X-`, for example, `X-MyCustomCategory`.
      #
      # Account settings are permanent settings that cannot be deleted. You can set the value of an
      # account setting to null if desired.
      #
      # Avalara-based account settings for `TaxServiceConfig` and `AddressServiceConfig` affect your account's
      # tax calculation and address resolution, and should only be changed with care.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @return [AccountConfigurationModel[]]
      def get_account_configuration(id)        path = "/api/v2/accounts/#{id}/configuration"
        get(path, {}, "22.6.1")      end

      # Retrieve license key by license key name
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the account to retrieve
      # @param licensekeyname [String] The ID of the account to retrieve
      # @return [Object]
      def get_license_key(id, licensekeyname)        path = "/api/v2/accounts/#{id}/licensekey/#{licensekeyname}"
        get(path, {}, "22.6.1")      end

      # Retrieve all license keys for this account
      #
      # Gets list of all the license keys used by the account.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the account to retrieve
      # @return [AccountLicenseKeyModel[]]
      def get_license_keys(id)        path = "/api/v2/accounts/#{id}/licensekeys"
        get(path, {}, "22.6.1")      end

      # Retrieve all accounts
      #
      # List all account objects that can be seen by the current user.
      #
      # This API lists all accounts you are allowed to see. In general, most users will only be able to see their own account.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Subscriptions
      # * Users
      #
      # For more information about filtering in REST, please see the documentation at http://developer.avalara.com/avatax/filtering-in-rest/ .
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param include [String] A comma separated list of objects to fetch underneath this account. Any object with a URL path underneath this account can be fetched by specifying its name.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* subscriptions, users
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_accounts(options={})        path = "/api/v2/accounts"
        get(path, options, "22.6.1")      end

      # Change configuration settings for this account
      #
      # Update configuration settings tied to this account.
      #
      # Configuration settings provide you with the ability to control features of your account and of your
      # tax software. The category names `TaxServiceConfig` and `AddressServiceConfig` are reserved for
      # Avalara internal software configuration values; to store your own account-level settings, please
      # create a new category name that begins with `X-`, for example, `X-MyCustomCategory`.
      #
      # Account settings are permanent settings that cannot be deleted. You can set the value of an
      # account setting to null if desired.
      #
      # Avalara-based account settings for `TaxServiceConfig` and `AddressServiceConfig` affect your account's
      # tax calculation and address resolution, and should only be changed with care.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @param model [AccountConfigurationModel[]] 
      # @return [AccountConfigurationModel[]]
      def set_account_configuration(id, model)        path = "/api/v2/accounts/#{id}/configuration"
        post(path, model, {}, "22.6.1")      end
    end
  end
end