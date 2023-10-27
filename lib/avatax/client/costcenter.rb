module AvaTax
  class Client
    module CostCenter 


      # Bulk upload cost centers
      #
      # Allows bulk upload of cost centers for the specified company. Use the companyId path parameter to identify the company for which the cost centers should be uploaded.
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this cost center object
      # @param model [Object] The cost center bulk upload model.
      # @return [Object]
      def bulk_upload_cost_centers(companyid, model)        path = "/api/v2/companies/#{companyid}/costcenters/$upload"
        post(path, model, {}, AvaTax::VERSION)      end

      # Create new cost center
      #
      # Creates one or more new item objects attached to this company.
      #
      # Costcenter is defined as function or department within a company which is not directly going to generate revenues and profits to the company but is still incurring expenses to the company for its operations.
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this cost center object
      # @param model [Object] The cost center you wish to create.
      # @return [Object]
      def create_cost_center(companyid, model)        path = "/api/v2/companies/#{companyid}/costcenters"
        post(path, model, {}, AvaTax::VERSION)      end

      # Delete cost center for the given id
      #
      # Deletes a cost center with the specified costcenterId that belongs to the company.
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this cost center object
      # @param costcenterid [Integer] The primary key of this cost center
      # @return [Object]
      def delete_cost_center(companyid, costcenterid)        path = "/api/v2/companies/#{companyid}/costcenters/#{costcenterid}"
        delete(path, {}, AvaTax::VERSION)      end

      # Retrieve a single cost center
      #
      # Retrieves details of a single cost center identified by costcenterId, which is owned by the company.
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this cost center object
      # @param costcenterid [Integer] The primary key of this cost center
      # @return [Object]
      def get_cost_center_by_id(companyid, costcenterid)        path = "/api/v2/companies/#{companyid}/costcenters/#{costcenterid}"
        get(path, {}, AvaTax::VERSION)      end

      # Retrieve cost centers for this company
      #
      # Retrieves a list of cost centers attached to this company. You can apply filters to retrieve specific records.
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that defined these cost centers
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* companyId, meta, defaultItem
      # @param include [String] A comma separated list of objects to fetch underneath this company. Any object with a URL path underneath this company can be fetched by specifying its name.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_cost_centers_by_company(companyid, options={})        path = "/api/v2/companies/#{companyid}/costcenters"
        get(path, options, AvaTax::VERSION)      end

      # Retrieve all cost centers
      #
      # Retrieves all cost centers available. You can apply filters to retrieve specific records.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* companyId, meta, defaultItem
      # @param include [String] A comma separated list of objects to fetch underneath this company. Any object with a URL path underneath this company can be fetched by specifying its name.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_cost_centers(options={})        path = "/api/v2/costcenters"
        get(path, options, AvaTax::VERSION)      end

      # Update a single cost center
      #
      # Updates a single cost center owned by the company. Use the costcenterId path parameter to identify the cost center to update.
      # Swagger Name: AvaTaxClient	  
      # @param companyid [Integer] The ID of the company that owns this cost center object
      # @param costcenterid [Integer] The primary key of this cost center
      # @param model [Object] The cost center object you wish to update.
      # @return [Object]
      def update_cost_center(companyid, costcenterid, model)        path = "/api/v2/companies/#{companyid}/costcenters/#{costcenterid}"
        put(path, model, {}, AvaTax::VERSION)      end
    end
  end
end