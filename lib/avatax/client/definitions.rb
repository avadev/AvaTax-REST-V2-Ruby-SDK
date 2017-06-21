module AvaTax
  class Client
    module Definitions 


      # Test whether a form supports online login verification
      #
      # This API is intended to be useful to identify whether the user should be allowed
      # to automatically verify their login and password.
      # @param form [String] The name of the form you would like to verify. This can be the tax form code or the legacy return name
      # @return [FetchResult]
      def get_login_verifier_by_form(form)
        path = "/api/v2/definitions/filingcalendars/loginverifiers/#{form}"
        get(path)
      end


      # Retrieve the full list of the AvaFile Forms available
      #
      # Returns the full list of Avalara-supported AvaFile Forms
      # This API is intended to be useful to identify all the different AvaFile Forms
      # @return [FetchResult]
      def list_ava_file_forms()
        path = "/api/v2/definitions/avafileforms"
        get(path)
      end


      # Retrieve the full list of communications transactiontypes
      #
      # Returns full list of communications transaction types which
      # are accepted in communication tax calculation requests.
      # @param id [Integer] 
      # @return [FetchResult]
      def list_communications_service_types(id)
        path = "/api/v2/definitions/communications/transactiontypes/#{id}/servicetypes"
        get(path)
      end


      # Retrieve the full list of communications transactiontypes
      #
      # Returns full list of communications transaction types which
      # are accepted in communication tax calculation requests.
      # @return [FetchResult]
      def list_communications_transaction_types()
        path = "/api/v2/definitions/communications/transactiontypes"
        get(path)
      end


      # Retrieve the full list of communications transaction/service type pairs
      #
      # Returns full list of communications transaction/service type pairs which
      # are accepted in communication tax calculation requests.
      # @return [FetchResult]
      def list_communications_t_s_pairs()
        path = "/api/v2/definitions/communications/tspairs"
        get(path)
      end


      # List all ISO 3166 countries
      #
      # Returns a list of all ISO 3166 country codes, and their US English friendly names.
      # This API is intended to be useful when presenting a dropdown box in your website to allow customers to select a country for
      # a shipping address.
      # @return [FetchResult]
      def list_countries()
        path = "/api/v2/definitions/countries"
        get(path)
      end


      # Retrieve the full list of Avalara-supported entity use codes
      #
      # Returns the full list of Avalara-supported entity use codes.
      # Entity/Use Codes are definitions of the entity who is purchasing something, or the purpose for which the transaction
      # is occurring. This information is generally used to determine taxability of the product.
      # In order to facilitate correct reporting of your taxes, you are encouraged to select the proper entity use codes for
      # all transactions that are exempt.
      # @return [FetchResult]
      def list_entity_use_codes()
        path = "/api/v2/definitions/entityusecodes"
        get(path)
      end


      # Retrieve the full list of Avalara-supported filing frequencies.
      #
      # Returns the full list of Avalara-supported filing frequencies.
      # This API is intended to be useful to identify all the different filing frequencies that can be used in notices.
      # @return [FetchResult]
      def list_filing_frequencies()
        path = "/api/v2/definitions/filingfrequencies"
        get(path)
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
      # @return [FetchResult]
      def list_login_verifiers()
        path = "/api/v2/definitions/filingcalendars/loginverifiers"
        get(path)
      end


      # Retrieve the full list of Avalara-supported nexus for all countries and regions.
      #
      # Returns the full list of all Avalara-supported nexus for all countries and regions.
      # This API is intended to be useful if your user interface needs to display a selectable list of nexus.
      # @return [FetchResult]
      def list_nexus()
        path = "/api/v2/definitions/nexus"
        get(path)
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
      # @param region [String] The region, state, or province code portion of this address.
      # @param postalCode [String] The postal code or zip code portion of this address.
      # @param country [String] The two-character ISO-3166 code of the country portion of this address.
      # @return [FetchResult]
      def list_nexus_by_address(options={})
        path = "/api/v2/definitions/nexus/byaddress"
        get(path, options)
      end


      # Retrieve the full list of Avalara-supported nexus for a country.
      #
      # Returns all Avalara-supported nexus for the specified country.
      # This API is intended to be useful if your user interface needs to display a selectable list of nexus filtered by country.
      # @param country [String] 
      # @return [FetchResult]
      def list_nexus_by_country(country)
        path = "/api/v2/definitions/nexus/#{country}"
        get(path)
      end


      # Retrieve the full list of Avalara-supported nexus for a country and region.
      #
      # Returns all Avalara-supported nexus for the specified country and region.
      # This API is intended to be useful if your user interface needs to display a selectable list of nexus filtered by country and region.
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param region [String] The two or three character region code for the region.
      # @return [FetchResult]
      def list_nexus_by_country_and_region(country, region)
        path = "/api/v2/definitions/nexus/#{country}/#{region}"
        get(path)
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
      # @return [Object]
      def list_nexus_by_form_code(formCode)
        path = "/api/v2/definitions/nexus/byform/#{formCode}"
        get(path)
      end


      # Retrieve the full list of nexus tax type groups
      #
      # Returns the full list of Avalara-supported nexus tax type groups
      # This API is intended to be useful to identify all the different tax sub-types.
      # @return [FetchResult]
      def list_nexus_tax_type_groups()
        path = "/api/v2/definitions/nexustaxtypegroups"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax notice customer funding options.
      #
      # Returns the full list of Avalara-supported tax notice customer funding options.
      # This API is intended to be useful to identify all the different notice customer funding options that can be used in notices.
      # @return [FetchResult]
      def list_notice_customer_funding_options()
        path = "/api/v2/definitions/noticecustomerfundingoptions"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax notice customer types.
      #
      # Returns the full list of Avalara-supported tax notice customer types.
      # This API is intended to be useful to identify all the different notice customer types.
      # @return [FetchResult]
      def list_notice_customer_types()
        path = "/api/v2/definitions/noticecustomertypes"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax notice filing types.
      #
      # Returns the full list of Avalara-supported tax notice filing types.
      # This API is intended to be useful to identify all the different notice filing types that can be used in notices.
      # @return [FetchResult]
      def list_notice_filingtypes()
        path = "/api/v2/definitions/noticefilingtypes"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax notice priorities.
      #
      # Returns the full list of Avalara-supported tax notice priorities.
      # This API is intended to be useful to identify all the different notice priorities that can be used in notices.
      # @return [FetchResult]
      def list_notice_priorities()
        path = "/api/v2/definitions/noticepriorities"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax notice reasons.
      #
      # Returns the full list of Avalara-supported tax notice reasons.
      # This API is intended to be useful to identify all the different tax notice reasons.
      # @return [FetchResult]
      def list_notice_reasons()
        path = "/api/v2/definitions/noticereasons"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax notice responsibility ids
      #
      # Returns the full list of Avalara-supported tax notice responsibility ids
      # This API is intended to be useful to identify all the different tax notice responsibilities.
      # @return [FetchResult]
      def list_notice_responsibilities()
        path = "/api/v2/definitions/noticeresponsibilities"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax notice root causes
      #
      # Returns the full list of Avalara-supported tax notice root causes
      # This API is intended to be useful to identify all the different tax notice root causes.
      # @return [FetchResult]
      def list_notice_root_causes()
        path = "/api/v2/definitions/noticerootcauses"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax notice statuses.
      #
      # Returns the full list of Avalara-supported tax notice statuses.
      # This API is intended to be useful to identify all the different tax notice statuses.
      # @return [FetchResult]
      def list_notice_statuses()
        path = "/api/v2/definitions/noticestatuses"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax notice types.
      #
      # Returns the full list of Avalara-supported tax notice types.
      # This API is intended to be useful to identify all the different notice types that can be used in notices.
      # @return [FetchResult]
      def list_notice_types()
        path = "/api/v2/definitions/noticetypes"
        get(path)
      end


      # Retrieve the full list of Avalara-supported extra parameters for creating transactions.
      #
      # Returns the full list of Avalara-supported extra parameters for the 'Create Transaction' API call.
      # This list of parameters is available for use when configuring your transaction.
      # Some parameters are only available for use if you have subscribed to certain features of AvaTax.
      # @return [FetchResult]
      def list_parameters()
        path = "/api/v2/definitions/parameters"
        get(path)
      end


      # Retrieve the full list of Avalara-supported permissions
      #
      # Returns the full list of Avalara-supported permission types.
      # This API is intended to be useful to identify the capabilities of a particular user logon.
      # @return [FetchResult]
      def list_permissions()
        path = "/api/v2/definitions/permissions"
        get(path)
      end


      # Retrieve the full list of rate types for each country
      #
      # Returns the full list of Avalara-supported rate type file types
      # This API is intended to be useful to identify all the different rate types.
      # @param country [String] 
      # @return [FetchResult]
      def list_rate_types_by_country(country)
        path = "/api/v2/definitions/countries/#{country}/ratetypes"
        get(path)
      end


      # List all ISO 3166 regions
      #
      # Returns a list of all ISO 3166 region codes and their US English friendly names.
      # This API is intended to be useful when presenting a dropdown box in your website to allow customers to select a region
      # within the country for a shipping addresses.
      # @return [FetchResult]
      def list_regions()
        path = "/api/v2/definitions/regions"
        get(path)
      end


      # List all ISO 3166 regions for a country
      #
      # Returns a list of all ISO 3166 region codes for a specific country code, and their US English friendly names.
      # This API is intended to be useful when presenting a dropdown box in your website to allow customers to select a region
      # within the country for a shipping addresses.
      # @param country [String] 
      # @return [FetchResult]
      def list_regions_by_country(country)
        path = "/api/v2/definitions/countries/#{country}/regions"
        get(path)
      end


      # Retrieve the full list of Avalara-supported resource file types
      #
      # Returns the full list of Avalara-supported resource file types
      # This API is intended to be useful to identify all the different resource file types.
      # @return [FetchResult]
      def list_resource_file_types()
        path = "/api/v2/definitions/resourcefiletypes"
        get(path)
      end


      # Retrieve the full list of Avalara-supported permissions
      #
      # Returns the full list of Avalara-supported permission types.
      # This API is intended to be useful when designing a user interface for selecting the security role of a user account.
      # Some security roles are restricted for Avalara internal use.
      # @return [FetchResult]
      def list_security_roles()
        path = "/api/v2/definitions/securityroles"
        get(path)
      end


      # Retrieve the full list of Avalara-supported subscription types
      #
      # Returns the full list of Avalara-supported subscription types.
      # This API is intended to be useful for identifying which features you have added to your account.
      # You may always contact Avalara's sales department for information on available products or services.
      # You cannot change your subscriptions directly through the API.
      # @return [FetchResult]
      def list_subscription_types()
        path = "/api/v2/definitions/subscriptiontypes"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax authorities.
      #
      # Returns the full list of Avalara-supported tax authorities.
      # This API is intended to be useful to identify all the different authorities that receive tax.
      # @return [FetchResult]
      def list_tax_authorities()
        path = "/api/v2/definitions/taxauthorities"
        get(path)
      end


      # Retrieve the full list of Avalara-supported forms for each tax authority.
      #
      # Returns the full list of Avalara-supported forms for each tax authority.
      # This list represents tax forms that Avalara recognizes.
      # Customers who subscribe to Avalara Managed Returns Service can request these forms to be filed automatically
      # based on the customer's AvaTax data.
      # @return [FetchResult]
      def list_tax_authority_forms()
        path = "/api/v2/definitions/taxauthorityforms"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax authority types.
      #
      # Returns the full list of Avalara-supported tax authority types.
      # This API is intended to be useful to identify all the different authority types.
      # @return [FetchResult]
      def list_tax_authority_types()
        path = "/api/v2/definitions/taxauthoritytypes"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax codes.
      #
      # Retrieves the list of Avalara-supported system tax codes.
      # A 'TaxCode' represents a uniquely identified type of product, good, or service.
      # Avalara supports correct tax rates and taxability rules for all TaxCodes in all supported jurisdictions.
      # If you identify your products by tax code in your 'Create Transacion' API calls, Avalara will correctly calculate tax rates and
      # taxability rules for this product in all supported jurisdictions.
      # @return [FetchResult]
      def list_tax_codes()
        path = "/api/v2/definitions/taxcodes"
        get(path)
      end


      # Retrieve the full list of Avalara-supported tax code types.
      #
      # Returns the full list of recognized tax code types.
      # A 'Tax Code Type' represents a broad category of tax codes, and is less detailed than a single TaxCode.
      # This API is intended to be useful for broadly searching for tax codes by tax code type.
      # @return [Object]
      def list_tax_code_types()
        path = "/api/v2/definitions/taxcodetypes"
        get(path)
      end


      # Retrieve the full list of tax sub types
      #
      # Returns the full list of Avalara-supported tax sub-types
      # This API is intended to be useful to identify all the different tax sub-types.
      # @return [FetchResult]
      def list_tax_sub_types()
        path = "/api/v2/definitions/taxsubtypes"
        get(path)
      end


      # Retrieve the full list of tax type groups
      #
      # Returns the full list of Avalara-supported tax type groups
      # This API is intended to be useful to identify all the different tax type groups.
      # @return [FetchResult]
      def list_tax_type_groups()
        path = "/api/v2/definitions/taxtypegroups"
        get(path)
      end

    end
  end
end