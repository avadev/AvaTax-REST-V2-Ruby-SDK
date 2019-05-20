module AvaTax
  class Client
    module Filings 


      # Retrieve a list of filings for the specified company in the year and month of a given filing period.
      #
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.
      # * This API is available by invitation only.<br />*Exempt security roles*: ComplianceRootUser, ComplianceAdmin, ComplianceUser, TechnicalSupportAdmin, TechnicalSupportUser.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period.
      # @param month [Integer] The two digit month of the filing period.
      # @return [Object]
      def get_filing_attachments(companyId, year, month)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/attachments"
        get(path)
      end


      # Retrieve a single trace file for a company filing period
      #
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.
      # * This API is available by invitation only.<br />*Exempt security roles*: ComplianceRootUser, ComplianceAdmin, ComplianceUser, TechnicalSupportAdmin, TechnicalSupportUser.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period.
      # @param month [Integer] The two digit month of the filing period.
      # @return [Object]
      def get_filing_attachments_trace_file(companyId, year, month)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/attachments/tracefile"
        get(path)
      end

    end
  end
end