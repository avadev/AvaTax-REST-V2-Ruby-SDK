module AvaTax
  class Client
    module Notices 


      # Creates a new tax notice responsibility type.
      #
      # This API is available by invitation only and only available for users with Compliance admin access.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] The responsibility type to create
      # @return [Object]
      def create_notice_responsibility_type(model)        path = "/api/v2/notices/responsibilities"
        post(path, model, {}, "22.6.1")      end

      # Creates a new tax notice root cause type.
      #
      # This API is available by invitation only and only available for users with Compliance admin access.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] The root cause type to create
      # @return [Object]
      def create_notice_root_cause_type(model)        path = "/api/v2/notices/rootcauses"
        post(path, model, {}, "22.6.1")      end

      # Delete a tax notice responsibility type.
      #
      # This API is available by invitation only and only available for users with Compliance admin access.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param responsibilityId [Integer] The unique ID of the responsibility type
      # @return [ErrorDetail[]]
      def delete_notice_responsibility_type(responsibilityId)        path = "/api/v2/notices/responsibilities/#{responsibilityId}"
        delete(path, {}, "22.6.1")      end

      # Delete a tax notice root cause type.
      #
      # This API is available by invitation only and only available for users with Compliance admin access.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPTester, FirmAdmin, FirmUser, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # Swagger Name: AvaTaxClient	  
      # @param rootCauseId [Integer] The unique ID of the root cause type
      # @return [ErrorDetail[]]
      def delete_notice_root_cause_type(rootCauseId)        path = "/api/v2/notices/rootcauses/#{rootCauseId}"
        delete(path, {}, "22.6.1")      end
    end
  end
end