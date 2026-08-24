module AvaTax
  class Client
    module EcoNexusThreshold 


      # Retrieve economic nexus threshold statuses for a company
      #
      # Retrieve the economic nexus threshold status for each US state in which activity has been
      # evaluated for this company.
      #
      # Each entry in `states` describes the measurement window used, the sales and transaction
      # thresholds that apply to that state, the company's totals for the window, and whether
      # the threshold has been met.
      #
      # Threshold statuses are evaluated on a recurring schedule rather than at request time.
      # Use `lastRefreshedAt` to determine how current the returned data is; when it is absent
      # from the response, the age of the data is not known.
      #
      # When the optional `region` query parameter is provided, only the matching state is included
      # in `states`. If no threshold status exists for that company and region, `states` is returned
      # as an empty array with a 200 response.
      #
      # Requires the `NexusFetch` permission for the target company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company to retrieve threshold statuses for.
      # @param region [String] Optional two-letter US state postal code used to filter the results (case-insensitive).   When provided, `states` contains at most one entry, matched against the `region` field of each entry.   Must be exactly two characters; otherwise this endpoint returns 400.
      # @return [Object]
      def get_eco_nexus_thresholds(companyId, options={})        path = "/api/v2/companies/#{companyId}/econexusthresholds"
        get(path, options, AvaTax::VERSION)      end
    end
  end
end