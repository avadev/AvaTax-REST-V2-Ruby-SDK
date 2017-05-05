module AvaTax
  class Client
    module Accounts
      # Retrieve all accounts
      #
      # # For Registrar Use Only
      #
      # @param options [Hash] with include, filter, top, skip, and order_by params
      # @return [Hashie::Mash] The requested accounts.
      # @example Returns a list of accounts
      #   AvaTax.query_accounts({ $filter: '' })
      #
      # _You must be authenticated as an Avalara Registrar to use this route_
      # @see http://developer.avalara.com/avatax/filtering-in-rest/ More information on filtering in REST
      def query_accounts(options={})
        get('/api/v2/accounts', options)
      end

      # Retrieve an account
      #
      # @param include [Array] an array of child objects to return underneath the primary object.
      # The include array can contain
      #
      # * Subscriptions
      # * Users 
      # @return [Hashie::Mash] The requested accounts.
      # @example Returns a list of accounts
      #   AvaTax.query_accounts({ $filter: 'id in (111444, 222555)' })
      def get_account(id, include=[])
        if !include.empty?
          options = {
            '$include': include.join(','),
          }
        end
        get("/api/v2/accounts/#{id}", options || {})
      end

      # Create an AvaTax account
      #
      # # For Registrar Use Only
      # Create an account
      #
      # @param model [Hash] the account object you wish to create
      #
      # @return [Hashie::Mash] AccountModel
      # @example Creates an account
      #   AvaTax.create_account({ id: 1233, name: 'Avalara', ... })
      def create_account(model)
        post("/api/v2/accounts", model)
      end


      # Update a single account
      #
      # # For Registrar Use Only
      # Delete an account. Deleting an account will delete all companies and all account level users attached to this account.
      #
      # @param id [Integer] the ID of the account to update
      # @param model [Hash] the account object you wish to udpate
      #
      # @return [Hashie::Mash] AccountModel
      # @example Updates an existing account
      #   AvaTax.update_account(10, { id: 10, name: 'Avalara', ... })
      def update_account(id, model)
        post("/api/v2/accounts/#{id}", model)
      end

      # Delete a single account
      #
      # # For Registrar Use Only
      #
      # @param id [Integer] the ID of the account to delete
      #
      # @return [Hashie:Mash] information about the account deletion
      # @example Deletes an existing account
      #   AvaTax.delete_account(10)
      def delete_account(id)
        res = delete("/api/v2/accounts/#{id}")
        res.is_a?(Array) ? res[0] : res
      end

      # Resets the existing license key for this account to a new key. To reset your account, you must specify the ID of the account you wish to reset and confirm the action. Resetting a license key cannot be undone. Any previous license keys will immediately cease to work when a new key is created.
      #
      # @param options [Hash] should be a hash with { confirmResetLicenseKey: true }
      #
      # @return [Hashie::Mash] The result of the action
      #
      # @example
      #   AvaTax.reset_license_key(4444999, { confirmLicenseKey: true })
      #```
      # {
      #  "accountId": 123456789,
      #  "privateLicenseKey": "742A02AA463CDE741E932EC365360CA3CF378BD9",
      #  "httpRequestHeader": "Basic MTIzNDU2Nzg5Ojc0MkEwMkFBNDYzQ0RFNzQxRTkzMkVDMzY1MzYwQ0EzQ0YzNzhCRDk="
      # }
      #```
      def reset_license_key(id, options={})
        post("/api/v2/accounts/#{id}/resetlicensekey", options)
      end

    end
  end
end
