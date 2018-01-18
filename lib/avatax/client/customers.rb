module AvaTax
  class Client
    module Customers 


      # Create customers for this company
      #
      # Create one or more customers for this company.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Please note that if this is your first call to the CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param model [CustomerModel[]] The list of customer objects to be created
      # @return [CustomerModel[]]
      def create_customers(companyId, model)
        path = "/api/v2/companies/#{companyId}/customers"
        post(path, model)
      end


      # Delete a customer record
      #
      # Deletes the customer object referenced by this URL.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @return [Object]
      def delete_customer(companyId, customerCode)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}"
        delete(path)
      end


      # Retrieve a single customer
      #
      # Retrieve the customer identified by this URL.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this customer object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * Certificates - Fetch a list of certificates linked to this customer.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param include [String] Specify optional additional objects to include in this fetch request
      # @return [Object]
      def get_customer(companyId, customerCode, options={})
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}"
        get(path, options)
      end


      # Link certificates to a customer
      #
      # Link one or more certificates to a customer.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param model [Object] The list of certificates to link to this customer
      # @return [FetchResult]
      def link_certificates_to_customer(companyId, customerCode, model)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/certificates/link"
        post(path, model)
      end


      # List certificates linked to a customer
      #
      # List all certificates linked to a customer.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:      * Customers - Retrieves the list of customers linked to the certificate.   * PoNumbers - Retrieves all PO numbers tied to the certificate.   * Attributes - Retrieves all attributes applied to the certificate.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_certificates_for_customer(companyId, customerCode, options={})
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/certificates"
        get(path, options)
      end


      # List active certificates for a location
      #
      # List valid certificates linked to a customer in a particular country and region.
      #
      # This API is intended to help identify whether a customer has already provided a certificate that
      # applies to a particular country and region. This API is intended to help you remind a customer
      # when they have or have not provided copies of their exemption certificates to you during the sales
      # order process.
      #
      # If a customer does not have a certificate on file and they wish to provide one, you should send the customer
      # a CertExpress invitation link so that the customer can upload proof of their exemption certificate. Please
      # see the `CreateCertExpressInvitation` API to create an invitation link for this customer.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param country [String] Search for certificates matching this country. Uses the ISO 3166 two character country code.
      # @param region [String] Search for certificates matching this region. Uses the ISO 3166 two or three character state, region, or province code.
      # @return [Object]
      def list_valid_certificates_for_customer(companyId, customerCode, country, region)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/certificates/#{country}/#{region}"
        get(path)
      end


      # List all customers for this company
      #
      # List all customers recorded by this company matching the specified criteria.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * Certificates - Fetch a list of certificates linked to this customer.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param include [String] OPTIONAL - You can specify the value `certificates` to fetch information about certificates linked to the customer.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_customers(companyId, options={})
        path = "/api/v2/companies/#{companyId}/customers"
        get(path, options)
      end


      # Unlink certificates from a customer
      #
      # Remove one or more certificates to a customer.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param model [Object] The list of certificates to link to this customer
      # @return [FetchResult]
      def unlink_certificates_from_customer(companyId, customerCode, model)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/certificates/unlink"
        post(path, model)
      end


      # Update a single customer
      #
      # Replace the customer object at this URL with a new record.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param model [Object] The new customer model that will replace the existing record at this URL
      # @return [Object]
      def update_customer(companyId, customerCode, model)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}"
        put(path, model)
      end

    end
  end
end