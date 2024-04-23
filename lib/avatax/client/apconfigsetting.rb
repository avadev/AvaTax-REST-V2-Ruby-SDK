module AvaTax
  class Client
    module APConfigSetting 


      # Create new rule
      #
      # 
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this AP Config Setting object
      # @param model [Object] The AP Config Setting you wish to create.
      # @return [Object]
      def create_a_p_config_setting(companyid, model)        path = "/api/v2/companies/#{companyid}/apconfigsetting"
        post(path, model, {}, AvaTax::VERSION)      end

      # Retrieve rule for this company
      #
      # 
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that defined this rule
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* meta, amount, varianceForIgnore, varianceForAccrue, variancePercent, apConfigToleranceType, payAsBilledNoAccrual, payAsBilledAccrueUndercharge, shortPayItemsAccrueUndercharge, markForReviewUndercharge, rejectUndercharge, payAsBilledOvercharge, shortPayAvalaraCalculated, shortPayItemsAccrueOvercharge, markForReviewOvercharge, rejectOvercharge, isActive
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def get_a_p_config_setting_by_company(companyid, options={})        path = "/api/v2/companies/#{companyid}/apconfigsetting"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve all rules
      #
      # 
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* meta, amount, varianceForIgnore, varianceForAccrue, variancePercent, apConfigToleranceType, payAsBilledNoAccrual, payAsBilledAccrueUndercharge, shortPayItemsAccrueUndercharge, markForReviewUndercharge, rejectUndercharge, payAsBilledOvercharge, shortPayAvalaraCalculated, shortPayItemsAccrueOvercharge, markForReviewOvercharge, rejectOvercharge, isActive
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_a_p_config_setting(options={})        path = "/api/v2/apconfigsetting"
        get(path, options, AvaTax::VERSION)      end

      # Update a AP config setting
      #
      # 
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this AP config setting object
      # @param model [Object] The AP config setting object you wish to update.
      # @return [Object]
      def update_a_p_config_setting(companyid, model)        path = "/api/v2/companies/#{companyid}/apconfigsetting"
        put(path, model, {}, AvaTax::VERSION)      end
    end
  end
end