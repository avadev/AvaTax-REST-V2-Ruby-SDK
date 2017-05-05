module AvaTax
  class Client
    module Accounts 


      # Reset this account's license key
      # 
      # Resets the existing license key for this account to a new key.
      # To reset your account, you must specify the ID of the account you wish to reset and confirm the action.
      # Resetting a license key cannot be undone. Any previous license keys will immediately cease to work when a new key is created.
      # 
      # @param int id The ID of the account you wish to update.
      # @param ResetLicenseKeyModel model A request confirming that you wish to reset the license key of this account.
      # @return LicenseKeyModel
      def account_reset_license_key(id, model)
        path = "/api/v2/accounts/#{id}/resetlicensekey"
        
        post(path, model)
      end


      # Retrieve a single account
      # 
      # Get the account object identified by this URL.
      # You may use the '$include' parameter to fetch additional nested data:
      # 
      # * Subscriptions
      # * Users
      # 
      # @param int id The ID of the account to retrieve
      # @param string include A comma separated list of child objects to return underneath the primary object.
      # @return AccountModel
      def get_account(id, options={})
        path = "/api/v2/accounts/#{id}"
        
        get(path, options)
      end


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
      # @param int id 
      # @return AccountConfigurationModel[]
      def get_account_configuration(id)
        path = "/api/v2/accounts/#{id}/configuration"
        
        get(path)
      end


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
      # @param int id 
      # @param AccountConfigurationModel[] model 
      # @return AccountConfigurationModel[]
      def set_account_configuration(id, model)
        path = "/api/v2/accounts/#{id}/configuration"
        
        post(path, model)
      end

    end
  end
end