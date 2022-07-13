module AvaTax
  class Client
    module FirmClientLinkages 


      # Approves linkage to a firm for a client account
      #
      # This API enables the account admin of a client account to approve linkage request by a firm.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @return [Object]
      def approve_firm_client_linkage(id)        path = "/api/v2/firmclientlinkages/#{id}/approve"
        post(path, {}, "22.6.1")      end

      # Request a new FirmClient account and create an approved linkage to it
      #
      # This API is for use by Firms only.
      #
      # Avalara allows firms to manage returns for clients without the clients needing to use AvaTax service.
      # Firms can create accounts of FirmClient for customers they are managing using this API.
      #
      # Calling this API creates an account with the specified product subscriptions, but without a new user for account.
      # Account is then linked to the Firm so they can managed their returns.
      # You should call this API when a customer does not have an AvaTax account and is to be managed only by the firm.
      #
      # The created account will be created in `Active` status but there will be no user or license key associated with account.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: FirmAdmin, Registrar, SiteAdmin, SystemAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] Information about the account you wish to create.
      # @return [Object]
      def create_and_link_new_firm_client_account(model)        path = "/api/v2/firmclientlinkages/createandlinkclient"
        post(path, model, {}, "22.6.1")      end

      # Links a firm account with the client account
      #
      # This API enables the firm admins/firm users to request the linkage of a firm account and a client account.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] FirmClientLinkageInputModel
      # @return [Object]
      def create_firm_client_linkage(model)        path = "/api/v2/firmclientlinkages"
        post(path, model, {}, "22.6.1")      end

      # Delete a linkage
      #
      # This API marks a linkage between a firm and client as deleted.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @return [ErrorDetail[]]
      def delete_firm_client_linkage(id)        path = "/api/v2/firmclientlinkages/#{id}"
        delete(path, {}, "22.6.1")      end

      # Get linkage between a firm and client by id
      #
      # This API enables the firm admins/firm users to request the linkage of a firm account and a client account.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @return [Object]
      def get_firm_client_linkage(id)        path = "/api/v2/firmclientlinkages/#{id}"
        get(path, {}, "22.6.1")      end

      # List client linkages for a firm or client
      #
      # This API enables the firm or account users to request the associated linkages to the account.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* firmAccountName, clientAccountName
      # @return [FetchResult]
      def list_firm_client_linkage(options={})        path = "/api/v2/firmclientlinkages"
        get(path, options, "22.6.1")      end

      # Rejects linkage to a firm for a client account
      #
      # This API enables the account admin of a client account to reject linkage request by a firm.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @return [Object]
      def reject_firm_client_linkage(id)        path = "/api/v2/firmclientlinkages/#{id}/reject"
        post(path, {}, "22.6.1")      end

      # Reset linkage status between a client and firm back to requested
      #
      # This API enables the firm admin of a client account to reset a previously created linkage request by a firm.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @return [Object]
      def reset_firm_client_linkage(id)        path = "/api/v2/firmclientlinkages/#{id}/reset"
        post(path, {}, "22.6.1")      end

      # Revokes previously approved linkage to a firm for a client account
      #
      # This API enables the account admin of a client account to revoke a previously approved linkage request by a firm.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] 
      # @return [Object]
      def revoke_firm_client_linkage(id)        path = "/api/v2/firmclientlinkages/#{id}/revoke"
        post(path, {}, "22.6.1")      end
    end
  end
end