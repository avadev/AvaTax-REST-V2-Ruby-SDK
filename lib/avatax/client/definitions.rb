module AvaTax
  class Client
    module Definitions 


      # Lists all parents of an HS Code.
      #
      # Retrieves the specified HS code and all of its parents, reflecting all sections, chapters, headings, and subheadings
      #
      # a list of HS Codes that are the parents and information branches of the HS Code for the given
      # destination country, if lower detail is available.
      #
      # This API will include information branches if applicable. These do not have HS Codes and cannot be referenced,
      # but can contain information relevant to deciding the correct HS Code.
      #
      # This API is intended to be useful to review the descriptive hierarchy of an HS Code, which can be particularly helpful
      # when HS Codes can have multiple levels of generic descriptions.
      # @param country [String] The name or code of the destination country.
      # @param hsCode [String] The partial or full HS Code for which you would like to view all of the parents.
      # @return [FetchResult]
      def get_cross_border_code(country, hsCode)
        path = "/api/v2/definitions/crossborder/#{country}/#{hsCode}/hierarchy"
        get(path)
      end


      # Test whether a form supports online login verification
      #
      # This API is intended to be useful to identify whether the user should be allowed
      # to automatically verify their login and password.
      # @param form [String] The name of the form you would like to verify. This can be the tax form code or the legacy return name
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def get_login_verifier_by_form(form, options={})
        path = "/api/v2/definitions/filingcalendars/loginverifiers/#{form}"
        get(path, options)
      end


      # Retrieve the full list of the AvaFile Forms available
      #
      # This API is deprecated.
      #
      # Please use the ListTaxForms API.
      #
      # Returns the full list of Avalara-supported AvaFile Forms
      # This API is intended to be useful to identify all the different AvaFile Forms
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_ava_file_forms(options={})
        path = "/api/v2/definitions/avafileforms"
        get(path, options)
      end


      # List certificate attributes used by a company
      #
      # List the certificate attributes defined by a company.
      #
      # A certificate may have multiple attributes that control its behavior. You may apply or remove attributes to a
      # certificate at any time.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_certificate_attributes(options={})
        path = "/api/v2/definitions/certificateattributes"
        get(path, options)
      end


      # List certificate attributes used by a company
      #
      # List the certificate exempt reasons defined by a company.
      #
      # An exemption reason defines why a certificate allows a customer to be exempt
      # for purposes of tax calculation.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_certificate_exempt_reasons(options={})
        path = "/api/v2/definitions/certificateexemptreasons"
        get(path, options)
      end


      # List certificate exposure zones used by a company
      #
      # List the certificate exposure zones defined by a company.
      #
      # An exposure zone is a location where a certificate can be valid. Exposure zones may indicate a taxing
      # authority or other legal entity to which a certificate may apply.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_certificate_exposure_zones(options={})
        path = "/api/v2/definitions/certificateexposurezones"
        get(path, options)
      end


      # Retrieve the full list of communications transactiontypes
      #
      # Returns full list of communications transaction types which
      # are accepted in communication tax calculation requests.
      # @param id [Integer] The transaction type ID to examine
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_communications_service_types(id, options={})
        path = "/api/v2/definitions/communications/transactiontypes/#{id}/servicetypes"
        get(path, options)
      end


      # Retrieve the full list of communications transactiontypes
      #
      # Returns full list of communications transaction types which
      # are accepted in communication tax calculation requests.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_communications_transaction_types(options={})
        path = "/api/v2/definitions/communications/transactiontypes"
        get(path, options)
      end


      # Retrieve the full list of communications transaction/service type pairs
      #
      # Returns full list of communications transaction/service type pairs which
      # are accepted in communication tax calculation requests.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_communications_t_s_pairs(options={})
        path = "/api/v2/definitions/communications/tspairs"
        get(path, options)
      end


      # List all ISO 3166 countries
      #
      # Returns a list of all ISO 3166 country codes, and their US English friendly names.
      # This API is intended to be useful when presenting a dropdown box in your website to allow customers to select a country for
      # a shipping address.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_countries(options={})
        path = "/api/v2/definitions/countries"
        get(path, options)
      end


      # List certificate exposure zones used by a company
      #
      # List available cover letters that can be used when sending invitation to use CertExpress to upload certificates.
      #
      # The CoverLetter model represents a message sent along with an invitation to use CertExpress to
      # upload certificates. An invitation allows customers to use CertExpress to upload their exemption
      # certificates directly; this cover letter explains why the invitation was sent.
      #
      # Please note that if this is your first call to CertCapture endpoints, you may experience upto 3 minute delay because your
      # account needs to be provisioned at CertCapture side. Sorry for the inconvenience and thanks for your patience.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_cover_letters(options={})
        path = "/api/v2/definitions/coverletters"
        get(path, options)
      end


      # Lists the next level of HS Codes given a destination country and HS Code prefix.
      #
      # Retrieves a list of HS Codes that are the children of the prefix for the given destination country, if
      # additional children are available.
      #
      # HS Code is interchangeable with "tariff code" and definitions are generally unique to a destination country.
      # An HS Code describes an item and its eligibility/rate for tariffs. HS Codes are organized by
      # Section/Chapter/Heading/Subheading/Classification.
      #
      # This API is intended to be useful to identify the correct HS Code to use for your item.
      # @param country [String] The name or code of the destination country.
      # @param hsCode [String] The Section or partial HS Code for which you would like to view the next level of HS Code detail, if more detail is available.
      # @return [FetchResult]
      def list_cross_border_codes(country, hsCode)
        path = "/api/v2/definitions/crossborder/#{country}/#{hsCode}"
        get(path)
      end


      # List top level HS Code Sections.
      #
      # Returns the full list of top level HS Code Sections. Sections are the broadest level of detail for
      # classifying tariff codes and the items to which they apply. HS Codes are organized
      # by Section/Chapter/Heading/Subheading/Classification.
      #
      # This API is intended to be useful to identify the top level Sections for
      # further LandedCost HS Code lookups.
      # @return [FetchResult]
      def list_cross_border_sections()
        path = "/api/v2/definitions/crossborder/sections"
        get(path)
      end


      # Retrieve the full list of Avalara-supported entity use codes
      #
      # Returns the full list of Avalara-supported entity use codes.
      # Entity/Use Codes are definitions of the entity who is purchasing something, or the purpose for which the transaction
      # is occurring. This information is generally used to determine taxability of the product.
      # In order to facilitate correct reporting of your taxes, you are encouraged to select the proper entity use codes for
      # all transactions that are exempt.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_entity_use_codes(options={})
        path = "/api/v2/definitions/entityusecodes"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported filing frequencies.
      #
      # Returns the full list of Avalara-supported filing frequencies.
      # This API is intended to be useful to identify all the different filing frequencies that can be used in notices.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_filing_frequencies(options={})
        path = "/api/v2/definitions/filingfrequencies"
        get(path, options)
      end


      # List jurisdictions based on the filter provided
      #
      # Returns a list of all Avalara-supported taxing jurisdictions.
      #
      # This API allows you to examine all Avalara-supported jurisdictions. You can filter your search by supplying
      # SQL-like query for fetching only the ones you concerned about. For example: effectiveDate &gt; '2016-01-01'
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_jurisdictions(options={})
        path = "/api/v2/definitions/jurisdictions"
        get(path, options)
      end


      # List jurisdictions near a specific address
      #
      # Returns a list of all Avalara-supported taxing jurisdictions that apply to this address.
      #
      # This API allows you to identify which jurisdictions are nearby a specific address according to the best available geocoding information.
      # It is intended to allow you to create a "Jurisdiction Override", which allows an address to be configured as belonging to a nearby
      # jurisdiction in AvaTax.
      #
      # The results of this API call can be passed to the `CreateJurisdictionOverride` API call.
      # @param line1 [String] The first address line portion of this address.
      # @param line2 [String] The second address line portion of this address.
      # @param line3 [String] The third address line portion of this address.
      # @param city [String] The city portion of this address.
      # @param region [String] The region, state, or province code portion of this address.
      # @param postalCode [String] The postal code or zip code portion of this address.
      # @param country [String] The two-character ISO-3166 code of the country portion of this address.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_jurisdictions_by_address(options={})
        path = "/api/v2/definitions/jurisdictionsnearaddress"
        get(path, options)
      end


      # Retrieve the list of questions that are required for a tax location
      #
      # Returns the list of additional questions you must answer when declaring a location in certain taxing jurisdictions.
      # Some tax jurisdictions require that you register or provide additional information to configure each physical place where
      # your company does business.
      # This information is not usually required in order to calculate tax correctly, but is almost always required to file your tax correctly.
      # You can call this API call for any address and obtain information about what questions must be answered in order to properly
      # file tax in that location.
      # @param line1 [String] The first line of this location's address.
      # @param line2 [String] The second line of this location's address.
      # @param line3 [String] The third line of this location's address.
      # @param city [String] The city part of this location's address.
      # @param region [String] The region, state, or province part of this location's address.
      # @param postalCode [String] The postal code of this location's address.
      # @param country [String] The country part of this location's address.
      # @param latitude [BigDecimal] Optionally identify the location via latitude/longitude instead of via address.
      # @param longitude [BigDecimal] Optionally identify the location via latitude/longitude instead of via address.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_location_questions_by_address(options={})
        path = "/api/v2/definitions/locationquestions"
        get(path, options)
      end


      # List all forms where logins can be verified automatically
      #
      # List all forms where logins can be verified automatically.
      # This API is intended to be useful to identify whether the user should be allowed
      # to automatically verify their login and password.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_login_verifiers(options={})
        path = "/api/v2/definitions/filingcalendars/loginverifiers"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported nexus for all countries and regions.
      #
      # Returns the full list of all Avalara-supported nexus for all countries and regions.
      #
      # This API is intended to be useful if your user interface needs to display a selectable list of nexus.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_nexus(options={})
        path = "/api/v2/definitions/nexus"
        get(path, options)
      end


      # List all nexus that apply to a specific address.
      #
      # Returns a list of all Avalara-supported taxing jurisdictions that apply to this address.
      # This API allows you to identify which tax authorities apply to a physical location, salesperson address, or point of sale.
      # In general, it is usually expected that a company will declare nexus in all the jurisdictions that apply to each physical address
      # where the company does business.
      # The results of this API call can be passed to the 'Create Nexus' API call to declare nexus for this address.
      # @param line1 [String] The first address line portion of this address.
      # @param line2 [String] The first address line portion of this address.
      # @param line3 [String] The first address line portion of this address.
      # @param city [String] The city portion of this address.
      # @param region [String] Name or ISO 3166 code identifying the region portion of the address.      This field supports many different region identifiers:   * Two and three character ISO 3166 region codes   * Fully spelled out names of the region in ISO supported languages   * Common alternative spellings for many regions      For a full list of all supported codes and names, please see the Definitions API `ListRegions`.
      # @param postalCode [String] The postal code or zip code portion of this address.
      # @param country [String] Name or ISO 3166 code identifying the country portion of this address.      This field supports many different country identifiers:   * Two character ISO 3166 codes   * Three character ISO 3166 codes   * Fully spelled out names of the country in ISO supported languages   * Common alternative spellings for many countries      For a full list of all supported codes and names, please see the Definitions API `ListCountries`.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_nexus_by_address(options={})
        path = "/api/v2/definitions/nexus/byaddress"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported nexus for a country.
      #
      # Returns all Avalara-supported nexus for the specified country.
      #
      # This API is intended to be useful if your user interface needs to display a selectable list of nexus filtered by country.
      # @param country [String] The country in which you want to fetch the system nexus
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_nexus_by_country(country, options={})
        path = "/api/v2/definitions/nexus/#{country}"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported nexus for a country and region.
      #
      # Returns all Avalara-supported nexus for the specified country and region.
      #
      # This API is intended to be useful if your user interface needs to display a selectable list of nexus filtered by country and region.
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param region [String] The two or three character region code for the region.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_nexus_by_country_and_region(country, region, options={})
        path = "/api/v2/definitions/nexus/#{country}/#{region}"
        get(path, options)
      end


      # List nexus related to a tax form
      #
      # Retrieves a list of nexus related to a tax form.
      #
      # The concept of `Nexus` indicates a place where your company has sufficient physical presence and is obligated
      # to collect and remit transaction-based taxes.
      #
      # When defining companies in AvaTax, you must declare nexus for your company in order to correctly calculate tax
      # in all jurisdictions affected by your transactions.
      #
      # This API is intended to provide useful information when examining a tax form. If you are about to begin filing
      # a tax form, you may want to know whether you have declared nexus in all the jurisdictions related to that tax
      # form in order to better understand how the form will be filled out.
      # @param formCode [String] The form code that we are looking up the nexus for
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [Object]
      def list_nexus_by_form_code(formCode, options={})
        path = "/api/v2/definitions/nexus/byform/#{formCode}"
        get(path, options)
      end


      # Retrieve the full list of nexus tax type groups
      #
      # Returns the full list of Avalara-supported nexus tax type groups
      # This API is intended to be useful to identify all the different tax sub-types.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_nexus_tax_type_groups(options={})
        path = "/api/v2/definitions/nexustaxtypegroups"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax notice customer funding options.
      #
      # Returns the full list of Avalara-supported tax notice customer funding options.
      # This API is intended to be useful to identify all the different notice customer funding options that can be used in notices.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_notice_customer_funding_options(options={})
        path = "/api/v2/definitions/noticecustomerfundingoptions"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax notice customer types.
      #
      # Returns the full list of Avalara-supported tax notice customer types.
      # This API is intended to be useful to identify all the different notice customer types.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_notice_customer_types(options={})
        path = "/api/v2/definitions/noticecustomertypes"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax notice filing types.
      #
      # Returns the full list of Avalara-supported tax notice filing types.
      # This API is intended to be useful to identify all the different notice filing types that can be used in notices.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_notice_filingtypes(options={})
        path = "/api/v2/definitions/noticefilingtypes"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax notice priorities.
      #
      # Returns the full list of Avalara-supported tax notice priorities.
      # This API is intended to be useful to identify all the different notice priorities that can be used in notices.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_notice_priorities(options={})
        path = "/api/v2/definitions/noticepriorities"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax notice reasons.
      #
      # Returns the full list of Avalara-supported tax notice reasons.
      # This API is intended to be useful to identify all the different tax notice reasons.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_notice_reasons(options={})
        path = "/api/v2/definitions/noticereasons"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax notice responsibility ids
      #
      # Returns the full list of Avalara-supported tax notice responsibility ids
      # This API is intended to be useful to identify all the different tax notice responsibilities.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_notice_responsibilities(options={})
        path = "/api/v2/definitions/noticeresponsibilities"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax notice root causes
      #
      # Returns the full list of Avalara-supported tax notice root causes
      # This API is intended to be useful to identify all the different tax notice root causes.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_notice_root_causes(options={})
        path = "/api/v2/definitions/noticerootcauses"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax notice statuses.
      #
      # Returns the full list of Avalara-supported tax notice statuses.
      # This API is intended to be useful to identify all the different tax notice statuses.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_notice_statuses(options={})
        path = "/api/v2/definitions/noticestatuses"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax notice types.
      #
      # Returns the full list of Avalara-supported tax notice types.
      # This API is intended to be useful to identify all the different notice types that can be used in notices.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_notice_types(options={})
        path = "/api/v2/definitions/noticetypes"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported extra parameters for creating transactions.
      #
      # Returns the full list of Avalara-supported extra parameters for the 'Create Transaction' API call.
      # This list of parameters is available for use when configuring your transaction.
      # Some parameters are only available for use if you have subscribed to certain features of AvaTax.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_parameters(options={})
        path = "/api/v2/definitions/parameters"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported permissions
      #
      # Returns the full list of Avalara-supported permission types.
      # This API is intended to be useful to identify the capabilities of a particular user logon.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_permissions(options={})
        path = "/api/v2/definitions/permissions"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported postal codes.
      #
      # Retrieves the list of Avalara-supported postal codes.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_postal_codes(options={})
        path = "/api/v2/definitions/postalcodes"
        get(path, options)
      end


      # Retrieve the full list of rate types for each country
      #
      # Returns the full list of Avalara-supported rate type file types
      # This API is intended to be useful to identify all the different rate types.
      # @param country [String] The country to examine for rate types
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_rate_types_by_country(country, options={})
        path = "/api/v2/definitions/countries/#{country}/ratetypes"
        get(path, options)
      end


      # List all ISO 3166 regions
      #
      # Returns a list of all ISO 3166 region codes and their US English friendly names.
      # This API is intended to be useful when presenting a dropdown box in your website to allow customers to select a region
      # within the country for a shipping addresses.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_regions(options={})
        path = "/api/v2/definitions/regions"
        get(path, options)
      end


      # List all ISO 3166 regions for a country
      #
      # Returns a list of all ISO 3166 region codes for a specific country code, and their US English friendly names.
      # This API is intended to be useful when presenting a dropdown box in your website to allow customers to select a region
      # within the country for a shipping addresses.
      # @param country [String] The country of which you want to fetch ISO 3166 regions
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_regions_by_country(country, options={})
        path = "/api/v2/definitions/countries/#{country}/regions"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported resource file types
      #
      # Returns the full list of Avalara-supported resource file types
      # This API is intended to be useful to identify all the different resource file types.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_resource_file_types(options={})
        path = "/api/v2/definitions/resourcefiletypes"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported permissions
      #
      # Returns the full list of Avalara-supported permission types.
      # This API is intended to be useful when designing a user interface for selecting the security role of a user account.
      # Some security roles are restricted for Avalara internal use.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_security_roles(options={})
        path = "/api/v2/definitions/securityroles"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported subscription types
      #
      # Returns the full list of Avalara-supported subscription types.
      # This API is intended to be useful for identifying which features you have added to your account.
      # You may always contact Avalara's sales department for information on available products or services.
      # You cannot change your subscriptions directly through the API.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_subscription_types(options={})
        path = "/api/v2/definitions/subscriptiontypes"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax authorities.
      #
      # Returns the full list of Avalara-supported tax authorities.
      # This API is intended to be useful to identify all the different authorities that receive tax.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_tax_authorities(options={})
        path = "/api/v2/definitions/taxauthorities"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported forms for each tax authority.
      #
      # Returns the full list of Avalara-supported forms for each tax authority.
      # This list represents tax forms that Avalara recognizes.
      # Customers who subscribe to Avalara Managed Returns Service can request these forms to be filed automatically
      # based on the customer's AvaTax data.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_tax_authority_forms(options={})
        path = "/api/v2/definitions/taxauthorityforms"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax authority types.
      #
      # Returns the full list of Avalara-supported tax authority types.
      # This API is intended to be useful to identify all the different authority types.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_tax_authority_types(options={})
        path = "/api/v2/definitions/taxauthoritytypes"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax codes.
      #
      # Retrieves the list of Avalara-supported system tax codes.
      # A 'TaxCode' represents a uniquely identified type of product, good, or service.
      # Avalara supports correct tax rates and taxability rules for all TaxCodes in all supported jurisdictions.
      # If you identify your products by tax code in your 'Create Transacion' API calls, Avalara will correctly calculate tax rates and
      # taxability rules for this product in all supported jurisdictions.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_tax_codes(options={})
        path = "/api/v2/definitions/taxcodes"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported tax code types.
      #
      # Returns the full list of recognized tax code types.
      # A 'Tax Code Type' represents a broad category of tax codes, and is less detailed than a single TaxCode.
      # This API is intended to be useful for broadly searching for tax codes by tax code type.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [Object]
      def list_tax_code_types(options={})
        path = "/api/v2/definitions/taxcodetypes"
        get(path, options)
      end


      # Retrieve the full list of the Tax Forms available
      #
      # Returns the full list of Avalara-supported Tax Forms
      # This API is intended to be useful to identify all the different Tax Forms
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_tax_forms(options={})
        path = "/api/v2/definitions/taxforms"
        get(path, options)
      end


      # Retrieve the full list of tax sub types
      #
      # Returns the full list of Avalara-supported tax sub-types
      # This API is intended to be useful to identify all the different tax sub-types.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_tax_sub_types(options={})
        path = "/api/v2/definitions/taxsubtypes"
        get(path, options)
      end


      # Retrieve the full list of tax type groups
      #
      # Returns the full list of Avalara-supported tax type groups
      # This API is intended to be useful to identify all the different tax type groups.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_tax_type_groups(options={})
        path = "/api/v2/definitions/taxtypegroups"
        get(path, options)
      end


      # List all defined units of measurement
      #
      # List all units of measurement systems defined by Avalara.
      #
      # A unit of measurement system is a method of measuring a quantity, such as distance, mass, or others.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_unit_of_measurement(options={})
        path = "/api/v2/definitions/unitofmeasurements"
        get(path, options)
      end

    end
  end
end