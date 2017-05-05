module AvaTax
  class Client
    module Users 


      # Retrieve a single user
      # 
      # Get the user object identified by this URL.
      # A user represents one person with access privileges to make API calls and work with a specific account.
      # 
      # @param int id The ID of the user to retrieve.
      # @param int accountId The accountID of the user you wish to get.
      # @param string include A comma separated list of child objects to return underneath the primary object.
      # @return UserModel
      def get_user(id, accountId, options={})
        path = "/api/v2/accounts/#{accountId}/users/#{id}"
        
        get(path, options)
      end


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
      # @param int id The ID of the user to retrieve.
      # @param int accountId The accountID of the user you wish to get.
      # @return UserEntitlementModel
      def get_user_entitlements(id, accountId)
        path = "/api/v2/accounts/#{accountId}/users/#{id}/entitlements"
        
        get(path)
      end


      # Retrieve users for this account
      # 
      # List all user objects attached to this account.
      # A user represents one person with access privileges to make API calls and work with a specific account.
      # 
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # 
      # @param int accountId The accountID of the user you wish to list.
      # @param string include A comma separated list of child objects to return underneath the primary object.
      # @param string filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param int top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def list_users_by_account(accountId, options={})
        path = "/api/v2/accounts/#{accountId}/users"
        
        get(path, options)
      end


      # Retrieve all users
      # 
      # Get multiple user objects across all accounts.
      # A user represents one person with access privileges to make API calls and work with a specific account.
      # 
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # 
      # @param string include A comma separated list of child objects to return underneath the primary object.
      # @param string filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param int top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def query_users(options={})
        path = "/api/v2/users"
        
        get(path, options)
      end


      # Update a single user
      # 
      # Replace the existing user object at this URL with an updated object.
      # A user represents one person with access privileges to make API calls and work with a specific account.
      # All data from the existing object will be replaced with data in the object you PUT. 
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # 
      # @param int id The ID of the user you wish to update.
      # @param int accountId The accountID of the user you wish to update.
      # @param UserModel model The user object you wish to update.
      # @return UserModel
      def update_user(id, accountId, model)
        path = "/api/v2/accounts/#{accountId}/users/#{id}"
        
        put(path, model)
      end

    end
  end
end