module AvaTax
  class Client
    module TaxContent 


      # Build a multi-location tax content file
      #
      # Builds a tax content file containing information useful for a retail point-of-sale solution.
      #
      # Since tax rates may change based on decisions made by a variety of tax authorities, we recommend
      # that users of this tax content API download new data every day. Many tax authorities may finalize
      # decisions on tax changes at unexpected times and may make changes in response to legal issues or
      # governmental priorities. Any tax content downloaded for future time periods is subject to change
      # if tax rates or tax laws change.
      #
      # A TaxContent file contains a matrix of the taxes that would be charged when you sell any of your
      # Items at any of your Locations. To create items, use `CreateItems()`. To create locations, use
      # `CreateLocations()`. The file is built by looking up the tax profile for your location and your
      # item and calculating taxes for each in turn. To include a custom `TaxCode` in this tax content
      # file, first create the custom tax code using `CreateTaxCodes()` to create the custom tax code,
      # then use `CreateItems()` to create an item that uses the custom tax code.
      #
      # This data file can be customized for specific partner devices and usage conditions.
      #
      # The result of this API is the file you requested in the format you requested using the `responseType` field.
      #
      # This API builds the file on demand, and is limited to files with no more than 7500 scenarios. To build a tax content
      # file for a single location at a time, please use `BuildTaxContentFileForLocation`.
      #
      # NOTE: This API does not work for Tennessee tax holiday scenarios.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param model [Object] Parameters about the desired file format and report format, specifying which company, locations and TaxCodes to include.
      # @return [Object]
      def build_tax_content_file(model)        path = "/api/v2/pointofsaledata/build"
        post(path, model)      end

      # Build a tax content file for a single location
      #
      # Builds a tax content file containing information useful for a retail point-of-sale solution.
      #
      # Since tax rates may change based on decisions made by a variety of tax authorities, we recommend
      # that users of this tax content API download new data every day. Many tax authorities may finalize
      # decisions on tax changes at unexpected times and may make changes in response to legal issues or
      # governmental priorities. Any tax content downloaded for future time periods is subject to change
      # if tax rates or tax laws change.
      #
      # A TaxContent file contains a matrix of the taxes that would be charged when you sell any of your
      # Items at any of your Locations. To create items, use `CreateItems()`. To create locations, use
      # `CreateLocations()`. The file is built by looking up the tax profile for your location and your
      # item and calculating taxes for each in turn. To include a custom `TaxCode` in this tax content
      # file, first create the custom tax code using `CreateTaxCodes()` to create the custom tax code,
      # then use `CreateItems()` to create an item that uses the custom tax code.
      #
      # This data file can be customized for specific partner devices and usage conditions.
      #
      # The result of this API is the file you requested in the format you requested using the `responseType` field.
      #
      # This API builds the file on demand, and is limited to files with no more than 7500 scenarios. To build a tax content
      # file for a multiple locations in a single file, please use `BuildTaxContentFile`.
      #
      # NOTE: This API does not work for Tennessee tax holiday scenarios.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The ID number of the company that owns this location.
      # @param id [Integer] The ID number of the location to retrieve point-of-sale data.
      # @param date [DateTime] The date for which point-of-sale data would be calculated (today by default)
      # @param format [String] The format of the file (JSON by default) (See PointOfSaleFileType::* for a list of allowable values)
      # @param partnerId [String] If specified, requests a custom partner-formatted version of the file. (See PointOfSalePartnerId::* for a list of allowable values)
      # @param includeJurisCodes [Boolean] When true, the file will include jurisdiction codes in the result.
      # @return [Object]
      def build_tax_content_file_for_location(companyId, id, options={})        path = "/api/v2/companies/#{companyId}/locations/#{id}/pointofsaledata"
        get(path, options)      end

      # Download a file listing tax rates by postal code
      #
      # Download a CSV file containing all five digit postal codes in the United States and their sales
      # and use tax rates for tangible personal property.
      #
      # Since tax rates may change based on decisions made by a variety of tax authorities, we recommend
      # that users of this tax content API download new data every day. Many tax authorities may finalize
      # decisions on tax changes at unexpected times and may make changes in response to legal issues or
      # governmental priorities. Any tax content downloaded for future time periods is subject to change
      # if tax rates or tax laws change.
      #
      # This rates file is intended to be used as a default for tax calculation when your software cannot
      # call the `CreateTransaction` API call. When using this file, your software will be unable to
      # handle complex tax rules such as:
      #
      # * Zip+4 - This tax file contains five digit zip codes only.
      # * Different product types - This tax file contains tangible personal property tax rates only.
      # * Mixed sourcing - This tax file cannot be used to resolve origin-based taxes.
      # * Threshold-based taxes - This tax file does not contain information about thresholds.
      #
      # If you use this file to provide default tax rates, please ensure that your software calls `CreateTransaction`
      # to reconcile the actual transaction and determine the difference between the estimated general tax
      # rate and the final transaction tax.
      #
      # The file provided by this API is in CSV format with the following columns:
      #
      # * ZIP_CODE - The five digit zip code for this record.
      # * STATE_ABBREV - A valid two character US state abbreviation for this record. Zip codes may span multiple states.
      # * COUNTY_NAME - A valid county name for this record. Zip codes may span multiple counties.
      # * CITY_NAME - A valid city name for this record. Zip codes may span multiple cities.
      # * STATE_SALES_TAX - The state component of the sales tax rate.
      # * STATE_USE_TAX - The state component of the use tax rate.
      # * COUNTY_SALES_TAX - The county component of the sales tax rate.
      # * COUNTY_USE_TAX - The county component of the use tax rate.
      # * CITY_SALES_TAX - The city component of the sales tax rate.
      # * CITY_USE_TAX - The city component of the use tax rate.
      # * TOTAL_SALES_TAX - The total tax rate for sales tax for this postal code. This value may not equal the sum of the state/county/city due to special tax jurisdiction rules.
      # * TOTAL_USE_TAX - The total tax rate for use tax for this postal code. This value may not equal the sum of the state/county/city due to special tax jurisdiction rules.
      # * TAX_SHIPPING_ALONE - This column contains 'Y' if shipping is taxable.
      # * TAX_SHIPPING_AND_HANDLING_TOGETHER - This column contains 'Y' if shipping and handling are taxable when sent together.
      #
      # For more detailed tax content, please use the `BuildTaxContentFile` API which allows usage of exact items and exact locations.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # @param date [DateTime] The date for which point-of-sale data would be calculated (today by default). Example input: 2016-12-31
      # @param region [String] A two character region code which limits results to a specific region.
      # @return [Object]
      def download_tax_rates_by_zip_code(date, options={})        path = "/api/v2/taxratesbyzipcode/download/#{date}"
        get(path, options)      end
    end
  end
end