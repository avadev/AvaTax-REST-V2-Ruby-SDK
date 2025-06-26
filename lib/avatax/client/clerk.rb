module AvaTax
  class Client
    module Clerk 


      # Retrieves a list of location records associated with the specified company.
      # This endpoint is secured and requires appropriate subscription and permission levels.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique identifier of the company whose locations are being requested.
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* id
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_location_by_company(companyId, options={})        path = "/api/v2/companies/#{companyId}/clerk/locations"
        get(path, options, AvaTax::VERSION)      end
    end
  end
end