module AvaTax
  class Client
    module Registrar 


      # Change Password
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Allows a user to change their password via the API.
      # This API only allows the currently authenticated user to change their password; it cannot be used to apply to a
      # different user than the one authenticating the current API call.
      # @param model [Object] An object containing your current password and the new password.
      # @return [String]
      def change_password(model)
        path = "/api/v2/passwords"
        put(path, model)
      end


      # Create a new account
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Create a single new account object.
      # When creating an account object you may attach subscriptions and users as part of the 'Create' call.
      # @param model [Object] The account you wish to create.
      # @return [Object]
      def create_account(model)
        path = "/api/v2/accounts"
        post(path, model)
      end


      # Create a new subscription
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Create one or more new subscription objects attached to this account.
      # A 'subscription' indicates a licensed subscription to a named Avalara service.
      # To request or remove subscriptions, please contact Avalara sales or your customer account manager.
      # @param accountId [Integer] The ID of the account that owns this subscription.
      # @param model [object[]] The subscription you wish to create.
      # @return [object[]]
      def create_subscriptions(accountId, model)
        path = "/api/v2/accounts/#{accountId}/subscriptions"
        post(path, model)
      end


      # Create new users
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Create one or more new user objects attached to this account.
      # A user represents one person with access privileges to make API calls and work with a specific account.
      # @param accountId [Integer] The unique ID number of the account where these users will be created.
      # @param model [object[]] The user or array of users you wish to create.
      # @return [object[]]
      def create_users(accountId, model)
        path = "/api/v2/accounts/#{accountId}/users"
        post(path, model)
      end


      # Delete a single account
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Delete an account.
      # Deleting an account will delete all companies and all account level users attached to this account.
      # @param id [Integer] The ID of the account you wish to delete.
      # @return [object[]]
      def delete_account(id)
        path = "/api/v2/accounts/#{id}"
        delete(path)
      end


      # Delete a single subscription
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Mark the existing account identified by this URL as deleted.
      # @param accountId [Integer] The ID of the account that owns this subscription.
      # @param id [Integer] The ID of the subscription you wish to delete.
      # @return [object[]]
      def delete_subscription(accountId, id)
        path = "/api/v2/accounts/#{accountId}/subscriptions/#{id}"
        delete(path)
      end


      # Delete a single user
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Mark the user object identified by this URL as deleted.
      # @param id [Integer] The ID of the user you wish to delete.
      # @param accountId [Integer] The accountID of the user you wish to delete.
      # @return [object[]]
      def delete_user(id, accountId)
        path = "/api/v2/accounts/#{accountId}/users/#{id}"
        delete(path)
      end


      # Retrieve all accounts
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Get multiple account objects.
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Subscriptions
      # * Users
      #
      # For more information about filtering in REST, please see the documentation at http://developer.avalara.com/avatax/filtering-in-rest/ .
      # @param include [String] A comma separated list of child objects to return underneath the primary object.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_accounts(options={})
        path = "/api/v2/accounts"
        get(path, options)
      end


      # Reset a user's password programmatically
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Allows a system admin to reset the password for a specific user via the API.
      # This API is only available for Avalara Registrar Admins, and can be used to reset the password of any
      # user based on internal Avalara business processes.
      # @param userId [Integer] The unique ID of the user whose password will be changed
      # @param model [Object] The new password for this user
      # @return [String]
      def reset_password(userId, model)
        path = "/api/v2/passwords/#{userId}/reset"
        post(path, model)
      end


      # Update a single account
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Replace an existing account object with an updated account object.
      # @param id [Integer] The ID of the account you wish to update.
      # @param model [Object] The account object you wish to update.
      # @return [Object]
      def update_account(id, model)
        path = "/api/v2/accounts/#{id}"
        put(path, model)
      end


      # Update a single subscription
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Replace the existing subscription object at this URL with an updated object.
      # A 'subscription' indicates a licensed subscription to a named Avalara service.
      # To request or remove subscriptions, please contact Avalara sales or your customer account manager.
      # All data from the existing object will be replaced with data in the object you PUT.
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # @param accountId [Integer] The ID of the account that this subscription belongs to.
      # @param id [Integer] The ID of the subscription you wish to update
      # @param model [Object] The subscription you wish to update.
      # @return [Object]
      def update_subscription(accountId, id, model)
        path = "/api/v2/accounts/#{accountId}/subscriptions/#{id}"
        put(path, model)
      end

    end
  end
end