module AvaTax
  class Client
    module Onboarding 


      # Request a new Avalara account
      #
      # This API is for use by partner onboarding services customers only.
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
      # onto AvaTax and reviewing terms and conditions online.
      # @param model [Object] Information about the account you wish to create and the selected product offerings.
      # @return [Object]
      def request_new_account(model)
        path = "/api/v2/accounts/request"
        post(path, model)
      end

    end
  end
end