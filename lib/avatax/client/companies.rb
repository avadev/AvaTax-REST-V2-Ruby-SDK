module AvaTax
  class Client
    module Companies 


      # Checks whether the integration being used to set up this company and run transactions onto this company is compliant to all requirements.
      #
      # Examines the most recent 100 transactions or data from the last month when verifying transaction-related integrations.
      # For partners who write integrations against AvaTax for many clients, this API is a way to do a quick self testing to verify whether the
      # written integrations for a company are sufficient enough to be delivered to the respective customers to start using it.
      #
      # This API provides messages specific enough (through predefined checks) to guide the partner on what integrations are still missing from the company to get fully certified.
      # The API makes the following checks to conclude if the company is NOT fully certified:
      # 1. Any past month items contains generic tax code of P0000000.
      # 2. All the companies on the requesting account are test companies.
      # 3. No Voided/Cancelled documents in the past 30 days.
      # 4. There are less than 2 committed documents.
      # 5. Any documentCode is a generic GUID string.
      # 6. Any customerCode on document is a generic GUID string.
      # 7. No document has more than 1 documentLine.
      # 8. All of the documents have missing exemptionNo, customerUsageType, taxDateOverride or negative amount.
      # 9. Any document quantity is a negative number.
      # 10. Any document have repeated lines.
      # 11. No document has shipping charge.
      # 12. All documents have same ItemCodes, descriptions and taxCodes.
      # 13. Less than 2 addresses used across all documents.
      # 14. Whether locationCode was used in documents.
      # 15. Account with AvaGlobal subscription and no documents have VATBuyerId.
      # 16. Any document has currencyCode not being USD for accounts with AvaGlobal subscription.
      # 17. All documents have countryCode used for accounts with AvaGlobal subscription.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # @param id [Integer] The ID of the company to check if its integration is certified.
      # @return [String]
      def certify_integration(id)        path = "/api/v2/companies/#{id}/certify"
        get(path)      end

      # Change the filing status of this company
      #
      # Changes the current filing status of this company.
      #
      # For customers using Avalara's Managed Returns Service, each company within their account can request
      # for Avalara to file tax returns on their behalf. Avalara compliance team members will review all
      # requested filing calendars prior to beginning filing tax returns on behalf of this company.
      #
      # The following changes may be requested through this API:
      #
      # * If a company is in `NotYetFiling` status, the customer may request this be changed to `FilingRequested`.
      # * Avalara compliance team members may change a company from `FilingRequested` to `FirstFiling`.
      # * Avalara compliance team members may change a company from `FirstFiling` to `Active`.
      #
      # All other status changes must be requested through the Avalara customer support team.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # @param id [Integer] 
      # @param model [Object] 
      # @return [String]
      def change_filing_status(id, model)        path = "/api/v2/companies/#{id}/filingstatus"
        post(path, model)      end

      # Quick setup for a company with a single physical address
      #
      # Shortcut to quickly setup a single-physical-location company with critical information and activate it.
      # This API provides quick and simple company setup functionality and does the following things:
      #
      # * Create a company object with its own tax profile
      # * Add a key contact person for the company
      # * Set up one physical location for the main office
      # * Declare nexus in all taxing jurisdictions for that main office address
      # * Activate the company
      #
      # This API only provides a limited subset of functionality compared to the 'Create Company' API call.
      # If you need additional features or options not present in this 'Quick Setup' API call, please use the full 'Create Company' call instead.
      # Please allow 1 minute before making transactions using the company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # @param model [Object] Information about the company you wish to create.
      # @return [Object]
      def company_initialize(model)        path = "/api/v2/companies/initialize"
        post(path, model)      end

      # Create new companies
      #
      # Create one or more new company objects.
      # A 'company' represents a single corporation or individual that is registered to handle transactional taxes.
      # You may attach nested data objects such as contacts, locations, and nexus with this CREATE call, and those objects will be created with the company.
      #
      # NOTE: Please do not use these blacklisted characters in company name and code: ';', '\', '|'.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # @param model [CompanyModel[]] Either a single company object or an array of companies to create
      # @return [CompanyModel[]]
      def create_companies(model)        path = "/api/v2/companies"
        post(path, model)      end

      # Request managed returns funding setup for a company
      #
      # This API is available by invitation only.
      # Companies that use the Avalara Managed Returns or the SST Certified Service Provider services are
      # required to setup their funding configuration before Avalara can begin filing tax returns on their
      # behalf.
      # Funding configuration for each company is set up by submitting a funding setup request, which can
      # be sent either via email or via an embedded HTML widget.
      # When the funding configuration is submitted to Avalara, it will be reviewed by treasury team members
      # before approval.
      # This API records that an ambedded HTML funding setup widget was activated.
      # This API requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # @param id [Integer] The unique identifier of the company
      # @param model [Object] The funding initialization request
      # @return [Object]
      def create_funding_request(id, model)        path = "/api/v2/companies/#{id}/funding/setup"
        post(path, model)      end

      # Delete a single company
      #
      # Deleting a company will delete all child companies, and all users attached to this company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, CSPTester, FirmAdmin, SSTAdmin, TechnicalSupportAdmin.
      # @param id [Integer] The ID of the company you wish to delete.
      # @return [ErrorDetail[]]
      def delete_company(id)        path = "/api/v2/companies/#{id}"
        delete(path)      end

      # Check the funding configuration of a company
      #
      # This API is available by invitation only.
      # Requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      # Returns the funding configuration of the requested company.
      # .
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.<br />*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # @param companyId [Integer] The unique identifier of the company
      # @return [Object]
      def funding_configuration_by_company(companyId)        path = "/api/v2/companies/#{companyId}/funding/configuration"
        get(path)      end

      # Check the funding configuration of a company
      #
      # This API is available by invitation only.
      # Requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      # Returns the funding configuration of the requested company.
      # .
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.<br />*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # @param companyId [Integer] The unique identifier of the company
      # @param currency [String] The currency of the funding. USD and CAD are the only valid currencies
      # @return [FundingConfigurationModel[]]
      def funding_configurations_by_company_and_currency(companyId, options={})        path = "/api/v2/companies/#{companyId}/funding/configurations"
        get(path, options)      end

      # Retrieve a single company
      #
      # Get the company object identified by this URL.
      # A 'company' represents a single corporation or individual that is registered to handle transactional taxes.
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      #  * Contacts
      #  * Items
      #  * Locations
      #  * Nexus
      #  * Settings
      #  * TaxCodes
      #  * TaxRules
      #  * UPC
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # @param id [Integer] The ID of the company to retrieve.
      # @param include [String] OPTIONAL: A comma separated list of special fetch options.      * Child objects - Specify one or more of the following to retrieve objects related to each company: "Contacts", "FilingCalendars", "Items", "Locations", "Nexus", "TaxCodes", "NonReportingChildren" or "TaxRules".   * Deleted objects - Specify "FetchDeleted" to retrieve information about previously deleted objects.
      # @return [Object]
      def get_company(id, options={})        path = "/api/v2/companies/#{id}"
        get(path, options)      end

      # Get configuration settings for this company
      #
      # Retrieve a list of all configuration settings tied to this company.
      #
      # Configuration settings provide you with the ability to control features of your account and of your
      # tax software. The category name `AvaCertServiceConfig` is reserved for
      # Avalara internal software configuration values; to store your own company-level settings, please
      # create a new category name that begins with `X-`, for example, `X-MyCustomCategory`.
      #
      # Company settings are permanent settings that cannot be deleted. You can set the value of a
      # company setting to null if desired and if the particular setting supports it.
      #
      # Avalara-based company settings for `AvaCertServiceConfig` affect your company's exemption certificate
      # processing, and should be changed with care.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # @param id [Integer] 
      # @return [CompanyConfigurationModel[]]
      def get_company_configuration(id)        path = "/api/v2/companies/#{id}/configuration"
        get(path)      end

      # Get this company's filing status
      #
      # Retrieve the current filing status of this company.
      #
      # For customers using Avalara's Managed Returns Service, each company within their account can request
      # for Avalara to file tax returns on their behalf. Avalara compliance team members will review all
      # requested filing calendars prior to beginning filing tax returns on behalf of this company.
      #
      # A company's filing status can be one of the following values:
      #
      # * `NoReporting` - This company is not configured to report tax returns; instead, it reports through a parent company.
      # * `NotYetFiling` - This company has not yet begun filing tax returns through Avalara's Managed Returns Service.
      # * `FilingRequested` - The company has requested to begin filing tax returns, but Avalara's compliance team has not yet begun filing.
      # * `FirstFiling` - The company has recently filing tax returns and is in a new status.
      # * `Active` - The company is currently active and is filing tax returns via Avalara Managed Returns.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # @param id [Integer] 
      # @return [String]
      def get_filing_status(id)        path = "/api/v2/companies/#{id}/filingstatus"
        get(path)      end

      # Check managed returns funding status for a company
      #
      # This API is available by invitation only.
      # Requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      # Returns a list of funding setup requests and their current status.
      # Each object in the result is a request that was made to setup or adjust funding status for this company.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # @param id [Integer] The unique identifier of the company
      # @return [FundingStatusModel[]]
      def list_funding_requests_by_company(id)        path = "/api/v2/companies/#{id}/funding"
        get(path)      end

      # Retrieve a list of MRS Companies with account
      #
      # This API is available by invitation only.
      #
      # Get a list of companies with an active MRS service.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # @return [FetchResult]
      def list_mrs_companies()        path = "/api/v2/companies/mrs"
        get(path)      end

      # Retrieve all companies
      #
      # Get multiple company objects.
      #
      # A `company` represents a single corporation or individual that is registered to handle transactional taxes.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Contacts
      # * Items
      # * Locations
      # * Nexus
      # * Settings
      # * TaxCodes
      # * TaxRules
      # * UPC
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # @param include [String] A comma separated list of objects to fetch underneath this company. Any object with a URL path underneath this company can be fetched by specifying its name.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* IsFein, contacts, items, locations, nexus, settings, taxCodes, taxRules, upcs, nonReportingChildCompanies, exemptCerts
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_companies(options={})        path = "/api/v2/companies"
        get(path, options)      end

      # Change configuration settings for this company
      #
      # Update configuration settings tied to this company.
      #
      # Configuration settings provide you with the ability to control features of your account and of your
      # tax software. The category names `AvaCertServiceConfig` is reserved for
      # Avalara internal software configuration values; to store your own company-level settings, please
      # create a new category name that begins with `X-`, for example, `X-MyCustomCategory`.
      #
      # Company settings are permanent settings that cannot be deleted. You can set the value of a
      # company setting to null if desired and if the particular setting supports it.
      #
      # Avalara-based company settings for `AvaCertServiceConfig` affect your company's exemption certificate
      # processing, and should be changed with care.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # @param id [Integer] 
      # @param model [CompanyConfigurationModel[]] 
      # @return [CompanyConfigurationModel[]]
      def set_company_configuration(id, model)        path = "/api/v2/companies/#{id}/configuration"
        post(path, model)      end

      # Update a single company
      #
      # Replace the existing company object at this URL with an updated object.
      #
      # A `CompanyModel` represents a single corporation or individual that is registered to handle transactional taxes.
      # All data from the existing object will be replaced with data in the object you PUT.
      #
      # When calling `UpdateCompany`, you are permitted to update the company itself. Updates to the nested objects
      # such as contacts, locations, or settings are not permitted. To update the nested objects
      #
      # To set a field's value to `null`, you may either set its value to `null` or omit that field from the object you PUT.
      #
      # NOTE: Please do not use these blacklisted characters in company name and code: ';', '\', '|'.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # @param id [Integer] The ID of the company you wish to update.
      # @param model [Object] The company object you wish to update.
      # @return [Object]
      def update_company(id, model)        path = "/api/v2/companies/#{id}"
        put(path, model)      end
    end
  end
end