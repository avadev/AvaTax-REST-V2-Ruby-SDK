module AvaTax
  class Client
    module EcoNexusThreshold 


      # Get economic nexus threshold statuses for a company
      #
      # Returns precomputed economic nexus threshold statuses for a company, sourced from an in-memory
      # cache refreshed periodically from Snowflake. All responses are served from cache;
      # Snowflake is never queried on the request path.
      #
      # When the optional `region` query parameter is provided, only the matching jurisdiction row
      # is included in `states`. If no row exists for that company and region, `states` is
      # an empty array (200 OK).
      #
      # When `lastRefreshedAt` is absent from the response, the cache has not yet completed its
      # first refresh; callers should treat absence as "cache freshness unknown".
      #
      # Production traffic is served by TPS; api-gateway should route this path to TPS.
      #
      # This endpoint requires the `NexusFetch` permission. If EcoNexus is not configured in TPS,
      # a 503 is returned with no `Retry-After` (misconfiguration requires redeployment).
      # If the cache is still initializing, a 503 is returned with `Retry-After: 300`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The Avalara company identifier.
      # @param region [String] Optional two-letter US state postal code to filter results (case-insensitive).   When provided, `states` contains at most one item; if there is no data for that company   and region, `states` is an empty array (200 OK). Must be exactly two characters; otherwise returns 400.   Matches the `region` field on each item in the response.
      # @return [Object]
      def get_eco_nexus_thresholds(companyId, options={})        path = "/api/v2/companies/#{companyId}/econexusthresholds"
        get(path, options, AvaTax::VERSION)      end
    end
  end
end