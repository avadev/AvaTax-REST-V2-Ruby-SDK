module AvaTax
  class Client
    module Ecms 


      # Get an ECMS identified by company id and ECMS id
      #
      # Get an ECMS identified by company id and ECMS id.
      # An ECMS data represents a documentation based on which companies can claim tax exemption
      # You may attach nested data objects such as exempt cert detail, and those objects will be created with certificate.
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Details
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaCert.
      # @param companyId [Integer] company to retrieve exempt certificate for
      # @param ecmsId [Integer] exempt certificate Id
      # @param include [String] 
      # @return [Object]
      def get_e_c_m_s_by_id(companyId, ecmsId, options={})        path = "/api/v2/companies/#{companyId}/ecms/#{ecmsId}"
        get(path, options)      end

      # Get list of ECMS data for this company
      #
      # Get list of ECMS data for this company
      # An ECMS data represents a documentation based on which companies can claim tax exemption
      # You may attach nested data objects such as ECMS detail, and those objects will be created with certificate.
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Details
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaCert.
      # @param companyId [Integer] which company to retrieve certificates from
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* details
      # @param include [String] 
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_e_c_m_s_by_company(companyId, options={})        path = "/api/v2/companies/#{companyId}/ecms"
        get(path, options)      end

      # Get all exempt certificates
      #
      # Get all ECMS currently available in database.
      # An ECMS data represents a documentation based on which companies can claim tax exemption
      # You may attach nested data objects such as ECMS detail, and those objects will be created with certificate.
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * Details
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaCert.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* details
      # @param include [String] 
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_e_c_m_s(options={})        path = "/api/v2/ecms"
        get(path, options)      end
    end
  end
end