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
        post(path, model, {}, AvaTax::VERSION)      end

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
        post(path, model, {}, AvaTax::VERSION)      end

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
        post(path, model, {}, AvaTax::VERSION)      end

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
        delete(path, {}, AvaTax::VERSION)      end

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
        delete(path, {}, AvaTax::VERSION)      end

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
        delete(path, {}, AvaTax::VERSION)      end

      # Retrieve the full list of Avalara-supported subscription (ServiceTypes)
      #
      # For Registrar Use Only
      # This API is for use by Avalara Registrar administrative users only.
      #
      # Returns the full list of Avalara-supported subscription types.
      # This API is intended to be useful for identifying which features you have added to your account.
      # You may always contact Avalara's sales department for information on available products or services.
      # You cannot change your subscriptions/service directly through the API.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* system, taxTypeGroupIdSK
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_service_types(options={})        path = "/api/v2/servicetypes/servicetypes"
        get(path, options, AvaTax::VERSION)      end

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
        post(path, model, options, AvaTax::VERSION)      end

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
        put(path, model, {}, AvaTax::VERSION)      end

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
        put(path, model, {}, AvaTax::VERSION)      end

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
        put(path, model, {}, AvaTax::VERSION)      end
    end
  end
end