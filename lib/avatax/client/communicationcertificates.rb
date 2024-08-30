module AvaTax
  class Client
    module CommunicationCertificates 


      # Retrieve a single communication certificate.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Required* (all): ECMPremiumComms, ECMProComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID number of the company to search
      # @param certificateId [Integer] The ID number of the certifificate to search
      # @return [Object]
      def get_communication_certificate(companyId, certificateId)        path = "/companies/#{companyId}/communication-certificates/#{certificateId}"
        get(path, {}, AvaTax::VERSION)      end

      # Retrieve all communication certificates.
      #
      # List all account objects that can be seen by the current user.
      #
      # This API lists all accounts you are allowed to see. In general, most users will only be able to see their own account.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # For more information about filtering in REST, please see the documentation at http://developer.avalara.com/avatax/filtering-in-rest/ .
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Required* (all): ECMPremiumComms, ECMProComms.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* EffectiveDate, ExpirationDate, TaxNumber, Exemptions
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param companyId [Integer] The ID number of the company to search
      # @return [Object]
      def list_communication_certificates(companyId, options={})        path = "/companies/#{companyId}/communication-certificates"
        get(path, options, AvaTax::VERSION)      end
    end
  end
end