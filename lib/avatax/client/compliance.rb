module AvaTax
  class Client
    module Compliance 


      # Retrieve a single tax rate.
      #
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.<br />*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # @param id [Integer] The ID of the tax rate to retrieve.
      # @return [Object]
      def get_tax_rate(id)        path = "/api/v2/compliance/taxrates/#{id}"
        get(path)      end

      # Retrieve a single tax region.
      #
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.<br />*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # @param id [Integer] The ID of the tax region to retrieve.
      # @return [Object]
      def get_tax_region(id)        path = "/api/v2/compliance/taxregions/#{id}"
        get(path)      end

      # Retrieve jurisdictions and rates in a combined format.
      #
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.<br />*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # @param effectiveDate [DateTime] Used to limit the jurisdictions returned.
      # @param endDate [DateTime] Used to limit the jurisdictions returned.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param include [String] A comma separated list of objects to fetch underneath this jurisdiction.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [Object]
      def query_jurisdiction_rates(options={})        path = "/api/v2/compliance/jurisdictionrates"
        get(path, options)      end

      # Retrieve all unique jurisdictions.
      #
      # This API is available by invitation only.
      #
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      #
      # * TaxRates
      #
      # ### Security Policies
      #
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.<br />*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param region [String] The two or three character region code for the region.
      # @param effectiveDate [DateTime] Used to limit the jurisdictions or rates returned.
      # @param endDate [DateTime] Used to limit the jurisdictions or rates returned.
      # @param aggregationOption [String] Aggregation method used if rates are returned using the '$include' parameter. (See StackAggregationOption::* for a list of allowable values)
      # @param include [String] A comma separated list of objects to fetch underneath this tax rate.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @return [Object]
      def query_jurisdictions(country, region, options={})        path = "/api/v2/compliance/jurisdictions/#{country}/#{region}"
        get(path, options)      end

      # Retrieve all tax rates.
      #
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.<br />*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param include [String] A comma separated list of objects to fetch underneath this tax rate.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [Object]
      def query_tax_rates(options={})        path = "/api/v2/compliance/taxrates"
        get(path, options)      end

      # Retrieve all tax region jurisdictions.
      #
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.<br />*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param include [String] A comma separated list of objects to fetch underneath this tax region jurisdiction.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [Object]
      def query_tax_region_jurisdictions(options={})        path = "/api/v2/compliance/taxregionjurisdictions"
        get(path, options)      end

      # Retrieve all tax regions.
      #
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services<br />*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.<br />*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param include [String] A comma separated list of objects to fetch underneath this tax region.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [Object]
      def query_tax_regions(options={})        path = "/api/v2/compliance/taxregions"
        get(path, options)      end

      # API to modify the reference fields at the document and the line level.
      #
      # 
      # @param companyId [Integer] 
      # @param model [TransactionReferenceFieldModel[]] 
      # @return [FetchResult]
      def tag_transaction(companyId, model)        path = "/api/v2/companies/#{companyId}/transactions/tag"
        put(path, model)      end
    end
  end
end