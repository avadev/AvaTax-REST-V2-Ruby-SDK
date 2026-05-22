module AvaTax
  class Client
    module EcoNexusThreshold 


      # List economic nexus threshold statuses for a company
      #
      # Returns precomputed economic nexus threshold statuses for a company, sourced from a cache
      # refreshed weekly from Snowflake.
      #
      # When the optional `region` query parameter is provided, only the matching jurisdiction row is included in `states`.
      # If no row exists for that company and region, `states` is an empty array (still 200 OK).
      #
      # TPS currently binds this filter as query parameter `state`; use the same value. If the public contract standardizes on `region`,
      # TPS or api-gateway should accept or rewrite `region` so filtering still applies.
      #
      # Production traffic is served by TPS; api-gateway should route this path to TPS.
      #
      # This endpoint requires the `NexusFetch` permission. If EcoNexus is not configured in TPS or the cache has not loaded, TPS returns 503.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The Avalara company identifier.
      # @param region [String] Optional two-letter US state/region postal code (case-insensitive), same meaning as the `state` column in the data store. When provided, `states` contains at most one item; if there is no data for that company and region, `states` is an empty array (200 OK).
      # @param include [String] Standard Avalara `$include` query option (see other v2 list APIs).
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [Object]
      def get_eco_nexus_thresholds(companyId, options={})        path = "/api/v2/companies/#{companyId}/econexusthresholds"
        get(path, options, AvaTax::VERSION)      end
    end
  end
end