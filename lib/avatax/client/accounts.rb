module AvaTax
  class Client
    module Accounts 


      # Reset this account's license key
      # 
      # Resets the existing license key for this account to a new key.
      # To reset your account, you must specify the ID of the account you wish to reset and confirm the action.
      # Resetting a license key cannot be undone. Any previous license keys will immediately cease to work when a new key is created.
      # 
     * @param ResetLicenseKeyModel $model A request confirming that you wish to reset the license key of this account.
      # @return LicenseKeyModel
      def accountResetLicenseKey($id, $model)
        path = '/api/v2/accounts/#{id}/resetlicensekey';
        post (path)
      end


      # Retrieve a single account
      # 
      # Get the account object identified by this URL.
      # You may use the '$include' parameter to fetch additional nested data:
      # 
      # * Subscriptions
      # * Users
      # 
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @return AccountModel
      def getAccount($id, $include)
        path = '/api/v2/accounts/#{id}';
        get (path)
      end

    end
  end
end