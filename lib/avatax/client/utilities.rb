module AvaTax
  class Client
    module Utilities 


      # Checks if the current user is subscribed to a specific service
      # 
      # Returns a subscription object for the current account, or 404 Not Found if this subscription is not enabled for this account.
      # This API call is intended to allow you to identify whether you have the necessary account configuration to access certain
      # features of AvaTax, and would be useful in debugging access privilege problems.
      # 
      # @return SubscriptionModel
      def getMySubscription($serviceTypeId)
        path = '/api/v2/utilities/subscriptions/#{serviceTypeId}';
        get (path)
      end


      # List all services to which the current user is subscribed
      # 
      # Returns the list of all subscriptions enabled for the current account.
      # This API is intended to help you determine whether you have the necessary subscription to use certain API calls
      # within AvaTax.
      # 
      # @return FetchResult
      def listMySubscriptions()
        path = '/api/v2/utilities/subscriptions';
        get (path)
      end


      # Tests connectivity and version of the service
      # 
      # This API helps diagnose connectivity problems between your application and AvaTax; you may call this API even 
      # if you do not have verified connection credentials.
      # The results of this API call will help you determine whether your computer can contact AvaTax via the network,
      # whether your authentication credentials are recognized, and the roundtrip time it takes to communicate with
      # AvaTax.
      # 
      # @return PingResultModel
      def ping()
        path = '/api/v2/utilities/ping';
        get (path)
      end

    end
  end
end