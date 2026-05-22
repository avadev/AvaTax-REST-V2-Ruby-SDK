module AvaTax
  class Client
    module FormTypeMapping 


      # Resolves a form type to an extraction task identifier.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, AvaTaxOnlyAccountAdmin, AvaTaxOnlyAccountUser, AvaTaxOnlyCompanyAdmin, AvaTaxOnlyCompanyUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param form_type [String] The form type to resolve (e.g., "W-9").
      # @return [Object]
      def resolve_form_type_task(options={})        path = "/api/v2/form-type-mappings/resolve-task"
        get(path, options, AvaTax::VERSION)      end
    end
  end
end