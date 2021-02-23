module AvaTax
  class Client
    module FilingCalendars 


      # Add or Edit options
      #
      # Returns a list of options for adding tax forms for the company and tax form code specified.
      # Returns edit options when modifying a filing calendar.
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # @param companyId [Integer] The unique ID of the company that owns the filing calendar object
      # @param model [Object] Cycle Safe Options Request
      # @return [Object]
      def cycle_safe_options(companyId, model)        path = "/api/v2/companies/#{companyId}/filingcalendars/edit/cycleSafeOptions"
        post(path, model)      end

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
      def delete_company_return_settings(companyId, filingCalendarId, companyReturnSettingId)        path = "/api/v2/companies/#{companyId}/filingcalendars/#{filingCalendarId}/setting/#{companyReturnSettingId}"
        delete(path)      end
    end
  end
end