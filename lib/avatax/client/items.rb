module AvaTax
  class Client
    module Items 


      # Create a new item
      # 
      # Creates one or more new item objects attached to this company.
      # 
      # @param int companyId The ID of the company that owns this item.
      # @param ItemModel[] model The item you wish to create.
      # @return ItemModel[]
      def create_items(companyId, model)
        path = "/api/v2/companies/#{companyId}/items"
        
        post(path, model)
      end


      # Delete a single item
      # 
      # Marks the item object at this URL as deleted.
      # 
      # @param int companyId The ID of the company that owns this item.
      # @param int id The ID of the item you wish to delete.
      # @return ErrorDetail[]
      def delete_item(companyId, id)
        path = "/api/v2/companies/#{companyId}/items/#{id}"
        
        delete(path)
      end


      # Retrieve a single item
      # 
      # Get the item object identified by this URL.
      # An 'Item' represents a product or service that your company offers for sale.
      # 
      # @param int companyId The ID of the company that owns this item object
      # @param int id The primary key of this item
      # @return ItemModel
      def get_item(companyId, id)
        path = "/api/v2/companies/#{companyId}/items/#{id}"
        
        get(path)
      end


      # Retrieve items for this company
      # 
      # List all items defined for the current company.
      # 
      # An 'Item' represents a product or service that your company offers for sale.
      # 
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # 
      # @param int companyId The ID of the company that defined these items
      # @param string filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string include A comma separated list of child objects to return underneath the primary object.
      # @param int top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def list_items_by_company(companyId, options={})
        path = "/api/v2/companies/#{companyId}/items"
        
        get(path, options)
      end


      # Retrieve all items
      # 
      # Get multiple item objects across all companies.
      # An 'Item' represents a product or service that your company offers for sale.
      # 
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # 
      # @param string filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string include A comma separated list of child objects to return underneath the primary object.
      # @param int top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def query_items(options={})
        path = "/api/v2/items"
        
        get(path, options)
      end


      # Update a single item
      # 
      # Replace the existing item object at this URL with an updated object.
      # All data from the existing object will be replaced with data in the object you PUT. 
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # 
      # @param int companyId The ID of the company that this item belongs to.
      # @param int id The ID of the item you wish to update
      # @param ItemModel model The item object you wish to update.
      # @return ItemModel
      def update_item(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/items/#{id}"
        
        put(path, model)
      end

    end
  end
end