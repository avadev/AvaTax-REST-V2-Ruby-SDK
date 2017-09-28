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
      # @param includeJurisCodes [object] When true, the file will include jurisdiction codes in the result.
      # @return [Object]
      def build_tax_content_file_for_location(companyId, id, options={})
        path = "/api/v2/companies/#{companyId}/locations/#{id}/pointofsaledata"
        get(path, options)
      end

    end
  end
end