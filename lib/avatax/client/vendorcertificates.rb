module AvaTax
  class Client
    module VendorCertificates 


      # List all vendor certificates for a company
      #
      # List all certificates recorded by a company
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a vendor's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * customers - Retrieves the list of vendors linked to the certificate.
      # * po_numbers - Retrieves all PO numbers tied to the certificate.
      # * attributes - Retrieves all attributes applied to the certificate.
      # * histories - Retrieves the certificate update history
      # * jobs - Retrieves the jobs for this certificate
      # * logs - Retrieves the certificate log
      # * invalid_reasons - Retrieves invalid reasons for this certificate if the certificate is invalid
      # * custom_fields - Retrieves custom fields set for this certificate
      #
      # Before you can use any exemption certificates endpoints, you must set up your company for exemption certificate data storage.
      # Companies that do not have this storage system set up will see `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this is set up for a company, call `GetCertificateSetup`. To request setup of exemption
      # certificate storage for this company, call `RequestCertificateSetup`.
      #
      # Note* Filtering not supported for any documentType field.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID number of the company to search
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:      * customers - Retrieves the list of vendors linked to the certificate.   * po_numbers - Retrieves all PO numbers tied to the certificate.   * attributes - Retrieves all attributes applied to the certificate.   * histories - Retrieves the certificate update history   * jobs - Retrieves the jobs for this certificate   * logs - Retrieves the certificate log   * invalid_reasons - Retrieves invalid reasons for this certificate if the certificate is invalid   * custom_fields - Retrieves custom fields set for this certificate
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* documentTypeId, documentTypeDescription, exemptionNumber, ecmsId, ecmsStatus, pdf, pages
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_vendor_certificates(companyId, options={})        path = "/#{companyId}/vendor-certificates"
        get(path, options, AvaTax::VERSION)      end
    end
  end
end