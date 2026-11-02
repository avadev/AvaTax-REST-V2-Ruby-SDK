module AvaTax
  class Client
    module ExchangeRateProviderConfig 


      # Create an ExchangeRateProviderConfig object
      #
      # Create an ExchangeRateProviderConfig object for this company.
      #
      # Name the feed with `providerCode` and `frequency`; both must match a pair
      # from `ListExchangeRateProviderDefinitions`. The server derives `currencyCode`.
      #
      # Customer configuration is currently supported for Switzerland (`countryCode: CH`)
      # using provider `SNB` to select between `Daily` and `Monthly` publishing
      # frequencies. `effDate` must be today or a future date (UTC). If `endDate` is
      # omitted, it defaults to `9999-12-31`.
      # System defaults are read-only. Overlapping date ranges for the same currency and country
      # return 400.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AvaTaxOnlyAccountAdmin, AvaTaxOnlyCompanyAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, ReturnsOnlyAccountAdmin, ReturnsOnlyCompanyAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that owns this ExchangeRateProviderConfig
      # @param model [Object] The ExchangeRateProviderConfig object you wish to create.
      # @return [Object]
      def create_exchange_rate_provider_config(companyId, model)        path = "/api/v2/companies/#{companyId}/exchangerateproviderconfigurations"
        post(path, model, {}, AvaTax::VERSION)      end

      # Delete a single ExchangeRateProviderConfig object
      #
      # Deletes the ExchangeRateProviderConfig object identified by this URL.
      #
      # This operation permanently removes a future configuration record. Deletion is
      # permitted only when the configuration has not yet taken effect (`effDate` is
      # strictly after today). Active, currently effective, or historical configurations
      # cannot be deleted because they may have been referenced during transaction
      # calculation. To end an active configuration, use `PUT` to update the
      # `endDate` instead.
      #
      # Currently, this operation applies only to customer configurations for Switzerland
      # (`CH`) using provider `SNB`. System defaults are read-only.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AvaTaxOnlyAccountAdmin, AvaTaxOnlyCompanyAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that owns this ExchangeRateProviderConfig
      # @param id [Integer] The unique ID number of the ExchangeRateProviderConfig object you wish to delete.
      # @return [ErrorDetail[]]
      def delete_exchange_rate_provider_config(companyId, id)        path = "/api/v2/companies/#{companyId}/exchangerateproviderconfigurations/#{id}"
        delete(path, {}, AvaTax::VERSION)      end

      # Retrieve a single ExchangeRateProviderConfig
      #
      # Retrieves a single ExchangeRateProviderConfig object defined by this URL.
      #
      # This endpoint returns only a configuration owned by the company in the URL. Inherited
      # system defaults are available through the company List endpoint.
      #
      # An exchange rate provider configuration selects which Exchange Rate Service provider
      # feed and refresh frequency a company uses when converting a given currency, optionally
      # narrowed to a country.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, ECMAccountUser, ECMCompanyUser, FirmAdmin, FirmUser, ProStoresOperator, Registrar, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this ExchangeRateProviderConfig object
      # @param id [Integer] The unique ID number referring to this ExchangeRateProviderConfig object
      # @return [Object]
      def get_exchange_rate_provider_config(companyId, id)        path = "/api/v2/companies/#{companyId}/exchangerateproviderconfigurations/#{id}"
        get(path, {}, AvaTax::VERSION)      end

      # Retrieve all ExchangeRateProviderConfig objects for this company
      #
      # Lists ExchangeRateProviderConfig objects that apply to this company.
      #
      # The company-scoped list answers "what applies to me": it returns this company's
      # configurations together with inherited system defaults. Expired rows
      # (`endDate` before today) are omitted. Future-dated customer rows are kept.
      # A customer configuration replaces an inherited system default with the same currency and
      # country. Inherited system defaults are read-only. The `isConfigurable` value
      # indicates whether a customer configuration may be created for that country and provider;
      # when it is false or null, an override is not permitted. Transaction-time provider
      # resolution is handled separately by the tax engine.
      # An exchange rate supplied with the transaction takes precedence over Exchange Rate
      # Service lookup and this configuration.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full
      # documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # Paginate your results using the `$top` and `$skip` parameters, and sort them
      # using `$orderBy`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, ECMAccountUser, ECMCompanyUser, FirmAdmin, FirmUser, ProStoresOperator, Registrar, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company whose ExchangeRateProviderConfig objects you wish to list.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* providerCode, frequency, isConfigurable
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @return [FetchResult]
      def list_exchange_rate_provider_configs(companyId, options={})        path = "/api/v2/companies/#{companyId}/exchangerateproviderconfigurations"
        get(path, options, AvaTax::VERSION)      end

      # Update an ExchangeRateProviderConfig object
      #
      # Updates the ExchangeRateProviderConfig object at this URL.
      #
      # Only `endDate` may be changed on an existing row. `countryCode`,
      # `effDate`, `providerCode` and `frequency` are immutable once created —
      # end-date the row and create a new one to change any of them — and a PUT must restate
      # them to match the stored row. `endDate` is required and must be today or a future
      # date (UTC).
      #
      # An `endDate` change that creates an overlapping effective date range for the same
      # currency and country returns 400.
      #
      # Currently, this operation applies only to customer configurations for Switzerland
      # (`CH`) using provider `SNB`. System defaults are read-only.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AvaTaxOnlyAccountAdmin, AvaTaxOnlyCompanyAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, ReturnsOnlyAccountAdmin, ReturnsOnlyCompanyAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that owns this ExchangeRateProviderConfig object.
      # @param id [Integer] The unique ID number of the ExchangeRateProviderConfig object to replace.
      # @param model [Object] The new ExchangeRateProviderConfig object to store.
      # @return [Object]
      def update_exchange_rate_provider_config(companyId, id, model)        path = "/api/v2/companies/#{companyId}/exchangerateproviderconfigurations/#{id}"
        put(path, model, {}, AvaTax::VERSION)      end
    end
  end
end