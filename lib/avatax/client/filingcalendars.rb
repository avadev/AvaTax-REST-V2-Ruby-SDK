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
      # * This API requires openId bearer token for authentication
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID of the company that owns the filing calendar object
      # @param model [Object] Cycle Safe Options Request
      # @return [Object]
      def cycle_safe_options(companyId, model)        path = "/api/v2/companies/#{companyId}/filingcalendars/edit/cycleSafeOptions"
        post(path, model, {}, "22.3.0")      end

      # Delete a company return setting
      #
      # This API is available by invitation only and only available for users with Compliance access
      #
      # ### Security Policies
      #
      # * This API requires openId bearer token for authentication
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID of the company
      # @param filingCalendarId [Integer] The unique ID of the filing calendar that will remove setting
      # @param companyReturnSettingId [Integer] The unique ID of the company return setting that will be deleted from the filing calendar
      # @return [CompanyReturnSettingModel[]]
      def delete_company_return_settings(companyId, filingCalendarId, companyReturnSettingId)        path = "/api/v2/companies/#{companyId}/filingcalendars/#{filingCalendarId}/setting/#{companyReturnSettingId}"
        delete(path, {}, "22.3.0")      end

      # Retrieve all legacy filing calendars for this company
      #
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns these batches
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxTypes, taxAuthorityId, taxAuthorityName, taxAuthorityType, settings
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param returnCountry [String] A comma separated list of countries
      # @param returnRegion [String] A comma separated list of regions
      # @return [FetchResult]
      def legacy_filing_calendars(companyId, options={})        path = "/api/v2/companies/#{companyId}/filingcalendars/Legacy"
        get(path, options, "22.3.0")      end
    end
  end
end