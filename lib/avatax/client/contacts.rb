module AvaTax
  class Client
    module Contacts 


      # Create a new contact
      #
      # Create one or more new contact objects.
      # A 'contact' is a person associated with a company who is designated to handle certain responsibilities of
      # a tax collecting and filing entity.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this contact.
      # @param model [ContactModel[]] The contacts you wish to create.
      # @return [ContactModel[]]
      def create_contacts(companyId, model)        path = "/api/v2/companies/#{companyId}/contacts"
        post(path, model, {}, "22.6.1")      end

      # Delete a single contact
      #
      # Mark the existing contact object at this URL as deleted.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this contact.
      # @param id [Integer] The ID of the contact you wish to delete.
      # @return [ErrorDetail[]]
      def delete_contact(companyId, id)        path = "/api/v2/companies/#{companyId}/contacts/#{id}"
        delete(path, {}, "22.6.1")      end

      # Retrieve a single contact
      #
      # Get the contact object identified by this URL.
      # A 'contact' is a person associated with a company who is designated to handle certain responsibilities of
      # a tax collecting and filing entity.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, FirmAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company for this contact
      # @param id [Integer] The primary key of this contact
      # @return [Object]
      def get_contact(companyId, id)        path = "/api/v2/companies/#{companyId}/contacts/#{id}"
        get(path, {}, "22.6.1")      end

      # Retrieve contacts for this company
      #
      # List all contact objects assigned to this company.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, FirmAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns these contacts
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_contacts_by_company(companyId, options={})        path = "/api/v2/companies/#{companyId}/contacts"
        get(path, options, "22.6.1")      end

      # Retrieve all contacts
      #
      # Get multiple contact objects across all companies.
      # A 'contact' is a person associated with a company who is designated to handle certain responsibilities of
      # a tax collecting and filing entity.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, FirmAdmin, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_contacts(options={})        path = "/api/v2/contacts"
        get(path, options, "22.6.1")      end

      # Update a single contact
      #
      # Replace the existing contact object at this URL with an updated object.
      # A 'contact' is a person associated with a company who is designated to handle certain responsibilities of
      # a tax collecting and filing entity.
      # All data from the existing object will be replaced with data in the object you PUT.
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that this contact belongs to.
      # @param id [Integer] The ID of the contact you wish to update
      # @param model [Object] The contact you wish to update.
      # @return [Object]
      def update_contact(companyId, id, model)        path = "/api/v2/companies/#{companyId}/contacts/#{id}"
        put(path, model, {}, "22.6.1")      end
    end
  end
end