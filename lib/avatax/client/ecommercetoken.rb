module AvaTax
  class Client
    module ECommerceToken 


      # Create a new eCommerce token.
      #
      # Creates a new eCommerce token.
      #
      # This API is used to create a new eCommerce token. An eCommerce token is required in order to launch the CertCapture eCommerce plugin. Create a token for each of your CertCapture customers.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company ID that will be issued this certificate.
      # @param model [Object] 
      # @return [Object]
      def create_e_commerce_token(companyId, model)        path = "/api/v2/companies/#{companyId}/ecommercetokens"
        post(path, model, {}, "22.6.1")      end

      # Refresh an eCommerce token.
      #
      # Refresh an eCommerce token.
      #
      # CertCapture eCommerce tokens expire after one hour. This API is used to refresh an eCommerce token that is about to expire. This API can only be used with active tokens. If your token has expired, you must generate a new one.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company ID that the refreshed certificate belongs to.
      # @param model [Object] 
      # @return [FetchResult]
      def refresh_e_commerce_token(companyId, model)        path = "/api/v2/companies/#{companyId}/ecommercetokens"
        put(path, model, {}, "22.6.1")      end
    end
  end
end