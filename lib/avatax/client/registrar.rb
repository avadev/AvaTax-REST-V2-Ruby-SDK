module AvaTax
  class Client
    module Registrar 


      # Create a new account
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Create a single new account object.
      # When creating an account object you may attach subscriptions and users as part of the 'Create' call.
      # @param model [Object] The account you wish to create.
      # @return [AccountModel[]]
      def create_account(model)
        path = "/api/v2/accounts"
        post(path, model)
      end


      # Create new notifications.
      #
      # This API is available by invitation only.
      #
      # Create a single notification.
      #
      # A notification is a message from Avalara that may have relevance to your business. You may want
      # to regularly review notifications and then dismiss them when you are certain that you have addressed
      # any relevant concerns raised by this notification.
      #
      # An example of a notification would be a message about new software, or a change to AvaTax that may
      # affect you, or a potential issue with your company's tax profile.
      # @param model [NotificationModel[]] The notifications you wish to create.
      # @return [NotificationModel[]]
      def create_notifications(model)
        path = "/api/v2/notifications"
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
      # @param model [SubscriptionModel[]] The subscription you wish to create.
      # @return [SubscriptionModel[]]
      def create_subscriptions(accountId, model)
        path = "/api/v2/accounts/#{accountId}/subscriptions"
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
      # @return [ErrorDetail[]]
      def delete_account(id)
        path = "/api/v2/accounts/#{id}"
        delete(path)
      end


      # Delete a single notification.
      #
      # This API is available by invitation only.
      #
      # Delete the existing notification identified by this URL.
      #
      # A notification is a message from Avalara that may have relevance to your business. You may want
      # to regularly review notifications and then dismiss them when you are certain that you have addressed
      # any relevant concerns raised by this notification.
      #
      # An example of a notification would be a message about new software, or a change to AvaTax that may
      # affect you, or a potential issue with your company's tax profile.
      # @param id [Integer] The id of the notification you wish to delete.
      # @return [ErrorDetail[]]
      def delete_notification(id)
        path = "/api/v2/notifications/#{id}"
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
      # @return [ErrorDetail[]]
      def delete_subscription(accountId, id)
        path = "/api/v2/accounts/#{accountId}/subscriptions/#{id}"
        delete(path)
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


      # Update a single notification.
      #
      # This API is available by invitation only.
      #
      # Replaces the notification identified by this URL with a new notification.
      #
      # A notification is a message from Avalara that may have relevance to your business. You may want
      # to regularly review notifications and then dismiss them when you are certain that you have addressed
      # any relevant concerns raised by this notification.
      #
      # An example of a notification would be a message about new software, or a change to AvaTax that may
      # affect you, or a potential issue with your company's tax profile.
      # @param id [Integer] The id of the notification you wish to update.
      # @param model [Object] The notification object you wish to update.
      # @return [Object]
      def update_notification(id, model)
        path = "/api/v2/notifications/#{id}"
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