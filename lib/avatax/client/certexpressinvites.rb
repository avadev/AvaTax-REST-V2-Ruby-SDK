module AvaTax
  class Client
    module CertExpressInvites 


      # Create a CertExpress invitation
      #
      # Creates an invitation for a customer to self-report certificates using the CertExpress website.
      #
      # This invitation is delivered by your choice of method, or you can present a hyperlink to the user
      # directly in your connector. Your customer will be redirected to https://app.certexpress.com/ where
      # they can follow a step-by-step guide to enter information about their exemption certificates. The
      # certificates entered will be recorded and automatically linked to their customer record.
      #
      # The [CertExpress website](https://app.certexpress.com/home) is available for customers to use at any time.
      # Using CertExpress with this API will ensure that your certificates are automatically linked correctly into
      # your company so that they can be used for tax exemptions.
      #
      # Before you can use any exemption certificates endpoints, you must set up your company for exemption certificate data storage.
      # Companies that do not have this storage system set up will see `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this is set up for a company, call `GetCertificateSetup`. To request setup of exemption
      # certificate storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that will record certificates
      # @param customerCode [String] The number of the customer where the request is sent to
      # @param model [CreateCertExpressInvitationModel[]] the requests to send out to customers
      # @return [CertExpressInvitationStatusModel[]]
      def create_cert_express_invitation(companyId, customerCode, model)        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/certexpressinvites"
        post(path, model, {}, "22.6.1")      end

      # Retrieve a single CertExpress invitation
      #
      # Retrieve an existing CertExpress invitation sent to a customer.
      #
      # A CertExpression invitation allows a customer to follow a helpful step-by-step guide to provide information
      # about their certificates. This step by step guide allows the customer to complete and upload the full
      # certificate in a convenient, friendly web browser experience. When the customer completes their certificates,
      # they will automatically be recorded to your company and linked to the customer record.
      #
      # The [CertExpress website](https://app.certexpress.com/home) is available for customers to use at any time.
      # Using CertExpress with this API will ensure that your certificates are automatically linked correctly into
      # your company so that they can be used for tax exemptions.
      #
      # Before you can use any exemption certificates endpoints, you must set up your company for exemption certificate data storage.
      # Companies that do not have this storage system set up will see `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this is set up for a company, call `GetCertificateSetup`. To request setup of exemption
      # certificate storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that issued this invitation
      # @param customerCode [String] The number of the customer where the request is sent to
      # @param id [Integer] The unique ID number of this CertExpress invitation
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. No options are defined at this time.
      # @return [Object]
      def get_cert_express_invitation(companyId, customerCode, id, options={})        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/certexpressinvites/#{id}"
        get(path, options, "22.6.1")      end

      # List CertExpress invitations
      #
      # Retrieve CertExpress invitations sent by this company.
      #
      # A CertExpression invitation allows a customer to follow a helpful step-by-step guide to provide information
      # about their certificates. This step by step guide allows the customer to complete and upload the full
      # certificate in a convenient, friendly web browser experience. When the customer completes their certificates,
      # they will automatically be recorded to your company and linked to the customer record.
      #
      # The [CertExpress website](https://app.certexpress.com/home) is available for customers to use at any time.
      # Using CertExpress with this API will ensure that your certificates are automatically linked correctly into
      # your company so that they can be used for tax exemptions.
      #
      # Before you can use any exemption certificates endpoints, you must set up your company for exemption certificate data storage.
      # Companies that do not have this storage system set up will see `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this is set up for a company, call `GetCertificateSetup`. To request setup of exemption
      # certificate storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that issued this invitation
      # @param include [String] OPTIONAL: A comma separated list of special fetch options.      No options are defined at this time.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* companyId, customer, coverLetter, exposureZones, exemptReasons, requestLink
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_cert_express_invitations(companyId, options={})        path = "/api/v2/companies/#{companyId}/certexpressinvites"
        get(path, options, "22.6.1")      end
    end
  end
end