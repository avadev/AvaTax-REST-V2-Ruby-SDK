module AvaTax
  class Client
    module Filings 


      # Retrieve a filing containing the return and all its accrual returns.
      #
      # ### Security Policies
      #
      # * This API requires openId bearer token for authentication
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns these returns
      # @param filingReturnId [Integer] The ID of the filing return
      # @return [FetchResult]
      def get_accrual_filings(companyId, filingReturnId)        path = "/api/v2/companies/#{companyId}/filings/accrual/#{filingReturnId}"
        get(path, {}, "22.3.0")      end

      # Retrieve a list of filed returns for the specified company in the year and month of a given filing period.
      #
      # ### Security Policies
      #
      # * This API requires openId bearer token for authentication
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API is available by invitation only.*Exempt security roles*: ComplianceRootUser, ComplianceAdmin, ComplianceUser, TechnicalSupportAdmin, TechnicalSupportUser, CompanyUser, AccountUser, CompanyAdmin, AccountAdmin.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns these batches
      # @param endPeriodMonth [Integer] The month of the period you are trying to retrieve
      # @param endPeriodYear [Integer] The year of the period you are trying to retrieve
      # @param frequency [String] The frequency of the return you are trying to retrieve (See FilingFrequencyId::* for a list of allowable values)
      # @param status [String] The status of the return(s) you are trying to retrieve (See FilingStatusId::* for a list of allowable values)
      # @param country [String] The country of the return(s) you are trying to retrieve
      # @param region [String] The region of the return(s) you are trying to retrieve
      # @param filingCalendarId [Integer] The filing calendar id of the return you are trying to retrieve
      # @param taxformCode [String] The unique tax form code of the form.
      # @return [FetchResult]
      def get_filed_returns(companyId, options={})        path = "/api/v2/companies/#{companyId}/filings/returns/filed"
        get(path, options, "22.3.0")      end
    end
  end
end