module AvaTax
  class Client
    module Nexus 


      # Create a new nexus
      #
      # Creates one or more new nexus declarations attached to this company.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # To create a nexus declaration for your company, you must first call the Definitions API `ListNexus` to obtain a
      # list of Avalara-defined nexus. Once you have determined which nexus you wish to declare, you should customize
      # only the user-selectable fields in this object.
      #
      # The user selectable fields for the nexus object are `companyId`, `effectiveDate`, `endDate`, `localNexusTypeId`,
      # `taxId`, `nexusTypeId`, `hasPermanentEstablishment`, and `isSellerImporterOfRecord`.
      #
      # When calling `CreateNexus` or `UpdateNexus`, all values in your nexus object except for the user-selectable fields
      # must match an Avalara-defined system nexus object. You can retrieve a list of Avalara-defined system nexus objects
      # by calling `ListNexus`. If any data does not match, AvaTax may not recognize your nexus declaration.
      #
      # Please note that nexus changes may not take effect immediately and you should plan to update your nexus settings in advance
      # of calculating tax for a location.
      # @param companyId [Integer] The ID of the company that owns this nexus.
      # @param model [NexusModel[]] The nexus you wish to create.
      # @return [NexusModel[]]
      def create_nexus(companyId, model)
        path = "/api/v2/companies/#{companyId}/nexus"
        post(path, model)
      end


      # Creates nexus for a list of addresses.
      #
      # This call is intended to simplify adding all applicable nexus to a company, for an address or addresses. Calling this
      # API declares nexus for this company, for the list of addresses provided,
      # for the date range provided. You may also use this API to extend effective date on an already-declared nexus.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # Note that not all fields within a nexus can be updated; Avalara publishes a list of all defined nexus at the
      # '/api/v2/definitions/nexus' endpoint.
      #
      # You may only define nexus matching the official list of declared nexus.
      #
      # Please note that nexus changes may not take effect immediately and you should plan to update your nexus settings in advance
      # of calculating tax for a location.
      # @param companyId [Integer] The ID of the company that will own this nexus.
      # @param model [DeclareNexusByAddressModel[]] The nexus you wish to create.
      # @return [NexusByAddressModel[]]
      def declare_nexus_by_address(companyId, model)
        path = "/api/v2/companies/#{companyId}/nexus/byaddress"
        post(path, model)
      end


      # Delete a single nexus
      #
      # Marks the existing nexus object at this URL as deleted.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # Please note that nexus changes may not take effect immediately and you should plan to update your nexus settings in advance
      # of calculating tax for a location.
      # @param companyId [Integer] The ID of the company that owns this nexus.
      # @param id [Integer] The ID of the nexus you wish to delete.
      # @return [ErrorDetail[]]
      def delete_nexus(companyId, id)
        path = "/api/v2/companies/#{companyId}/nexus/#{id}"
        delete(path)
      end


      # Retrieve a single nexus
      #
      # Get the nexus object identified by this URL.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      # @param companyId [Integer] The ID of the company that owns this nexus object
      # @param id [Integer] The primary key of this nexus
      # @return [Object]
      def get_nexus(companyId, id)
        path = "/api/v2/companies/#{companyId}/nexus/#{id}"
        get(path)
      end


      # List company nexus related to a tax form
      #
      # Retrieves a list of nexus related to a tax form.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # This API is intended to provide useful information when examining a tax form. If you are about to begin filing
      # a tax form, you may want to know whether you have declared nexus in all the jurisdictions related to that tax
      # form in order to better understand how the form will be filled out.
      # @param companyId [Integer] The ID of the company that owns this nexus object
      # @param formCode [String] The form code that we are looking up the nexus for
      # @return [Object]
      def get_nexus_by_form_code(companyId, formCode)
        path = "/api/v2/companies/#{companyId}/nexus/byform/#{formCode}"
        get(path)
      end


      # Retrieve nexus for this company
      #
      # List all nexus objects defined for this company.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # @param companyId [Integer] The ID of the company that owns these nexus objects
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_nexus_by_company(companyId, options={})
        path = "/api/v2/companies/#{companyId}/nexus"
        get(path, options)
      end


      # Retrieve all nexus
      #
      # Get multiple nexus objects across all companies.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param include [String] A comma separated list of additional data to retrieve.
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_nexus(options={})
        path = "/api/v2/nexus"
        get(path, options)
      end


      # Update a single nexus
      #
      # Replace the existing nexus declaration object at this URL with an updated object.
      #
      # The concept of Nexus indicates a place where your company is legally obligated to collect and remit transactional
      # taxes. The legal requirements for nexus may vary per country and per jurisdiction; please seek advice from your
      # accountant or lawyer prior to declaring nexus.
      #
      # To create a nexus declaration for your company, you must first call the Definitions API `ListNexus` to obtain a
      # list of Avalara-defined nexus. Once you have determined which nexus you wish to declare, you should customize
      # only the user-selectable fields in this object.
      #
      # The user selectable fields for the nexus object are `companyId`, `effectiveDate`, `endDate`, `localNexusTypeId`,
      # `taxId`, `nexusTypeId`, `hasPermanentEstablishment`, and `isSellerImporterOfRecord`.
      #
      # When calling `CreateNexus` or `UpdateNexus`, all values in your nexus object except for the user-selectable fields
      # must match an Avalara-defined system nexus object. You can retrieve a list of Avalara-defined system nexus objects
      # by calling `ListNexus`. If any data does not match, AvaTax may not recognize your nexus declaration.
      #
      # Please note that nexus changes may not take effect immediately and you should plan to update your nexus settings in advance
      # of calculating tax for a location.
      # @param companyId [Integer] The ID of the company that this nexus belongs to.
      # @param id [Integer] The ID of the nexus you wish to update
      # @param model [Object] The nexus object you wish to update.
      # @return [Object]
      def update_nexus(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/nexus/#{id}"
        put(path, model)
      end

    end
  end
end