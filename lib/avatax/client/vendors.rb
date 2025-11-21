module AvaTax
  class Client
    module Vendors 


      # Retrieve a single vendor
      #
      # Retrieve the vendor identified by this URL.
      #
      # A vendor object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this vendor object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * certificates - Fetch a list of certificates linked to this vendor.
      # * attributes - Retrieves all attributes applied to the vendor.
      # * active_certificates - Retrieves all the active certificates linked to this vendor
      # * histories - Retrieves the update history for this vendor
      # * logs - Retrieves vendor logs
      # * jobs - Retrieves vendor jobs
      # * billTos - Retrieves bill-tos linked with this vendor
      # * shipTos - Retrieves ship-tos linked with this vendor
      # * shipToStates - Retrieves ship-to states for this vendor
      # * custom_fields - Retrieves custom fields set for this vendor
      #
      # Before you can use any exemption certificates endpoints, you must set up your company for exemption certificate data storage.
      # Companies that do not have this storage system set up will see `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this is set up for a company, call `GetCertificateSetup`. To request setup of exemption
      # certificate storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that recorded this vendor
      # @param vendorCode [String] 
      # @param include [String] Specify optional additional objects to include in this fetch request
      # @return [Object]
      def get_vendor(companyId, vendorCode, options={})        path = "/api/v2/companies/#{companyId}/vendors/#{vendorCode}"
        get(path, options, AvaTax::VERSION)      end

      # List certificates linked to a vendor
      #
      # List all certificates linked to a vendor.
      #
      # A vendor object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `vendorCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `vendorCode` value and
      # identify any certificates linked to this `vendor` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Before you can use any exemption certificates endpoints, you must set up your company for exemption certificate data storage.
      # Companies that do not have this storage system set up will see `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this is set up for a company, call `GetCertificateSetup`. To request setup of exemption
      # certificate storage for this company, call `RequestCertificateSetup`.
      #
      # You can filter certificates by exposure zone name using the $filter parameter with the syntax:
      # `$filter=exposureZoneName eq 'ZoneName'` or `$filter=contains(exposureZoneName,'PartialName')`
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that recorded this vendor
      # @param vendorCode [String] The unique code representing this vendor
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:      * vendors - Retrieves the list of vendors linked to the certificate.   * po_numbers - Retrieves all PO numbers tied to the certificate.   * attributes - Retrieves all attributes applied to the certificate.   * histories - Retrieves the certificate update history   * jobs - Retrieves the jobs for this certificate   * logs - Retrieves the certificate log   * invalid_reasons - Retrieves invalid reasons for this certificate if the certificate is invalid   * custom_fields - Retrieves custom fields set for this certificate
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* documentTypeId, documentTypeDescription, exemptionNumber, ecmsId, ecmsStatus, pdf, pages
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_certificates_for_vendor(companyId, vendorCode, options={})        path = "/api/v2/companies/#{companyId}/vendors/#{vendorCode}/certificates"
        get(path, options, AvaTax::VERSION)      end

      # List all vendors for this company
      #
      # List all vendors recorded by this company matching the specified criteria.
      #
      # A vendor object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `vendorCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `vendorCode` value and
      # identify any certificates linked to this `vendor` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * certificates - Fetch a list of certificates linked to this vendor.
      # * attributes - Retrieves all attributes applied to the vendor.
      # * active_certificates - Retrieves all the active certificates linked to this vendor
      # * histories - Retrieves the update history for this vendor
      # * logs - Retrieves vendor logs
      # * jobs - Retrieves vendor jobs
      # * billTos - Retrieves bill-tos linked with this vendor
      # * shipTos - Retrieves ship-tos linked with this vendor
      # * shipToStates - Retrieves ship-to states for this vendor
      # * custom_fields - Retrieves custom fields set for this vendor
      #
      # Before you can use any exemption certificates endpoints, you must set up your company for exemption certificate data storage.
      # Companies that do not have this storage system set up will see `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this is set up for a company, call `GetCertificateSetup`. To request setup of exemption
      # certificate storage for this company, call `RequestCertificateSetup`.
      #
      # Note* Filtering not supported for isVendor field.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, BatchServiceAdmin, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services:*Required* (all): AvaTaxPro, ECMEssentials, ECMPro, ECMPremium, VEMPro, VEMPremium, ECMProComms, ECMPremiumComms.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that recorded this vendor
      # @param include [String] OPTIONAL - You can specify any of the values in `certificates`, `attributes`, `active_certificates`, `histories`, `logs`, `jobs`, `billTos`, `shipTos`, `shipToStates`, and `custom_fields` to fetch additional information for this certificate.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_vendors(companyId, options={})        path = "/api/v2/companies/#{companyId}/vendors"
        get(path, options, AvaTax::VERSION)      end
    end
  end
end