module AvaTax
  class Client
    module Onboarding 


      # Request a new Avalara account
      # 
      # This API is for use by partner onboarding services customers only.
      # Calling this API creates an account with the specified product subscriptions, but does not configure billing.
      # The customer will receive information from Avalara about how to configure billing for their account.
      # You should call this API when a customer has requested to begin using Avalara services.
      # 
      # @param NewAccountRequestModel $model Information about the account you wish to create and the selected product offerings.
      # @return NewAccountModel
      def requestNewAccount($model)
        path = '/api/v2/accounts/request';
        post (path)
      end

    end
  end
end