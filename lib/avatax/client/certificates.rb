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
      # * A list of exposure zones indicating where the certificate is valid
      # * A link to the customer that is allowed to use this certificate
      # * Your tax transaction must contain the correct customer code
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The ID number of the company recording this certificate
      # @param model [CertificateModel[]] Certificates to be created
      # @return [CertificateModel[]]
      def create_certificates(companyId, model)
        path = "/api/v2/companies/#{companyId}/certificates"
        post(path, model)
      end


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
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @return [Object]
      def delete_certificate(companyId, id)
        path = "/api/v2/companies/#{companyId}/certificates/#{id}"
        delete(path)
      end


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
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param page [Integer] If you choose `$type`=`Jpeg`, you must specify which page number to retrieve.
      # @param type [String] The data format in which to retrieve the certificate image (See CertificatePreviewType::* for a list of allowable values)
      # @return [Object]
      def download_certificate_image(companyId, id, options={})
        path = "/api/v2/companies/#{companyId}/certificates/#{id}/attachment"
        get(path, options)
      end


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
      # * Customers - Retrieves the list of customers linked to the certificate.
      # * PoNumbers - Retrieves all PO numbers tied to the certificate.
      # * Attributes - Retrieves all attributes applied to the certificate.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:      * Customers - Retrieves the list of customers linked to the certificate.   * PoNumbers - Retrieves all PO numbers tied to the certificate.   * Attributes - Retrieves all attributes applied to the certificate.
      # @return [Object]
      def get_certificate(companyId, id, options={})
        path = "/api/v2/companies/#{companyId}/certificates/#{id}"
        get(path, options)
      end


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
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param model [CertificateAttributeModel[]] The list of attributes to link to this certificate.
      # @return [FetchResult]
      def link_attributes_to_certificate(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/certificates/#{id}/attributes/link"
        post(path, model)
      end


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
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param model [Object] The list of customers needed be added to the Certificate for exemption
      # @return [FetchResult]
      def link_customers_to_certificate(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/certificates/#{id}/customers/link"
        post(path, model)
      end


      # List all attributes applied to this certificate
      #
      # Retrieve the list of attributes that are linked to this certificate.
      #
      # A certificate may have multiple attributes that control its behavior. You may link or unlink attributes to a
      # certificate at any time. The full list of defined attributes may be found using `/api/v2/definitions/certificateattributes`.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @return [FetchResult]
      def list_attributes_for_certificate(companyId, id)
        path = "/api/v2/companies/#{companyId}/certificates/#{id}/attributes"
        get(path)
      end


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
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param include [String] OPTIONAL: A comma separated list of special fetch options.    No options are currently available when fetching customers.
      # @return [FetchResult]
      def list_customers_for_certificate(companyId, id, options={})
        path = "/api/v2/companies/#{companyId}/certificates/#{id}/customers"
        get(path, options)
      end


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
      # * Customers - Retrieves the list of customers linked to the certificate.
      # * PoNumbers - Retrieves all PO numbers tied to the certificate.
      # * Attributes - Retrieves all attributes applied to the certificate.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The ID number of the company to search
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:      * Customers - Retrieves the list of customers linked to the certificate.   * PoNumbers - Retrieves all PO numbers tied to the certificate.   * Attributes - Retrieves all attributes applied to the certificate.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_certificates(companyId, options={})
        path = "/api/v2/companies/#{companyId}/certificates"
        get(path, options)
      end


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
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param model [CertificateAttributeModel[]] The list of attributes to unlink from this certificate.
      # @return [FetchResult]
      def unlink_attributes_from_certificate(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/certificates/#{id}/attributes/unlink"
        post(path, model)
      end


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
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param model [Object] The list of customers to unlink from this certificate
      # @return [FetchResult]
      def unlink_customers_from_certificate(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/certificates/#{id}/customers/unlink"
        post(path, model)
      end


      # Update a single certificate
      #
      # Replace the certificate identified by this URL with a new one.
      #
      # A certificate is a document stored in either AvaTax Exemptions or CertCapture. The certificate document
      # can contain information about a customer's eligibility for exemption from sales or use taxes based on
      # criteria you specify when you store the certificate. To view or manage your certificates directly, please
      # log onto the administrative website for the product you purchased.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param model [Object] The new certificate object that will replace the existing one
      # @return [Object]
      def update_certificate(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/certificates/#{id}"
        put(path, model)
      end


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
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this certificate
      # @param id [Integer] The unique ID number of this certificate
      # @param file [Object] The exemption certificate file you wanted to upload. Accepted formats are: PDF, JPEG, TIFF, PNG.
      # @return [String]
      def upload_certificate_image(companyId, id)
        path = "/api/v2/companies/#{companyId}/certificates/#{id}/attachment"
        post(path)
      end

    end
  end
end