module AvaTax
  class Client
    module Utilities 


      # Checks if the current user is subscribed to a specific service
      #
      # Returns a subscription object for the current account, or 404 Not Found if this subscription is not enabled for this account.
      #
      # This API will return an error if it is called with invalid authentication credentials.
      #
      # This API is intended to help you determine whether you have the necessary subscription to use certain API calls
      # within AvaTax. You can examine the subscriptions returned from this API call to look for a particular product
      # or subscription to provide useful information to the current user as to whether they are entitled to use
      # specific features of AvaTax.
      # Swagger Name: AvaTaxClient	  
      # @param serviceTypeId [String] The service to check
      # @return [Object]
      def get_my_subscription(serviceTypeId)        path = "/api/v2/utilities/subscriptions/#{serviceTypeId}"
        get(path, {}, "22.6.1")      end

      # List all services to which the current user is subscribed
      #
      # Returns the list of all subscriptions enabled for the currently logged in user.
      #
      # This API will return an error if it is called with invalid authentication credentials.
      #
      # This API is intended to help you determine whether you have the necessary subscription to use certain API calls
      # within AvaTax. You can examine the subscriptions returned from this API call to look for a particular product
      # or subscription to provide useful information to the current user as to whether they are entitled to use
      # specific features of AvaTax.
      # Swagger Name: AvaTaxClient	  
      # @return [FetchResult]
      def list_my_subscriptions()        path = "/api/v2/utilities/subscriptions"
        get(path, {}, "22.6.1")      end

      # Tests connectivity and version of the service
      #
      # Check connectivity to AvaTax and return information about the AvaTax API server.
      #
      # This API is intended to help you verify that your connection is working. This API will always succeed and will
      # never return a error. It provides basic information about the server you connect to:
      #
      # * `version` - The version number of the AvaTax API server that responded to your request. The AvaTax API version number is updated once per month during Avalara's update process.
      # * `authenticated` - A boolean flag indicating whether or not you sent valid credentials with your API request.
      # * `authenticationType` - If you provided valid credentials to the API, this field will tell you whether you used Bearer, Username, or LicenseKey authentication.
      # * `authenticatedUserName` - If you provided valid credentials to the API, this field will tell you the username of the currently logged in user.
      # * `authenticatedUserId` - If you provided valid credentials to the API, this field will tell you the user ID of the currently logged in user.
      # * `authenticatedAccountId` - If you provided valid credentials to the API, this field will contain the account ID of the currently logged in user.
      #
      # This API helps diagnose connectivity problems between your application and AvaTax; you may call this API even
      # if you do not have verified connection credentials. If this API fails, either your computer is not connected to
      # the internet, or there is a routing problem between your office and Avalara, or the Avalara server is not available.
      # For more information on the uptime of AvaTax, please see [Avalara's AvaTax Status Page](https://status.avalara.com/).
      #
      # ### Security Policies
      #
      # * This API may be called without providing authentication credentials.
      # Swagger Name: AvaTaxClient	  
      # @return [Object]
      def ping()        path = "/api/v2/utilities/ping"
        get(path, {}, "22.6.1")      end
    end
  end
end