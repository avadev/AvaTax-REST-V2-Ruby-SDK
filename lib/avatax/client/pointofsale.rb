module AvaTax
  class Client
    module PointOfSale 


      # Point of sale data file generation
      #
      # Builds a point-of-sale data file containing tax rates and rules for items and locations that can be used
      # to correctly calculate tax in the event a point-of-sale device is not able to reach AvaTax.
      # This data file can be customized for specific partner devices and usage conditions.
      # The result of this API is the file you requested in the format you requested using the 'responseType' field.
      # This API builds the file on demand, and is limited to files with no more than 7500 scenarios.
      # @param model [Object] Parameters about the desired file format and report format, specifying which company, locations and TaxCodes to include.
      # @return [Object]
      def build_point_of_sale_data_file(model)
        path = "/api/v2/pointofsaledata/build"
        post(path, model)
      end

    end
  end
end