module AvaTax
  class Client
    module ECommerceToken 


      # Create a new ecommerce token.
      #
      # Creates a new ecommerce token.
      #
      # This API is used to create a new ecommerce token. An ecommerce token is required in order to launch the ECM/CertCapture ecommerce plugin. Create a separate token for each of your ECM/CertCapture customers.
      #
      # Use the SDK to embed ECM’s document submission form into your ecommerce platform or online store. Once the token is created, place the returned token value for that customer record in the token field in your ecommerce SDK code. This allows customers to manage their exemption certificates before or after making the purchase. More information is available in the [ECM/CertCapture integration guide](https://developer.avalara.com/document-management/set-up-ecm-for-ecommerce/ecm-in-ecom-environments/).
      #
      # You can also use the [ecommerce Plugin Demo](https://developer.avalara.com/certcapture/cert-demo/) on developer.avalara.com to test generating a token. Using your AvaTax username and password, try generating the token and combining it with various parameters.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, ECMAccountUser, ECMCompanyUser, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company ID that will be issued this certificate.
      # @param model [Object] 
      # @return [Object]
      def create_e_commerce_token(companyId, model)        path = "/api/v2/companies/#{companyId}/ecommercetokens"
        post(path, model, {}, AvaTax::VERSION)      end

      # Refresh an eCommerce token.
      #
      # Refresh an eCommerce token.
      #
      # CertCapture eCommerce tokens expire after one hour. This API is used to refresh an eCommerce token that is about to expire. This API can only be used with active tokens. If your token has expired, you must generate a new one.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, ECMAccountUser, ECMCompanyUser, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company ID that the refreshed certificate belongs to.
      # @param model [Object] 
      # @return [FetchResult]
      def refresh_e_commerce_token(companyId, model)        path = "/api/v2/companies/#{companyId}/ecommercetokens"
        put(path, model, {}, AvaTax::VERSION)      end
    end
  end
end