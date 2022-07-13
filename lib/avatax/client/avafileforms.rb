module AvaTax
  class Client
    module AvaFileForms 


      # Create a new AvaFileForm
      #
      # Create one or more AvaFileForms
      # A 'AvaFileForm' represents a form supported by our returns team
      #
      # ### Security Policies
      #
      # * This API requires the user role Compliance Root User.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param model [AvaFileFormModel[]] The AvaFileForm you wish to create.
      # @return [AvaFileFormModel[]]
      def create_ava_file_forms(model)        path = "/api/v2/avafileforms"
        post(path, model, {}, "22.6.1")      end

      # Delete a single AvaFileForm
      #
      # Marks the existing AvaFileForm object at this URL as deleted.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: Compliance Root User, ComplianceUser, FirmAdmin.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the AvaFileForm you wish to delete.
      # @return [ErrorDetail[]]
      def delete_ava_file_form(id)        path = "/api/v2/avafileforms/#{id}"
        delete(path, {}, "22.6.1")      end

      # Retrieve a single AvaFileForm
      #
      # Get the AvaFileForm object identified by this URL.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, Compliance Temp User, ComplianceAdmin, ComplianceUser, FirmAdmin, FirmUser, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The primary key of this AvaFileForm
      # @return [Object]
      def get_ava_file_form(id)        path = "/api/v2/avafileforms/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve all AvaFileForms
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, Compliance Temp User, ComplianceAdmin, ComplianceUser, FirmAdmin, FirmUser, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* outletTypeId
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_ava_file_forms(options={})        path = "/api/v2/avafileforms"
        get(path, options, "22.6.1")      end

      # Update a AvaFileForm
      #
      # All data from the existing object will be replaced with data in the object you PUT.
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      #
      # ### Security Policies
      #
      # * This API requires the user role Compliance Root User.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The ID of the AvaFileForm you wish to update
      # @param model [Object] The AvaFileForm model you wish to update.
      # @return [Object]
      def update_ava_file_form(id, model)        path = "/api/v2/avafileforms/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end