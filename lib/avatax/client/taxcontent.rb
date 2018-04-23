module AvaTax
  class Client
    module TaxContent 


      # Build a multi-location tax content file
      #
      # Builds a tax content file containing information useful for a retail point-of-sale solution.
      #
      # This file contains tax rates and rules for items and locations that can be used
      # to correctly calculate tax in the event a point-of-sale device is not able to reach AvaTax.
      #
      # This data file can be customized for specific partner devices and usage conditions.
      #
      # The result of this API is the file you requested in the format you requested using the `responseType` field.
      #
      # This API builds the file on demand, and is limited to files with no more than 7500 scenarios. To build a tax content
      # file for a single location at a time, please use `BuildTaxContentFileForLocation`.
      #
      # NOTE: This API does not work for Tennessee tax holiday scenarios.
      # @param model [Object] Parameters about the desired file format and report format, specifying which company, locations and TaxCodes to include.
      # @return [Object]
      def build_tax_content_file(model)
        path = "/api/v2/pointofsaledata/build"
        post(path, model)
      end


      # Build a tax content file for a single location
      #
      # Builds a tax content file containing information useful for a retail point-of-sale solution.
      #
      # This file contains tax rates and rules for all items for a single location. Data from this API
      # can be used to correctly calculate tax in the event a point-of-sale device is not able to reach AvaTax.
      #
      # This data file can be customized for specific partner devices and usage conditions.
      #
      # The result of this API is the file you requested in the format you requested using the `responseType` field.
      #
      # This API builds the file on demand, and is limited to files with no more than 7500 scenarios. To build a tax content
      # file for a multiple locations in a single file, please use `BuildTaxContentFile`.
      #
      # NOTE: This API does not work for Tennessee tax holiday scenarios.
      # @param companyId [Integer] The ID number of the company that owns this location.
      # @param id [Integer] The ID number of the location to retrieve point-of-sale data.
      # @param date [DateTime] The date for which point-of-sale data would be calculated (today by default)
      # @param format [String] The format of the file (JSON by default) (See PointOfSaleFileType::* for a list of allowable values)
      # @param partnerId [String] If specified, requests a custom partner-formatted version of the file. (See PointOfSalePartnerId::* for a list of allowable values)
      # @param includeJurisCodes [Boolean] When true, the file will include jurisdiction codes in the result.
      # @return [Object]
      def build_tax_content_file_for_location(companyId, id, options={})
        path = "/api/v2/companies/#{companyId}/locations/#{id}/pointofsaledata"
        get(path, options)
      end


      # Download a file listing tax rates by postal code
      #
      # Download a CSV file containing all five digit postal codes in the United States and their sales
      # and use tax rates for tangible personal property.
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
      # For more detailed tax content, please use the `BuildTaxContentFile` API which allows usage of exact items and exact locations.
      # @param date [DateTime] The date for which point-of-sale data would be calculated (today by default). Example input: 2016-12-31
      # @param region [String] If the region is provided, this API is going to generate the tax rate per zipcode for only the region specified.
      # @return [Object]
      def download_tax_rates_by_zip_code(date, options={})
        path = "/api/v2/taxratesbyzipcode/download/#{date}"
        get(path, options)
      end

    end
  end
end