module AvaTax
  class Client
    module Free 


      # FREE API - Request a free trial of AvaTax
      #
      # Call this API to obtain a free AvaTax account.
      #
      # This API is free to use. No authentication credentials are required to call this API. You must read and
      # accept [Avalara's terms and conditions](https://www1.avalara.com/us/en/legal/terms.html) for the account to be
      # created.
      #
      # If all conditions are met, this API will grant a free trial version of AvaTax. For a list of functionality
      # available in the free trial and its limitations, please see the [AvaTax Developer Website Free Trial page](https://developer.avalara.com/avatax/signup/).
      #
      # After your free trial concludes, you will still be able to use the [Free AvaTax API Suite](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Free/).
      #
      # ### Security Policies
      #
      # * This API may be called without providing authentication credentials.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] Required information to provision a free trial account.
      # @return [Object]
      def request_free_trial(model)        path = "/api/v2/accounts/freetrials/request"
        post(path, model, {}, "22.6.1")      end
    end
  end
end