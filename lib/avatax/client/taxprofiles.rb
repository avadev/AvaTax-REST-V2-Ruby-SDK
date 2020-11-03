module AvaTax
  class Client
    module TaxProfiles 


      # Export the tax profile of this company to a backup file
      #
      # Exports the tax profile of a company to a file, containing all information that affects tax calculation for this company.
      #
      # A tax profile is a series of decisions and configuration choices that affect your company's tax calculation. These decisions
      # include your nexus declarations, your item catalog, your custom tax rules, and so on.
      #
      # This API can be used to export a complete zip file containing your company's current tax profile, and you can then restore this
      # profile to a different company or compare it over time to see if your profile has been changed.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company whose profile you wish to retrieve.
      # @return [Object]
      def export_tax_profile(companyId)        path = "/api/v2/companies/#{companyId}/taxprofile"
        get(path)      end

      # Import a tax profile.
      #
      # Imports a tax profile to a new company, along with the option to import account settings.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param accountId [Integer] The account id of the account to which the tax profile will be imported.
      # @param newCompanyCode [String] The companyCode to use for the imported company.
      # @param replaceAccountSettings [Boolean] Replace the current account settings with the ones in the tax profile.
      # @param bypassNexusValidation [Boolean] Enable invalid nexus to be imported.
      # @param taxProfile [Object] The taxProfile
      # @return [Object]
      def import_tax_profile()        path = "/api/v2/taxprofile"
        post(path)      end
    end
  end
end