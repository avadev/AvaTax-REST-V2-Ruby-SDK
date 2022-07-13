module AvaTax
  class Client
    module FundingRequests 


      # Request the javascript for a funding setup widget
      #
      # This API is available by invitation only.
      # Companies that use the Avalara Managed Returns or the SST Certified Service Provider services are
      # required to setup their funding configuration before Avalara can begin filing tax returns on their
      # behalf.
      # Funding configuration for each company is set up by submitting a funding setup request, which can
      # be sent either via email or via an embedded HTML widget.
      # When the funding configuration is submitted to Avalara, it will be reviewed by treasury team members
      # before approval.
      # This API returns back the actual javascript code to insert into your application to render the
      # JavaScript funding setup widget inline.
      # Use the 'methodReturn.javaScript' return value to insert this widget into your HTML page.
      # This API requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The unique ID number of this funding request
      # @return [Object]
      def activate_funding_request(id)        path = "/api/v2/fundingrequests/#{id}/widget"
        get(path, {}, "22.6.1")      end

      # Retrieve status about a funding setup request
      #
      # This API is available by invitation only.
      # Companies that use the Avalara Managed Returns or the SST Certified Service Provider services are
      # required to setup their funding configuration before Avalara can begin filing tax returns on their
      # behalf.
      # Funding configuration for each company is set up by submitting a funding setup request, which can
      # be sent either via email or via an embedded HTML widget.
      # When the funding configuration is submitted to Avalara, it will be reviewed by treasury team members
      # before approval.
      # This API checks the status on an existing funding request.
      # This API requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, FirmAdmin, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Returns* (at least one of): Mrs, MRSComplianceManager, AvaTaxCsp.*Firm Managed* (for accounts managed by a firm): ARA, ARAManaged.
      # Swagger Name: AvaTaxClient	  
      # @param id [Integer] The unique ID number of this funding request
      # @return [Object]
      def funding_request_status(id)        path = "/api/v2/fundingrequests/#{id}"
        get(path, {}, "22.6.1")      end
    end
  end
end