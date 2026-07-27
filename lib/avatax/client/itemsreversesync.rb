module AvaTax
  class Client
    module ItemsReverseSync 


      # Create a webhook registration for a company.
      #
      # Creates a webhook registration for the specified company. The registration defines a
      # connector, callback URL, registration type, and subscribed events.
      #
      # The customer must pass the connector name in `connectorName`; this value is also
      # used as the OAuth scope for the registration.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AvaTaxOnlyAccountAdmin, AvaTaxOnlyCompanyAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company for which you want to create the registration.
      # @param model [ItemReverseSyncRegistrationInputModel[]] The webhook registration details to create.
      # @return [Object]
      def create_reverse_sync_registration(companyId, model)        path = "/api/v2/connector-sync/companies/#{companyId}/registrations"
        post(path, model, {}, AvaTax::VERSION)      end

      # Delete a webhook registration.
      #
      # Deletes the webhook registration identified by the specified registration ID for the given company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AvaTaxOnlyAccountAdmin, AvaTaxOnlyCompanyAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this registration.
      # @param registrationId [Integer] The ID of the registration to delete.
      # @return [ObjectDeletedErrorModel[]]
      def delete_reverse_sync_registration(companyId, registrationId)        path = "/api/v2/connector-sync/companies/#{companyId}/registrations/#{registrationId}"
        delete(path, {}, AvaTax::VERSION)      end

      # Retrieve a webhook registration.
      #
      # Returns the webhook registration identified by the specified registration ID for the given company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this registration.
      # @param registrationId [Integer] The ID of the registration.
      # @return [Object]
      def get_reverse_sync_registration(companyId, registrationId)        path = "/api/v2/connector-sync/companies/#{companyId}/registrations/#{registrationId}"
        get(path, {}, AvaTax::VERSION)      end

      # List webhook registrations for a company.
      #
      # Returns all webhook registrations for the specified company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPAdmin, CSPTester, ReturnsOnlyAccountAdmin, ReturnsOnlyAccountUser, ReturnsOnlyCompanyAdmin, ReturnsOnlyCompanyUser, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns the webhook registrations.
      # @return [FetchResult]
      def list_reverse_sync_registrations(companyId)        path = "/api/v2/connector-sync/companies/#{companyId}/registrations"
        get(path, {}, AvaTax::VERSION)      end

      # Update a webhook registration.
      #
      # Updates the webhook registration with the provided fields. Only the fields included in the
      # request body are updated.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AvaTaxOnlyAccountAdmin, AvaTaxOnlyCompanyAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID of the company that owns this registration.
      # @param registrationId [Integer] The ID of the registration to update.
      # @param model [Object] The registration fields to update.
      # @return [Object]
      def update_reverse_sync_registration(companyId, registrationId, model)        path = "/api/v2/connector-sync/companies/#{companyId}/registrations/#{registrationId}"
        patch(path, model, {}, AvaTax::VERSION)      end
    end
  end
end