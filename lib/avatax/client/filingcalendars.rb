module AvaTax
  class Client
    module FilingCalendars 


      # Checks to see if the company has a valid POA for a tax form code
      #
      # This API is available by invitation only.
      #
      # This API fetches valid POA's for a company by TaxFormCode or by country/region
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Operator, Compliance Root User, Compliance Temp User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, SystemOperator, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.<br />*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # * This API is available by invitation only.
      # @param companyId [Integer] The company id that we are checking about
      # @param taxFormCode [String] The tax form code that we are checking
      # @param country [String] The country we are fetching POAs for
      # @param region [String] The region we are fetching POAs for
      # @return [PowerOfAttorneyCheckModel[]]
      def active_power_of_attorney(companyId, options={})
        path = "/api/v2/companies/#{companyId}/filingcalendars/powerofattorney"
        get(path, options)
      end

    end
  end
end