module AvaTax
  class Client
    module Certificates 


      # Create certificates for this company
      #
      # Record one or more certificates document for this company.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
      #
      # When you create a certificate, it will be processed by Avalara and will become available for use in
      # calculating tax exemptions when processing is complete. For a certificate to be used in calculating exemptions,
      # it must have the following:
      #
      # * An exposure zone indicating where the certificate is valid
      # * A link to the customer that is allowed to use this certificate
      # * Your tax transaction must contain the correct customer code
      #
      # Before you can use any exemption certificates endpoints, you must set up your company for exemption certificate data storage.
      # Companies that do not have this storage system set up will see `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this is set up for a company, call `GetCertificateSetup`. To request setup of exemption
      # certificate storage for this company, call `RequestCertificateSetup`.
      #
      # If the users specified in the certificates do not exist, the API will create the user and link them to the certificate
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, BatchServiceAdmin, CompanyAdmin, CSPTester, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The ID number of the company recording this certificate
      # @param preValidatedExemptionReason [Boolean] If set to true, the certificate will bypass the human verification process.
      # @param model [CertificateModel[]] Certificates to be created
      # @return [CertificateModel[]]
      def create_certificates(companyId, model, options={})        path = "/api/v2/companies/#{companyId}/certificates"
        post(path, model, options, "22.6.1")      end

      # Revoke and delete a certificate
      #
      # Revoke the certificate identified by this URL, then delete it.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
      #
      # Revoked certificates can no longer be used.
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
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @return [ErrorDetail[]]
      def delete_certificate(companyId, id)        path = "/api/v2/companies/#{companyId}/certificates/#{id}"
        delete(path, {}, "22.6.1")      end

      # Download an image for this certificate
      #
      # Download an image or PDF file for this certificate.
      #
      # This API can be used to download either a single-page preview of the certificate or a full PDF document.
      # To retrieve a preview image, set the `$type` parameter to `Jpeg` and the `$page` parameter to `1`.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
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
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param page [Integer] If you choose `$type`=`Jpeg`, you must specify which page number to retrieve.
      # @param type [String] The data format in which to retrieve the certificate image (See CertificatePreviewType::* for a list of allowable values)
      # @return [Object]
      def download_certificate_image(companyId, id, options={})        path = "/api/v2/companies/#{companyId}/certificates/#{id}/attachment"
        get(path, options, "22.6.1")      end

      # Retrieve a single certificate
      #
      # Get the current certificate identified by this URL.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * customers - Retrieves the list of customers linked to the certificate.
      # * po_numbers - Retrieves all PO numbers tied to the certificate.
      # * attributes - Retrieves all attributes applied to the certificate.
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
      # @param companyId [Integer] The ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:      * customers - Retrieves the list of customers linked to the certificate.   * po_numbers - Retrieves all PO numbers tied to the certificate.   * attributes - Retrieves all attributes applied to the certificate.
      # @return [Object]
      def get_certificate(companyId, id, options={})        path = "/api/v2/companies/#{companyId}/certificates/#{id}"
        get(path, options, "22.6.1")      end

      # Check a company's exemption certificate status.
      #
      # Checks whether this company is configured to use exemption certificates in AvaTax.
      #
      # Exemption certificates are tracked through a different auditable data store than the one that
      # holds AvaTax transactions. To use the AvaTax exemption certificate document store, please call
      # `GetCertificateSetup` to see if your company is configured to use the exemption certificate
      # document store. To request setup, please call `RequestCertificateSetup` and your company will
      # be configured with data storage in the auditable certificate system.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The company ID to check
      # @return [Object]
      def get_certificate_setup(companyId)        path = "/api/v2/companies/#{companyId}/certificates/setup"
        get(path, {}, "22.6.1")      end

      # Link attributes to a certificate
      #
      # Link one or many attributes to a certificate.
      #
      # A certificate may have multiple attributes that control its behavior. You may link or unlink attributes to a
      # certificate at any time. The full list of defined attributes may be found using `ListCertificateAttributes`.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
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
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param model [CertificateAttributeModel[]] The list of attributes to link to this certificate.
      # @return [FetchResult]
      def link_attributes_to_certificate(companyId, id, model)        path = "/api/v2/companies/#{companyId}/certificates/#{id}/attributes/link"
        post(path, model, {}, "22.6.1")      end

      # Link customers to a certificate
      #
      # Link one or more customers to an existing certificate.
      #
      # Customers and certificates must be linked before a customer can make use of a certificate to obtain
      # a tax exemption in AvaTax. Since some certificates may cover more than one business entity, a certificate
      # can be connected to multiple customer records using the `LinkCustomersToCertificate` API.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
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
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param model [Object] The list of customers needed be added to the Certificate for exemption
      # @return [FetchResult]
      def link_customers_to_certificate(companyId, id, model)        path = "/api/v2/companies/#{companyId}/certificates/#{id}/customers/link"
        post(path, model, {}, "22.6.1")      end

      # List all attributes applied to this certificate
      #
      # Retrieve the list of attributes that are linked to this certificate.
      #
      # A certificate may have multiple attributes that control its behavior. You may link or unlink attributes to a
      # certificate at any time. The full list of defined attributes may be found using [ListCertificateAttributes](https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListCertificateAttributes/) API.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
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
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @return [FetchResult]
      def list_attributes_for_certificate(companyId, id)        path = "/api/v2/companies/#{companyId}/certificates/#{id}/attributes"
        get(path, {}, "22.6.1")      end

      # List customers linked to this certificate
      #
      # List all customers linked to this certificate.
      #
      # Customers must be linked to a certificate in order to make use of its tax exemption features. You
      # can link or unlink customers to a certificate at any time.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
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
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param include [String] OPTIONAL: A comma separated list of special fetch options.   No options are currently available when fetching customers.
      # @return [FetchResult]
      def list_customers_for_certificate(companyId, id, options={})        path = "/api/v2/companies/#{companyId}/certificates/#{id}/customers"
        get(path, options, "22.6.1")      end

      # List all certificates for a company
      #
      # List all certificates recorded by a company
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * customers - Retrieves the list of customers linked to the certificate.
      # * po_numbers - Retrieves all PO numbers tied to the certificate.
      # * attributes - Retrieves all attributes applied to the certificate.
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
      # @param companyId [Integer] The ID number of the company to search
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:      * customers - Retrieves the list of customers linked to the certificate.   * po_numbers - Retrieves all PO numbers tied to the certificate.   * attributes - Retrieves all attributes applied to the certificate.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* exemptionNumber, status, ecmsId, ecmsStatus, pdf, pages
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_certificates(companyId, options={})        path = "/api/v2/companies/#{companyId}/certificates"
        get(path, options, "22.6.1")      end

      # Request setup of exemption certificates for this company.
      #
      # Requests the setup of exemption certificates for this company.
      #
      # Exemption certificates are tracked through a different auditable data store than the one that
      # holds AvaTax transactions. To use the AvaTax exemption certificate document store, please call
      # `GetCertificateSetup` to see if your company is configured to use the exemption certificate
      # document store. To request setup, please call `RequestCertificateSetup` and your company will
      # be configured with data storage in the auditable certificate system.
      #
      # This API will return the current status of exemption certificate setup for this company.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] 
      # @return [Object]
      def request_certificate_setup(companyId)        path = "/api/v2/companies/#{companyId}/certificates/setup"
        post(path, {}, "22.6.1")      end

      # Unlink attributes from a certificate
      #
      # Unlink one or many attributes from a certificate.
      #
      # A certificate may have multiple attributes that control its behavior. You may link or unlink attributes to a
      # certificate at any time. The full list of defined attributes may be found using `ListCertificateAttributes`.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
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
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param model [CertificateAttributeModel[]] The list of attributes to unlink from this certificate.
      # @return [FetchResult]
      def unlink_attributes_from_certificate(companyId, id, model)        path = "/api/v2/companies/#{companyId}/certificates/#{id}/attributes/unlink"
        post(path, model, {}, "22.6.1")      end

      # Unlink customers from a certificate
      #
      # Unlinks one or more customers from a certificate.
      #
      # Unlinking a certificate from a customer will prevent the certificate from being used to generate
      # tax exemptions for the customer in the future. If any previous transactions for this customer had
      # used this linked certificate, those transactions will be unchanged and will still have a link to the
      # exemption certificate in question.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
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
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param model [Object] The list of customers to unlink from this certificate
      # @return [FetchResult]
      def unlink_customers_from_certificate(companyId, id, model)        path = "/api/v2/companies/#{companyId}/certificates/#{id}/customers/unlink"
        post(path, model, {}, "22.6.1")      end

      # Update a single certificate
      #
      # Replace the certificate identified by this URL with a new one.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
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
      # @param companyId [Integer] The ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param model [Object] The new certificate object that will replace the existing one
      # @return [Object]
      def update_certificate(companyId, id, model)        path = "/api/v2/companies/#{companyId}/certificates/#{id}"
        put(path, model, {}, "22.6.1")      end

      # Upload an image or PDF attachment for this certificate
      #
      # Upload an image or PDF attachment for this certificate.
      #
      # Image attachments can be of the format `PDF`, `JPEG`, `TIFF`, or `PNG`. To upload a multi-page image, please
      # use the `PDF` data type.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
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
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param file [Object] The exemption certificate file you wanted to upload. Accepted formats are: PDF, JPEG, TIFF, PNG.
      # @return [String]
      def upload_certificate_image(companyId, id)        path = "/api/v2/companies/#{companyId}/certificates/#{id}/attachment"
        post(path, {}, "22.6.1")      end
    end
  end
end