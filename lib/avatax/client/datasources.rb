module AvaTax
  class Client
    module DataSources 


      # Create and store new datasources for the respective companies.
      #
      # Create one or more datasource objects.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The id of the company you which to create the datasources
      # @param model [DataSourceModel[]] 
      # @return [DataSourceModel[]]
      def create_data_sources(companyId, model)        path = "/api/v2/companies/#{companyId}/datasources"
        post(path, model, {}, "22.6.1")      end

      # Delete a datasource by datasource id for a company.
      #
      # Marks the existing datasource for a company as deleted.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The id of the company the datasource belongs to.
      # @param id [Integer] The id of the datasource you wish to delete.
      # @return [ErrorDetail[]]
      def delete_data_source(companyId, id)        path = "/api/v2/companies/#{companyId}/datasources/#{id}"
        delete(path, {}, "22.6.1")      end

      # Get data source by data source id
      #
      # Retrieve the data source by its unique ID number.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] 
      # @param id [Integer] data source id
      # @return [Object]
      def get_data_source_by_id(companyId, id)        path = "/api/v2/companies/#{companyId}/datasources/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve all datasources for this company
      #
      # Gets multiple datasource objects for a given company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The id of the company you wish to retrieve the datasources.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* isEnabled, isSynced, isAuthorized, name, externalState
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_data_sources(companyId, options={})        path = "/api/v2/companies/#{companyId}/datasources"
        get(path, options, "22.6.1")      end

      # Retrieve all datasources
      #
      # Get multiple datasource objects across all companies.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* isEnabled, isSynced, isAuthorized, name, externalState
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_data_sources(options={})        path = "/api/v2/datasources"
        get(path, options, "22.6.1")      end

      # Update a datasource identified by id for a company
      #
      # Updates a datasource for a company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The id of the company the datasource belongs to.
      # @param id [Integer] The id of the datasource you wish to delete.
      # @param model [Object] 
      # @return [Object]
      def update_data_source(companyId, id, model)        path = "/api/v2/companies/#{companyId}/datasources/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end