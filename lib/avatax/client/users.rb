module AvaTax
  class Client
    module Users 


      # Change Password
      #
      # Allows a user to change their password via an API call.
      #
      # This API allows an authenticated user to change their password via an API call. This feature is only available
      # for accounts that do not use SAML integrated password validation.
      #
      # This API only allows the currently authenticated user to change their password; it cannot be used to apply to a
      # different user than the one authenticating the current API call.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] An object containing your current password and the new password.
      # @return [String]
      def change_password(model)        path = "/api/v2/passwords"
        put(path, model, {}, "22.6.1")      end

      # Create new users
      #
      # Create one or more new user objects attached to this account.
      #
      # A user represents one person with access privileges to make API calls and work with a specific account.
      #
      # Users who are account administrators or company users are permitted to create user records to invite
      # additional team members to work with AvaTax.
      #
      # A newly created user will receive an email inviting them to create their password. This means that you
      # must provide a valid email address for all user accounts created.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The unique ID number of the account where these users will be created.
      # @param model [UserModel[]] The user or array of users you wish to create.
      # @return [UserModel[]]
      def create_users(accountId, model)        path = "/api/v2/accounts/#{accountId}/users"
        post(path, model, {}, "22.6.1")      end

      # Delete a single user
      #
      # Mark the user object identified by this URL as deleted.
      #
      # This API is available for use by account and company administrators only.
      #
      # Account and company administrators may only delete users within the appropriate organizations
      # they control.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, Compliance Root User, CSPTester, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TreasuryAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the user you wish to delete.
      # @param accountId [Integer] The accountID of the user you wish to delete.
      # @return [ErrorDetail[]]
      def delete_user(id, accountId)        path = "/api/v2/accounts/#{accountId}/users/#{id}"
        delete(path, {}, "22.6.1")      end

      # Retrieve a single user
      #
      # Get the user object identified by this URL.
      # A user represents one person with access privileges to make API calls and work with a specific account.
      #
      #  You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * FetchDeleted
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the user to retrieve.
      # @param accountId [Integer] The accountID of the user you wish to get.
      # @param include [String] Optional fetch commands.
      # @return [Object]
      def get_user(id, accountId, options={})        path = "/api/v2/accounts/#{accountId}/users/#{id}"
        get(path, options, "22.6.1")      end

      # Retrieve all entitlements for a single user
      #
      # Return a list of all entitlements to which this user has rights to access.
      # Entitlements are a list of specified API calls the user is permitted to make, a list of identifier numbers for companies the user is
      # allowed to use, and an access level identifier that indicates what types of access roles the user is allowed to use.
      # This API call is intended to provide a validation endpoint to determine, before making an API call, whether this call is likely to succeed.
      # For example, if user 567 within account 999 is attempting to create a new child company underneath company 12345, you could preview the user's
      # entitlements and predict whether this call would succeed:
      #
      # * Retrieve entitlements by calling '/api/v2/accounts/999/users/567/entitlements' . If the call fails, you do not have accurate
      #  credentials for this user.
      # * If the 'accessLevel' field within entitlements is 'None', the call will fail.
      # * If the 'accessLevel' field within entitlements is 'SingleCompany' or 'SingleAccount', the call will fail if the companies
      #  table does not contain the ID number 12345.
      # * If the 'permissions' array within entitlements does not contain 'AccountSvc.CompanySave', the call will fail.
      #
      # For a full list of defined permissions, please use '/api/v2/definitions/permissions' .
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the user to retrieve.
      # @param accountId [Integer] The accountID of the user you wish to get.
      # @return [Object]
      def get_user_entitlements(id, accountId)        path = "/api/v2/accounts/#{accountId}/users/#{id}/entitlements"
        get(path, {}, "22.6.1")      end

      # Retrieve users for this account
      #
      # List all user objects attached to this account.
      # A user represents one person with access privileges to make API calls and work with a specific account.
      #
      # When an API is called using a legacy AvaTax License Key, the API log entry is recorded as being performed by a special user attached to that license key.
      # By default, this API will not return a listing of license key users. Users with registrar-level security may call this API to list license key users.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * FetchDeleted
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The accountID of the user you wish to list.
      # @param include [String] Optional fetch commands.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* SuppressNewUserEmail
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_users_by_account(accountId, options={})        path = "/api/v2/accounts/#{accountId}/users"
        get(path, options, "22.6.1")      end

      # Retrieve all users
      #
      # Get multiple user objects across all accounts.
      #
      # A user represents one person or set of credentials with access privileges to make API calls and work with a specific account. A user can be authenticated
      # via either username / password authentication, an OpenID / OAuth Bearer Token, or a legacy AvaTax License Key.
      #
      # When an API is called using a legacy AvaTax License Key, the API log entry is recorded as being performed by a special user attached to that license key.
      # By default, this API will not return a listing of license key users. Users with registrar-level security may call this API to list license key users.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * FetchDeleted
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param include [String] Optional fetch commands.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* SuppressNewUserEmail
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_users(options={})        path = "/api/v2/users"
        get(path, options, "22.6.1")      end

      # Update a single user
      #
      # Replace the existing user object at this URL with an updated object.
      # A user represents one person with access privileges to make API calls and work with a specific account.
      # All data from the existing object will be replaced with data in the object you PUT.
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the user you wish to update.
      # @param accountId [Integer] The accountID of the user you wish to update.
      # @param model [Object] The user object you wish to update.
      # @return [Object]
      def update_user(id, accountId, model)        path = "/api/v2/accounts/#{accountId}/users/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end