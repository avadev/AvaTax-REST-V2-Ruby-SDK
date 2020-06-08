module AvaTax
  class Client
    module FilingCalendars 


      # Delete a company return setting
      #
      # This API is available by invitation only and only available for users with Compliance access
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # @param companyId [Integer] The unique ID of the company
      # @param filingCalendarId [Integer] The unique ID of the filing calendar that will remove setting
      # @param companyReturnSettingId [Integer] The unique ID of the company return setting that will be deleted from the filing calendar
      # @return [CompanyReturnSettingModel[]]
      def delete_company_return_settings(companyId, filingCalendarId, companyReturnSettingId)
        path = "/api/v2/companies/#{companyId}/filingcalendars/#{filingCalendarId}/setting/#{companyReturnSettingId}"
        delete(path)
      end

    end
  end
end