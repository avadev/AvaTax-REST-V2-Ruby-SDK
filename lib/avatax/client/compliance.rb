module AvaTax
  class Client
    module Compliance 


      # Retrieve all unique jurisnames based on filter.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param region [String] The two or three character region code for the region.
      # @param effectiveDate [DateTime] Used to limit the jurisnames returned.
      # @param endDate [DateTime] Used to limit the jurisnames returned.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_juris_names(country, region, options={})        path = "/api/v2/compliance/jurisnames/#{country}/#{region}"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve all RateOptions.
      #
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param region [String] The two or three character region code for the region.
      # @param effectiveDate [DateTime] Used to limit the jurisdictions or rates returned.
      # @param endDate [DateTime] Used to limit the jurisdictions or rates returned.
      # @param aggregationOption [String] Aggregation method used. (See StackAggregationOption::* for a list of allowable values)
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxRegionId, taxTypeCodeName, taxSubTypeCode, taxSubTypeCodeName, rateTypeCodeName, componentRate, taxAuthorityId, cityName, countyName, effDate, endDate
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_rate_options(country, region, options={})        path = "/api/v2/compliance/rateOptions/#{country}/#{region}"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve StateConfig information
      #
      # This API is available by invitation only.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* effDate, endDate, hasBoundary, hasRates, isLocalAdmin, isLocalNexus, isSerState, minBoundaryLevelId, sstStatusId, state, stateFips, boundaryTableBaseName, stjCount, tsStateId, isJaasEnabled, hasSSTBoundary
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_state_config(options={})        path = "/api/v2/compliance/stateconfig"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve all State Reporting Codes based on filter.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param region [String] The two or three character region code for the region.
      # @param effectiveDate [DateTime] Used to limit the StateReportingCodes or rates returned.
      # @param endDate [DateTime] Used to limit the StateReportingCodes or rates returned.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* label
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_state_reporting_codes(country, region, options={})        path = "/api/v2/compliance/stateReportingCodes/#{country}/#{region}"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve all tax type mappings based on filter.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxTypeGroupIdSK, taxTypeIdSK, taxSubTypeIdSK, generalOrStandardRateTypeIdSK, taxTypeGroupId, taxTypeId, country, generalOrStandardRateTypeId, isCustomContent
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_tax_type_mappings(options={})        path = "/api/v2/compliance/taxtypemappings"
        get(path, options, AvaTax::VERSION)      end
    end
  end
end