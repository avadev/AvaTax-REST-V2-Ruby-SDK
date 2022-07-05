module AvaTax
  class Client
    module Provisioning 


      # Request a new Avalara account
      #
      # This API is for use by partner provisioning services customers only.
      #
      # Avalara invites select partners to refer new customers to the AvaTax service using the onboarding features
      # of AvaTax. These partners can create accounts for new customers using this API.
      #
      # Calling this API creates an account with the specified product subscriptions, but does not configure billing.
      # The customer will receive information from Avalara about how to configure billing for their account.
      # You should call this API when a customer has requested to begin using Avalara services.
      #
      # If the newly created account owner wishes, they can confirm that they have read and agree to the Avalara
      # terms and conditions. If they do so, they can receive a license key as part of this API and their
      # API will be created in `Active` status. If the customer has not yet read and accepted these terms and
      # conditions, the account will be created in `New` status and they can receive a license key by logging
      # onto the AvaTax website and reviewing terms and conditions online.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API is available by invitation only.
      # * This API is available by invitation only. To request access to this feature, please speak to a business development manager and request access to [Provisioning:RequestNewAccount].
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] Information about the account you wish to create and the selected product offerings.
      # @return [Object]
      def request_new_account(model)        path = "/api/v2/accounts/request"
        post(path, model, {}, "22.6.1")      end

      # Request a new entitilement to an existing customer
      #
      # This API is for use by partner provisioning services customers only. This will allow the partners to allow
      # the add new entitlement to an existing customer
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API is available by invitation only.
      # * This API is available by invitation only. To request access to this feature, please speak to a business development manager and request access to [Provisioning:RequestNewAccount].
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The avatax account id of the customer
      # @param offer [String] The offer to be added to an already existing customer
      # @return [Object]
      def request_new_entitlement(id, offer)        path = "/api/v2/accounts/#{id}/entitlements/#{offer}"
        post(path, {}, "22.6.1")      end
    end
  end
end