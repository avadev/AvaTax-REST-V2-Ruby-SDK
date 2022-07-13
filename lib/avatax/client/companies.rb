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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the company to check if its integration is certified.
      # @return [String]
      def certify_integration(id)        path = "/api/v2/companies/#{id}/certify"
        get(path, {}, "22.6.1")      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @param model [Object] 
      # @return [String]
      def change_filing_status(id, model)        path = "/api/v2/companies/#{id}/filingstatus"
        post(path, model, {}, "22.6.1")      end

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
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] Information about the company you wish to create.
      # @return [Object]
      def company_initialize(model)        path = "/api/v2/companies/initialize"
        post(path, model, {}, "22.6.1")      end

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
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param model [CompanyModel[]] Either a single company object or an array of companies to create
      # @return [CompanyModel[]]
      def create_companies(model)        path = "/api/v2/companies"
        post(path, model, {}, "22.6.1")      end

      # Add parameters to a company.
      #
      # Add parameters to a company.
      #
      # Some companies can be taxed and reported differently depending on the properties of the company, such as IsPrimaryAddress. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a company will be used by default in tax calculation but will not show on the transaction line referencing the company.
      #
      # A company location parameter specified on a transaction line will override a company parameter if they share the same parameter name.
      #
      # To see available parameters for this company, call `/api/v2/definitions/parameters?$filter=attributeType eq Company`
      #
      # Some parameters are only available for use if you have subscribed to specific AvaTax services. To see which parameters you are able to use, add the query parameter "$showSubscribed=true" to the parameter definition call above.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this company parameter.
      # @param model [CompanyParameterDetailModel[]] The company parameters you wish to create.
      # @return [CompanyParameterDetailModel[]]
      def create_company_parameters(companyId, model)        path = "/api/v2/companies/#{companyId}/parameters"
        post(path, model, {}, "22.6.1")      end

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
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The unique identifier of the company
      # @param model [Object] The funding initialization request
      # @return [Object]
      def create_funding_request(id, model)        path = "/api/v2/companies/#{id}/funding/setup"
        post(path, model, {}, "22.6.1")      end

      # Delete a single company
      #
      # Deleting a company will delete all child companies, and all users attached to this company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the company you wish to delete.
      # @return [ErrorDetail[]]
      def delete_company(id)        path = "/api/v2/companies/#{id}"
        delete(path, {}, "22.6.1")      end

      # Delete a single company parameter
      #
      # Delete a parameter of a company.
      # Some companies can be taxed and reported differently depending on the properties of the company, such as IsPrimaryAddress. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a company will be used by default in tax calculation but will not show on the transaction line referencing the company.
      #
      # A company location parameter specified on a transaction line will override a company parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param id [Integer] The parameter id
      # @return [ErrorDetail[]]
      def delete_company_parameter(companyId, id)        path = "/api/v2/companies/#{companyId}/parameters/#{id}"
        delete(path, {}, "22.6.1")      end

      # Check the funding configuration of a company
      #
      # This API is available by invitation only.
      # Requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      # Returns the funding configuration of the requested company.
      # .
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique identifier of the company
      # @return [Object]
      def funding_configuration_by_company(companyId)        path = "/api/v2/companies/#{companyId}/funding/configuration"
        get(path, {}, "22.6.1")      end

      # Check the funding configuration of a company
      #
      # This API is available by invitation only.
      # Requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      # Returns the funding configuration of the requested company.
      # .
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique identifier of the company
      # @param currency [String] The currency of the funding. USD and CAD are the only valid currencies
      # @return [FundingConfigurationModel[]]
      def funding_configurations_by_company_and_currency(companyId, options={})        path = "/api/v2/companies/#{companyId}/funding/configurations"
        get(path, options, "22.6.1")      end

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
      #  * Parameters
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the company to retrieve.
      # @param include [String] OPTIONAL: A comma separated list of special fetch options.      * Child objects - Specify one or more of the following to retrieve objects related to each company: "Contacts", "FilingCalendars", "Items", "Locations", "Nexus", "TaxCodes", "NonReportingChildren" or "TaxRules".   * Deleted objects - Specify "FetchDeleted" to retrieve information about previously deleted objects.
      # @return [Object]
      def get_company(id, options={})        path = "/api/v2/companies/#{id}"
        get(path, options, "22.6.1")      end

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
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @return [CompanyConfigurationModel[]]
      def get_company_configuration(id)        path = "/api/v2/companies/#{id}/configuration"
        get(path, {}, "22.6.1")      end

      # Retrieve a single company parameter
      #
      # Retrieves a single parameter of a company.
      #
      # Some companies can be taxed and reported differently depending on the properties of the company, such as IsPrimaryAddress. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a company will be used by default in tax calculation but will not show on the transaction line referencing the company.
      #
      # A company location parameter specified on a transaction line will override a company parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] 
      # @param id [Integer] 
      # @return [Object]
      def get_company_parameter_detail(companyId, id)        path = "/api/v2/companies/#{companyId}/parameters/#{id}"
        get(path, {}, "22.6.1")      end

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
      # * `Inactive` - The company is currently inactive.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @return [String]
      def get_filing_status(id)        path = "/api/v2/companies/#{id}/filingstatus"
        get(path, {}, "22.6.1")      end

      # Get ACH entry detail report for company and period
      #
      # This API is available by invitation only.
      # Requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      # Returns a list of ACH entry details for the given company and period.
      # Each object in the result is an ach entry trace record for a payment made on behalf of this company.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The unique identifier of the company
      # @param periodyear [Integer] The period year
      # @param periodmonth [Integer] The period month
      # @return [ACHEntryDetailModel[]]
      def list_a_c_h_entry_details_for_company(id, periodyear, periodmonth)        path = "/api/v2/companies/#{id}/paymentdetails/#{periodyear}/#{periodmonth}"
        get(path, {}, "22.6.1")      end

      # Retrieve parameters for a company
      #
      # Retrieve all parameters of a company.
      #
      # Some companies can be taxed and reported differently depending on the properties of the company, such as IsPrimaryAddress. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a company will be used by default in tax calculation but will not show on the transaction line referencing the company.
      #
      # A company location parameter specified on a transaction line will override a company parameter if they share the same parameter name.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* name, unit
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_company_parameter_details(companyId, options={})        path = "/api/v2/companies/#{companyId}/parameters"
        get(path, options, "22.6.1")      end

      # Check managed returns funding status for a company
      #
      # This API is available by invitation only.
      # Requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      # Returns a list of funding setup requests and their current status.
      # Each object in the result is a request that was made to setup or adjust funding status for this company.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The unique identifier of the company
      # @return [FundingStatusModel[]]
      def list_funding_requests_by_company(id)        path = "/api/v2/companies/#{id}/funding"
        get(path, {}, "22.6.1")      end

      # Retrieve a list of MRS Companies with account
      #
      # This API is available by invitation only.
      #
      # Get a list of companies with an active MRS service.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @return [FetchResult]
      def list_mrs_companies()        path = "/api/v2/companies/mrs"
        get(path, {}, "22.6.1")      end

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
      # * Parameters
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param include [String] A comma separated list of objects to fetch underneath this company. Any object with a URL path underneath this company can be fetched by specifying its name.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* IsFein, contacts, items, locations, nexus, settings, taxCodes, taxRules, upcs, nonReportingChildCompanies, exemptCerts, parameters, supplierandcustomers
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_companies(options={})        path = "/api/v2/companies"
        get(path, options, "22.6.1")      end

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
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @param model [CompanyConfigurationModel[]] 
      # @return [CompanyConfigurationModel[]]
      def set_company_configuration(id, model)        path = "/api/v2/companies/#{id}/configuration"
        post(path, model, {}, "22.6.1")      end

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
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the company you wish to update.
      # @param model [Object] The company object you wish to update.
      # @return [Object]
      def update_company(id, model)        path = "/api/v2/companies/#{id}"
        put(path, model, {}, "22.6.1")      end

      # Update a company parameter
      #
      # Update a parameter of a company.
      #
      # Some companies can be taxed and reported differently depending on the properties of the company, such as IsPrimaryAddress. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a company will be used by default in tax calculation but will not show on the transaction line referencing the company.
      #
      # A company location parameter specified on a transaction line will override a company parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param id [Integer] The company parameter id
      # @param model [Object] The company parameter object you wish to update.
      # @return [Object]
      def update_company_parameter_detail(companyId, id, model)        path = "/api/v2/companies/#{companyId}/parameters/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end