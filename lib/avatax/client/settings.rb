module AvaTax
  class Client
    module Settings 


      # Create a new setting
      # 
      # Create one or more new setting objects attached to this company.
      # A 'setting' is a piece of user-defined data that can be attached to a company, and it provides you the ability to store information
      # not defined or managed by Avalara.
      # You may create, update, and delete your own settings objects as required, and there is no mandatory data format for the 'name' and 
      # 'value' data fields.
      # To ensure correct operation of other programs or connectors, please create a new GUID for your application and use that value for
      # the 'set' data field.
      # 
      # @param int companyId The ID of the company that owns this setting.
      # @param SettingModel[] model The setting you wish to create.
      # @return SettingModel[]
      def create_settings(companyId, model)
        path = "/api/v2/companies/#{companyId}/settings"
        
        post(path, model)
      end


      # Delete a single setting
      # 
      # Mark the setting object at this URL as deleted.
      # 
      # @param int companyId The ID of the company that owns this setting.
      # @param int id The ID of the setting you wish to delete.
      # @return ErrorDetail[]
      def delete_setting(companyId, id)
        path = "/api/v2/companies/#{companyId}/settings/#{id}"
        
        delete(path)
      end


      # Retrieve a single setting
      # 
      # Get a single setting object by its unique ID.
      # A 'setting' is a piece of user-defined data that can be attached to a company, and it provides you the ability to store information
      # not defined or managed by Avalara.
      # You may create, update, and delete your own settings objects as required, and there is no mandatory data format for the 'name' and 
      # 'value' data fields.
      # To ensure correct operation of other programs or connectors, please create a new GUID for your application and use that value for
      # the 'set' data field.
      # 
      # @param int companyId The ID of the company that owns this setting
      # @param int id The primary key of this setting
      # @return SettingModel
      def get_setting(companyId, id)
        path = "/api/v2/companies/#{companyId}/settings/#{id}"
        
        get(path)
      end


      # Retrieve all settings for this company
      # 
      # List all setting objects attached to this company.
      # A 'setting' is a piece of user-defined data that can be attached to a company, and it provides you the ability to store information
      # not defined or managed by Avalara.
      # You may create, update, and delete your own settings objects as required, and there is no mandatory data format for the 'name' and 
      # 'value' data fields.
      # To ensure correct operation of other programs or connectors, please create a new GUID for your application and use that value for
      # the 'set' data field.
      # 
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # 
      # @param int companyId The ID of the company that owns these settings
      # @param string filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string include A comma separated list of child objects to return underneath the primary object.
      # @param int top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def list_settings_by_company(companyId, options={})
        path = "/api/v2/companies/#{companyId}/settings"
        
        get(path, options)
      end


      # Retrieve all settings
      # 
      # Get multiple setting objects across all companies.
      # A 'setting' is a piece of user-defined data that can be attached to a company, and it provides you the ability to store information
      # not defined or managed by Avalara.
      # You may create, update, and delete your own settings objects as required, and there is no mandatory data format for the 'name' and 
      # 'value' data fields.
      # To ensure correct operation of other programs or connectors, please create a new GUID for your application and use that value for
      # the 'set' data field.
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
      def query_settings(options={})
        path = "/api/v2/settings"
        
        get(path, options)
      end


      # Update a single setting
      # 
      # Replace the existing setting object at this URL with an updated object.
      # A 'setting' is a piece of user-defined data that can be attached to a company, and it provides you the ability to store information
      # not defined or managed by Avalara.
      # You may create, update, and delete your own settings objects as required, and there is no mandatory data format for the 'name' and 
      # 'value' data fields.
      # To ensure correct operation of other programs or connectors, please create a new GUID for your application and use that value for
      # the 'set' data field.
      # All data from the existing object will be replaced with data in the object you PUT. 
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # 
      # @param int companyId The ID of the company that this setting belongs to.
      # @param int id The ID of the setting you wish to update
      # @param SettingModel model The setting you wish to update.
      # @return SettingModel
      def update_setting(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/settings/#{id}"
        
        put(path, model)
      end

    end
  end
end