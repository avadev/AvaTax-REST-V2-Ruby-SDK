module AvaTax
  class Client
    module Compliance 


      # Retrieve jurisdiction rate information for tax authority
      #
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param taxAuthorityId [Integer] Used to limit the jurisdictions returned.
      # @param effectiveDate [DateTime] Used to limit the jurisdictions returned.
      # @param endDate [DateTime] Used to limit the jurisdictions returned.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param include [String] A comma separated list of objects to fetch underneath this jurisdiction.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [Object]
      def query_tax_authority_jurisdiction_rates(options={})        path = "/api/v2/compliance/taxauthorityjurisdictionrates"
        get(path, options, "22.6.1")      end
    end
  end
end