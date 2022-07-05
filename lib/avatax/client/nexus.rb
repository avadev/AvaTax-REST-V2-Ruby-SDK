module AvaTax
  class Client
    module Nexus 


      # Create a new nexus
      #
      # Creates one or more new nexus declarations attached to this company.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # To create a nexus declaration for your company, you must first call the Definitions API `ListNexus` to obtain a
      # list of Avalara-defined nexus. Once you have determined which nexus you wish to declare, you should customize
      # only the user-selectable fields in this object.
      #
      # The user selectable fields for the nexus object are `companyId`, `effectiveDate`, `endDate`, `localNexusTypeId`,
      # `taxId`, `nexusTypeId`, `hasPermanentEstablishment`, and `isSellerImporterOfRecord`.
      #
      # When calling `CreateNexus` or `UpdateNexus`, all values in your nexus object except for the user-selectable fields
      # must match an Avalara-defined system nexus object. You can retrieve a list of Avalara-defined system nexus objects
      # by calling `ListNexus`. If any data does not match, AvaTax may not recognize your nexus declaration.
      #
      # Please note that nexus changes may not take effect immediately and you should plan to update your nexus settings in advance
      # of calculating tax for a location.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this nexus.
      # @param model [NexusModel[]] The nexus you wish to create.
      # @return [NexusModel[]]
      def create_nexus(companyId, model)        path = "/api/v2/companies/#{companyId}/nexus"
        post(path, model, {}, "22.6.1")      end

      # Add parameters to a nexus.
      #
      # Add parameters to the nexus.
      # Some tax calculation and reporting are different depending on the properties of the nexus, such as isRemoteSeller. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an nexus will be used by default in tax calculation but will not show on the transaction line referencing the nexus.
      #
      # A parameter specified on a transaction line will override an nexus parameter if they share the same parameter name.
      #
      # To see available parameters for this item, call `/api/v2/definitions/parameters?$filter=attributeType eq Nexus`
      #
      # Some parameters are only available for use if you have subscribed to specific AvaTax services. To see which parameters you are able to use, add the query parameter "$showSubscribed=true" to the parameter definition call above.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this nexus parameter.
      # @param nexusId [Integer] The nexus id.
      # @param model [NexusParameterDetailModel[]] The nexus parameters you wish to create.
      # @return [NexusParameterDetailModel[]]
      def create_nexus_parameters(companyId, nexusId, model)        path = "/api/v2/companies/#{companyId}/nexus/#{nexusId}/parameters"
        post(path, model, {}, "22.6.1")      end

      # Creates nexus for a list of addresses.
      #
      # This call is intended to simplify adding all applicable nexus to a company, for an address or addresses. Calling this
      # API declares nexus for this company, for the list of addresses provided,
      # for the date range provided. You may also use this API to extend effective date on an already-declared nexus.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # Note that not all fields within a nexus can be updated; Avalara publishes a list of all defined nexus at the
      # '/api/v2/definitions/nexus' endpoint.
      #
      # You may only define nexus matching the official list of declared nexus.
      #
      # Please note that nexus changes may not take effect immediately and you should plan to update your nexus settings in advance
      # of calculating tax for a location.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that will own this nexus.
      # @param model [DeclareNexusByAddressModel[]] The nexus you wish to create.
      # @return [NexusByAddressModel[]]
      def declare_nexus_by_address(companyId, model)        path = "/api/v2/companies/#{companyId}/nexus/byaddress"
        post(path, model, {}, "22.6.1")      end

      # Delete a single nexus
      #
      # Marks the existing nexus object at this URL as deleted.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # Please note that nexus changes may not take effect immediately and you should plan to update your nexus settings in advance
      # of calculating tax for a location.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this nexus.
      # @param id [Integer] The ID of the nexus you wish to delete.
      # @param cascadeDelete [Boolean] If true, deletes all the child nexus if they exist along with parent nexus
      # @return [ErrorDetail[]]
      def delete_nexus(companyId, id, options={})        path = "/api/v2/companies/#{companyId}/nexus/#{id}"
        delete(path, options, "22.6.1")      end

      # Delete a single nexus parameter
      #
      # Delete a single nexus parameter.
      # Some tax calculation and reporting are different depending on the properties of the nexus, such as isRemoteSeller. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an nexus will be used by default in tax calculation but will not show on the transaction line referencing the nexus.
      #
      # A parameter specified on a transaction line will override an nexus parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param nexusId [Integer] The nexus id
      # @param id [Integer] The parameter id
      # @return [ErrorDetail[]]
      def delete_nexus_parameter(companyId, nexusId, id)        path = "/api/v2/companies/#{companyId}/nexus/#{nexusId}/parameters/#{id}"
        delete(path, {}, "22.6.1")      end

      # Delete all parameters for an nexus
      #
      # Delete all the parameters for a given nexus.
      # Some tax calculation and reporting are different depending on the properties of the nexus, such as isRemoteSeller. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an nexus will be used by default in tax calculation but will not show on the transaction line referencing the nexus.
      #
      # A parameter specified on a transaction line will override an nexus parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this nexus.
      # @param nexusId [Integer] The ID of the nexus you wish to delete the parameters.
      # @return [ErrorDetail[]]
      def delete_nexus_parameters(companyId, nexusId)        path = "/api/v2/companies/#{companyId}/nexus/#{nexusId}/parameters"
        delete(path, {}, "22.6.1")      end

      # Retrieve a single nexus
      #
      # Get the nexus object identified by this URL.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      #  * Parameters
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this nexus object
      # @param id [Integer] The primary key of this nexus
      # @param include [String] 
      # @return [Object]
      def get_nexus(companyId, id, options={})        path = "/api/v2/companies/#{companyId}/nexus/#{id}"
        get(path, options, "22.6.1")      end

      # List company nexus related to a tax form
      #
      # Retrieves a list of nexus related to a tax form.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # This API is intended to provide useful information when examining a tax form. If you are about to begin filing
      # a tax form, you may want to know whether you have declared nexus in all the jurisdictions related to that tax
      # form in order to better understand how the form will be filled out.
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      #  * Parameters
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this nexus object
      # @param formCode [String] The form code that we are looking up the nexus for
      # @param include [String] 
      # @return [Object]
      def get_nexus_by_form_code(companyId, formCode, options={})        path = "/api/v2/companies/#{companyId}/nexus/byform/#{formCode}"
        get(path, options, "22.6.1")      end

      # Retrieve a single nexus parameter
      #
      # Retrieve a single nexus parameter.
      # Some tax calculation and reporting are different depending on the properties of the nexus, such as isRemoteSeller.In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an nexus will be used by default in tax calculation but will not show on the transaction line referencing the nexus.
      #
      # A parameter specified on a transaction line will override an nexus parameter if they share the same parameter name.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param nexusId [Integer] The nexus id
      # @param id [Integer] The parameter id
      # @return [Object]
      def get_nexus_parameter(companyId, nexusId, id)        path = "/api/v2/companies/#{companyId}/nexus/#{nexusId}/parameters/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve nexus for this company
      #
      # List all nexus objects defined for this company.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      #  * Parameters
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns these nexus objects
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_nexus_by_company(companyId, options={})        path = "/api/v2/companies/#{companyId}/nexus"
        get(path, options, "22.6.1")      end

      # Retrieve nexus for this company By TaxTypeGroup
      #
      # List all nexus objects defined for this company filtered by TaxTypeGroup.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      #  * Parameters
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns these nexus objects
      # @param taxTypeGroup [String] Name of TaxTypeGroup to filter by
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_nexus_by_company_and_tax_type_group(companyId, taxTypeGroup, options={})        path = "/api/v2/companies/#{companyId}/nexus/byTaxTypeGroup/#{taxTypeGroup}"
        get(path, options, "22.6.1")      end

      # Retrieve parameters for a nexus
      #
      # List parameters for a nexus.
      # Some tax calculation and reporting are different depending on the properties of the nexus, such as isRemoteSeller. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to an nexus will be used by default in tax calculation but will not show on the transaction line referencing the nexus.
      #
      # A parameter specified on a transaction line will override an nexus parameter if they share the same parameter name.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id
      # @param nexusId [Integer] The nexus id
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* name, unit
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_nexus_parameters(companyId, nexusId, options={})        path = "/api/v2/companies/#{companyId}/nexus/#{nexusId}/parameters"
        get(path, options, "22.6.1")      end

      # Retrieve all nexus
      #
      # Get multiple nexus objects across all companies.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      #  * Parameters
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_nexus(options={})        path = "/api/v2/nexus"
        get(path, options, "22.6.1")      end

      # Update a single nexus
      #
      # Replace the existing nexus declaration object at this URL with an updated object.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # To create a nexus declaration for your company, you must first call the Definitions API `ListNexus` to obtain a
      # list of Avalara-defined nexus. Once you have determined which nexus you wish to declare, you should customize
      # only the user-selectable fields in this object.
      #
      # The user selectable fields for the nexus object are `companyId`, `effectiveDate`, `endDate`, `localNexusTypeId`,
      # `taxId`, `nexusTypeId`, `hasPermanentEstablishment`, and `isSellerImporterOfRecord`.
      #
      # When calling `CreateNexus` or `UpdateNexus`, all values in your nexus object except for the user-selectable fields
      # must match an Avalara-defined system nexus object. You can retrieve a list of Avalara-defined system nexus objects
      # by calling `ListNexus`. If any data does not match, AvaTax may not recognize your nexus declaration.
      #
      # Please note that nexus changes may not take effect immediately and you should plan to update your nexus settings in advance
      # of calculating tax for a location.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that this nexus belongs to.
      # @param id [Integer] The ID of the nexus you wish to update
      # @param model [Object] The nexus object you wish to update.
      # @return [Object]
      def update_nexus(companyId, id, model)        path = "/api/v2/companies/#{companyId}/nexus/#{id}"
        put(path, model, {}, "22.6.1")      end

      # Update an nexus parameter
      #
      # Update an nexus parameter.
      #
      # Some tax calculation and reporting are different depending on the properties of the nexus, such as isRemoteSeller. In AvaTax, these tax-affecting properties are called "parameters".
      #
      # A parameter added to a nexus will be used in tax calculation based on the locationcode and parameter value the transaction state line might have lines added.
      #
      # A parameter specified on a transaction line will override an item parameter if they share the same parameter name.????? I dont know about this?
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company id.
      # @param nexusId [Integer] The nexus id
      # @param id [Integer] The nexus parameter id
      # @param model [Object] The nexus object you wish to update.
      # @return [Object]
      def update_nexus_parameter(companyId, nexusId, id, model)        path = "/api/v2/companies/#{companyId}/nexus/#{nexusId}/parameters/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end