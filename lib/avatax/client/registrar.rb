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
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] The account you wish to create.
      # @return [AccountModel[]]
      def create_account(model)        path = "/api/v2/accounts"
        post(path, model, {}, "22.6.1")      end

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
      # A Global notification is a message which is directed to all the accounts and is set to expire within
      # a certain time and cannot be dismissed by the user. Make accountId and companyId null to create a global notification.
      #
      # An example of a notification would be a message about new software, or a change to AvaTax that may
      # affect you, or a potential issue with your company's tax profile.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API is available by invitation only. To request access to this feature, please speak to a business development manager and request access to [NotificationsAPI:Create].
      # Swagger Name: AvaTaxClient	  
      # @param model [NotificationModel[]] The notifications you wish to create.
      # @return [NotificationModel[]]
      def create_notifications(model)        path = "/api/v2/notifications"
        post(path, model, {}, "22.6.1")      end

      # Create a new subscription
      #
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Create one or more new subscription objects attached to this account.
      # A 'subscription' indicates a licensed subscription to a named Avalara service.
      # To request or remove subscriptions, please contact Avalara sales or your customer account manager.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The ID of the account that owns this subscription.
      # @param model [SubscriptionModel[]] The subscription you wish to create.
      # @return [SubscriptionModel[]]
      def create_subscriptions(accountId, model)        path = "/api/v2/accounts/#{accountId}/subscriptions"
        post(path, model, {}, "22.6.1")      end

      # Delete a single account
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Delete an account.
      # Deleting an account will delete all companies, all account level users and license keys attached to this account.
      #
      # ### Security Policies
      #
      # * This API requires the user role SystemAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the account you wish to delete.
      # @return [ErrorDetail[]]
      def delete_account(id)        path = "/api/v2/accounts/#{id}"
        delete(path, {}, "22.6.1")      end

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
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API is available by invitation only. To request access to this feature, please speak to a business development manager and request access to [NotificationsAPI:Create].
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The id of the notification you wish to delete.
      # @return [ErrorDetail[]]
      def delete_notification(id)        path = "/api/v2/notifications/#{id}"
        delete(path, {}, "22.6.1")      end

      # Delete a single subscription
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Mark the existing account identified by this URL as deleted.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The ID of the account that owns this subscription.
      # @param id [Integer] The ID of the subscription you wish to delete.
      # @return [ErrorDetail[]]
      def delete_subscription(accountId, id)        path = "/api/v2/accounts/#{accountId}/subscriptions/#{id}"
        delete(path, {}, "22.6.1")      end

      # Reset a user's password programmatically
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Allows a system admin to reset the password for a specific user via the API.
      # This API is only available for Avalara Registrar Admins, and can be used to reset the password of any
      # user based on internal Avalara business processes.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API is available to Avalara system-level (registrar-level) users only.
      # Swagger Name: AvaTaxClient	  
      # @param userId [Integer] The unique ID of the user whose password will be changed
      # @param isUndoMigrateRequest [Boolean] If user's password was migrated to AI, undo this.
      # @param model [Object] The new password for this user
      # @return [String]
      def reset_password(userId, model, options={})        path = "/api/v2/passwords/#{userId}/reset"
        post(path, model, options, "22.6.1")      end

      # Update a single account
      #
      # # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Replace an existing account object with an updated account object.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the account you wish to update.
      # @param model [Object] The account object you wish to update.
      # @return [Object]
      def update_account(id, model)        path = "/api/v2/accounts/#{id}"
        put(path, model, {}, "22.6.1")      end

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
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API is available by invitation only. To request access to this feature, please speak to a business development manager and request access to [NotificationsAPI:Create].
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The id of the notification you wish to update.
      # @param model [Object] The notification object you wish to update.
      # @return [Object]
      def update_notification(id, model)        path = "/api/v2/notifications/#{id}"
        put(path, model, {}, "22.6.1")      end

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
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param accountId [Integer] The ID of the account that this subscription belongs to.
      # @param id [Integer] The ID of the subscription you wish to update
      # @param model [Object] The subscription you wish to update.
      # @return [Object]
      def update_subscription(accountId, id, model)        path = "/api/v2/accounts/#{accountId}/subscriptions/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end