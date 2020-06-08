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
      # @param model [Object] Required information to provision a free trial account.
      # @return [Object]
      def request_free_trial(model)
        path = "/api/v2/accounts/freetrials/request"
        post(path, model)
      end


      # FREE API - Sales tax rates for a specified address
      #
      # # Free-To-Use
      #
      # The TaxRates API is a free-to-use, no cost option for estimating sales tax rates.
      # Any customer can request a free AvaTax account and make use of the TaxRates API.
      #
      # Usage of this API is subject to rate limits. Users who exceed the rate limit will receive HTTP
      # response code 429 - `Too Many Requests`.
      #
      # This API assumes that you are selling general tangible personal property at a retail point-of-sale
      # location in the United States only.
      #
      # For more powerful tax calculation, please consider upgrading to the `CreateTransaction` API,
      # which supports features including, but not limited to:
      #
      # * Nexus declarations
      # * Taxability based on product/service type
      # * Sourcing rules affecting origin/destination states
      # * Customers who are exempt from certain taxes
      # * States that have dollar value thresholds for tax amounts
      # * Refunds for products purchased on a different date
      # * Detailed jurisdiction names and state assigned codes
      # * And more!
      #
      # Please see [Estimating Tax with REST v2](http://developer.avalara.com/blog/2016/11/04/estimating-tax-with-rest-v2/)
      # for information on how to upgrade to the full AvaTax CreateTransaction API.
      # @param line1 [String] The street address of the location.
      # @param line2 [String] The street address of the location.
      # @param line3 [String] The street address of the location.
      # @param city [String] The city name of the location.
      # @param region [String] Name or ISO 3166 code identifying the region within the country.     This field supports many different region identifiers:   * Two and three character ISO 3166 region codes   * Fully spelled out names of the region in ISO supported languages   * Common alternative spellings for many regions     For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
      # @param postalCode [String] The postal code of the location.
      # @param country [String] Name or ISO 3166 code identifying the country.     This field supports many different country identifiers:   * Two character ISO 3166 codes   * Three character ISO 3166 codes   * Fully spelled out names of the country in ISO supported languages   * Common alternative spellings for many countries     For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
      # @return [Object]
      def tax_rates_by_address(options={})
        path = "/api/v2/taxrates/byaddress"
        get(path, options)
      end


      # FREE API - Sales tax rates for a specified country and postal code. This API is only available for US postal codes.
      #
      # # Free-To-Use
      #
      # This API is only available for a US postal codes.
      #
      # The TaxRates API is a free-to-use, no cost option for estimating sales tax rates.
      # Any customer can request a free AvaTax account and make use of the TaxRates API.
      #
      # Usage of this API is subject to rate limits. Users who exceed the rate limit will receive HTTP
      # response code 429 - `Too Many Requests`.
      #
      # This API assumes that you are selling general tangible personal property at a retail point-of-sale
      # location in the United States only.
      #
      # For more powerful tax calculation, please consider upgrading to the `CreateTransaction` API,
      # which supports features including, but not limited to:
      #
      # * Nexus declarations
      # * Taxability based on product/service type
      # * Sourcing rules affecting origin/destination states
      # * Customers who are exempt from certain taxes
      # * States that have dollar value thresholds for tax amounts
      # * Refunds for products purchased on a different date
      # * Detailed jurisdiction names and state assigned codes
      # * And more!
      #
      # Please see [Estimating Tax with REST v2](http://developer.avalara.com/blog/2016/11/04/estimating-tax-with-rest-v2/)
      # for information on how to upgrade to the full AvaTax CreateTransaction API.
      # @param country [String] Name or ISO 3166 code identifying the country.     This field supports many different country identifiers:   * Two character ISO 3166 codes   * Three character ISO 3166 codes   * Fully spelled out names of the country in ISO supported languages   * Common alternative spellings for many countries     For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
      # @param postalCode [String] The postal code of the location.
      # @return [Object]
      def tax_rates_by_postal_code(options={})
        path = "/api/v2/taxrates/bypostalcode"
        get(path, options)
      end

    end
  end
end