module AvaTax
  class Client
    module UserDefinedFields 


      # Delete a User Defined Field by User Defined Field id for a company.
      #
      # Marks the existing user defined field for a company as deleted.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The id of the company the User Defined Field belongs to.
      # @param id [Integer] The id of the User Defined Field you wish to delete.
      # @return [ErrorDetail[]]
      def delete_user_defined_field(companyId, id)        path = "/api/v2/companies/#{companyId}/userdefinedfields/#{id}"
        delete(path, {}, "22.6.1")      end

      # 
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] 
      # @param udfType [String] Document or Line level UDF (See UserDefinedFieldType::* for a list of allowable values)
      # @param allowDefaults [Boolean] If true this will add defaulted UDFs to the list that are not named yet
      # @return [FetchResult]
      def list_user_defined_fields_by_company_id(companyId, options={})        path = "/api/v2/companies/#{companyId}/userdefinedfields"
        get(path, options, "22.6.1")      end

      # Update a User Defined Field identified by id for a company
      #
      # Updates a User Defined Field for a company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, BasicReturns.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The id of the company the user defined field belongs to.
      # @param id [Integer] 
      # @param model [Object] 
      # @return [Object]
      def update_user_defined_field(companyId, model, options={})        path = "/api/v2/companies/#{companyId}/userdefinedfields"
        post(path, model, options, "22.6.1")      end
    end
  end
end