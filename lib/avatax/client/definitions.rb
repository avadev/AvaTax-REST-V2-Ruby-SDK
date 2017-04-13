module AvaTax
  class Client
    module Definitions 


      # Retrieve the full list of Avalara-supported nexus for a country and region.
      # 
      # Returns all Avalara-supported nexus for the specified country and region.
      # This API is intended to be useful if your user interface needs to display a selectable list of nexus filtered by country and region.
      # 
      # @return FetchResult
      def apiV2DefinitionsNexusByCountryByRegionGet($country, $region)
        path = '/api/v2/definitions/nexus/#{country}/#{region}';
        get (path)
      end


      # Retrieve the full list of Avalara-supported nexus for a country.
      # 
      # Returns all Avalara-supported nexus for the specified country.
      # This API is intended to be useful if your user interface needs to display a selectable list of nexus filtered by country.
      # 
      # @return FetchResult
      def apiV2DefinitionsNexusByCountryGet($country)
        path = '/api/v2/definitions/nexus/#{country}';
        get (path)
      end


      # Retrieve the full list of Avalara-supported nexus for all countries and regions.
      # 
      # Returns the full list of all Avalara-supported nexus for all countries and regions. 
      # This API is intended to be useful if your user interface needs to display a selectable list of nexus.
      # 
      # @return FetchResult
      def apiV2DefinitionsNexusGet()
        path = '/api/v2/definitions/nexus';
        get (path)
      end


      # Test whether a form supports online login verification
      # 
      # This API is intended to be useful to identify whether the user should be allowed
      # to automatically verify their login and password.
      # 
      # @return FetchResult
      def getLoginVerifierByForm($form)
        path = '/api/v2/definitions/filingcalendars/loginverifiers/#{form}';
        get (path)
      end


      # List all ISO 3166 countries
      # 
      # Returns a list of all ISO 3166 country codes, and their US English friendly names.
      # This API is intended to be useful when presenting a dropdown box in your website to allow customers to select a country for 
      # a shipping address.
      # 
      # @return FetchResult
      def listCountries()
        path = '/api/v2/definitions/countries';
        get (path)
      end


      # Retrieve the full list of Avalara-supported entity use codes
      # 
      # Returns the full list of Avalara-supported entity use codes.
      # Entity/Use Codes are definitions of the entity who is purchasing something, or the purpose for which the transaction
      # is occurring. This information is generally used to determine taxability of the product.
      # In order to facilitate correct reporting of your taxes, you are encouraged to select the proper entity use codes for
      # all transactions that are exempt.
      # 
      # @return FetchResult
      def listEntityUseCodes()
        path = '/api/v2/definitions/entityusecodes';
        get (path)
      end


      # Retrieve the full list of Avalara-supported filing frequencies.
      # 
      # Returns the full list of Avalara-supported filing frequencies.
      # This API is intended to be useful to identify all the different filing frequencies that can be used in notices.
      # 
      # @return FetchResult
      def listFilingFrequencies()
        path = '/api/v2/definitions/filingfrequencies';
        get (path)
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
      # 
      # @param string $line1 The first address line portion of this address.
      # @param string $line2 The second address line portion of this address.
      # @param string $line3 The third address line portion of this address.
      # @param string $city The city portion of this address.
      # @param string $region The region, state, or province code portion of this address.
      # @param string $postalCode The postal code or zip code portion of this address.
      # @param string $country The two-character ISO-3166 code of the country portion of this address.
      # @return FetchResult
      def listJurisdictionsByAddress($line1, $line2, $line3, $city, $region, $postalCode, $country)
        path = '/api/v2/definitions/jurisdictionsnearaddress';
        get (path)
      end


      # Retrieve the list of questions that are required for a tax location
      # 
      # Returns the list of additional questions you must answer when declaring a location in certain taxing jurisdictions.
      # Some tax jurisdictions require that you register or provide additional information to configure each physical place where
      # your company does business.
      # This information is not usually required in order to calculate tax correctly, but is almost always required to file your tax correctly.
      # You can call this API call for any address and obtain information about what questions must be answered in order to properly
      # file tax in that location.
      # 
      # @param string $line1 The first line of this location's address.
      # @param string $line2 The second line of this location's address.
      # @param string $line3 The third line of this location's address.
      # @param string $city The city part of this location's address.
      # @param string $region The region, state, or province part of this location's address.
      # @param string $postalCode The postal code of this location's address.
      # @param string $country The country part of this location's address.
      # @param float $latitude Optionally identify the location via latitude/longitude instead of via address.
      # @param float $longitude Optionally identify the location via latitude/longitude instead of via address.
      # @return FetchResult
      def listLocationQuestionsByAddress($line1, $line2, $line3, $city, $region, $postalCode, $country, $latitude, $longitude)
        path = '/api/v2/definitions/locationquestions';
        get (path)
      end


      # List all forms where logins can be verified automatically
      # 
      # List all forms where logins can be verified automatically.
      # This API is intended to be useful to identify whether the user should be allowed
      # to automatically verify their login and password.
      # 
      # @return FetchResult
      def listLoginVerifiers()
        path = '/api/v2/definitions/filingcalendars/loginverifiers';
        get (path)
      end


      # List all nexus that apply to a specific address.
      # 
      # Returns a list of all Avalara-supported taxing jurisdictions that apply to this address.
      # This API allows you to identify which tax authorities apply to a physical location, salesperson address, or point of sale.
      # In general, it is usually expected that a company will declare nexus in all the jurisdictions that apply to each physical address
      # where the company does business.
      # The results of this API call can be passed to the 'Create Nexus' API call to declare nexus for this address.
      # 
      # @param string $line1 The first address line portion of this address.
      # @param string $line2 The first address line portion of this address.
      # @param string $line3 The first address line portion of this address.
      # @param string $city The city portion of this address.
      # @param string $region The region, state, or province code portion of this address.
      # @param string $postalCode The postal code or zip code portion of this address.
      # @param string $country The two-character ISO-3166 code of the country portion of this address.
      # @return FetchResult
      def listNexusByAddress($line1, $line2, $line3, $city, $region, $postalCode, $country)
        path = '/api/v2/definitions/nexus/byaddress';
        get (path)
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
      # 
      # @return NexusByTaxFormModel
      def listNexusByFormCode($formCode)
        path = '/api/v2/definitions/nexus/byform/#{formCode}';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax notice customer funding options.
      # 
      # Returns the full list of Avalara-supported tax notice customer funding options.
      # This API is intended to be useful to identify all the different notice customer funding options that can be used in notices.
      # 
      # @return FetchResult
      def listNoticeCustomerFundingOptions()
        path = '/api/v2/definitions/noticecustomerfundingoptions';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax notice customer types.
      # 
      # Returns the full list of Avalara-supported tax notice customer types.
      # This API is intended to be useful to identify all the different notice customer types.
      # 
      # @return FetchResult
      def listNoticeCustomerTypes()
        path = '/api/v2/definitions/noticecustomertypes';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax notice filing types.
      # 
      # Returns the full list of Avalara-supported tax notice filing types.
      # This API is intended to be useful to identify all the different notice filing types that can be used in notices.
      # 
      # @return FetchResult
      def listNoticeFilingtypes()
        path = '/api/v2/definitions/noticefilingtypes';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax notice priorities.
      # 
      # Returns the full list of Avalara-supported tax notice priorities.
      # This API is intended to be useful to identify all the different notice priorities that can be used in notices.
      # 
      # @return FetchResult
      def listNoticePriorities()
        path = '/api/v2/definitions/noticepriorities';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax notice reasons.
      # 
      # Returns the full list of Avalara-supported tax notice reasons.
      # This API is intended to be useful to identify all the different tax notice reasons.
      # 
      # @return FetchResult
      def listNoticeReasons()
        path = '/api/v2/definitions/noticereasons';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax notice responsibility ids
      # 
      # Returns the full list of Avalara-supported tax notice responsibility ids
      # This API is intended to be useful to identify all the different tax notice responsibilities.
      # 
      # @return FetchResult
      def listNoticeResponsibilities()
        path = '/api/v2/definitions/noticeresponsibilities';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax notice root causes
      # 
      # Returns the full list of Avalara-supported tax notice root causes
      # This API is intended to be useful to identify all the different tax notice root causes.
      # 
      # @return FetchResult
      def listNoticeRootCauses()
        path = '/api/v2/definitions/noticerootcauses';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax notice statuses.
      # 
      # Returns the full list of Avalara-supported tax notice statuses.
      # This API is intended to be useful to identify all the different tax notice statuses.
      # 
      # @return FetchResult
      def listNoticeStatuses()
        path = '/api/v2/definitions/noticestatuses';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax notice types.
      # 
      # Returns the full list of Avalara-supported tax notice types.
      # This API is intended to be useful to identify all the different notice types that can be used in notices.
      # 
      # @return FetchResult
      def listNoticeTypes()
        path = '/api/v2/definitions/noticetypes';
        get (path)
      end


      # Retrieve the full list of Avalara-supported extra parameters for creating transactions.
      # 
      # Returns the full list of Avalara-supported extra parameters for the 'Create Transaction' API call.
      # This list of parameters is available for use when configuring your transaction.
      # Some parameters are only available for use if you have subscribed to certain features of AvaTax.
      # 
      # @return FetchResult
      def listParameters()
        path = '/api/v2/definitions/parameters';
        get (path)
      end


      # Retrieve the full list of Avalara-supported permissions
      # 
      # Returns the full list of Avalara-supported permission types.
      # This API is intended to be useful to identify the capabilities of a particular user logon.
      # 
      # @return FetchResult
      def listPermissions()
        path = '/api/v2/definitions/permissions';
        get (path)
      end


      # Retrieve the full list of rate types for each country
      # 
      # Returns the full list of Avalara-supported rate type file types
      # This API is intended to be useful to identify all the different rate types.
      # 
      # @return FetchResult
      def listRateTypesByCountry($country)
        path = '/api/v2/definitions/countries/#{country}/ratetypes';
        get (path)
      end


      # List all ISO 3166 regions
      # 
      # Returns a list of all ISO 3166 region codes and their US English friendly names.
      # This API is intended to be useful when presenting a dropdown box in your website to allow customers to select a region 
      # within the country for a shipping addresses.
      # 
      # @return FetchResult
      def listRegions()
        path = '/api/v2/definitions/regions';
        get (path)
      end


      # List all ISO 3166 regions for a country
      # 
      # Returns a list of all ISO 3166 region codes for a specific country code, and their US English friendly names.
      # This API is intended to be useful when presenting a dropdown box in your website to allow customers to select a region 
      # within the country for a shipping addresses.
      # 
      # @return FetchResult
      def listRegionsByCountry($country)
        path = '/api/v2/definitions/countries/#{country}/regions';
        get (path)
      end


      # Retrieve the full list of Avalara-supported resource file types
      # 
      # Returns the full list of Avalara-supported resource file types
      # This API is intended to be useful to identify all the different resource file types.
      # 
      # @return FetchResult
      def listResourceFileTypes()
        path = '/api/v2/definitions/resourcefiletypes';
        get (path)
      end


      # Retrieve the full list of Avalara-supported permissions
      # 
      # Returns the full list of Avalara-supported permission types.
      # This API is intended to be useful when designing a user interface for selecting the security role of a user account.
      # Some security roles are restricted for Avalara internal use.
      # 
      # @return FetchResult
      def listSecurityRoles()
        path = '/api/v2/definitions/securityroles';
        get (path)
      end


      # Retrieve the full list of Avalara-supported subscription types
      # 
      # Returns the full list of Avalara-supported subscription types.
      # This API is intended to be useful for identifying which features you have added to your account.
      # You may always contact Avalara's sales department for information on available products or services.
      # You cannot change your subscriptions directly through the API.
      # 
      # @return FetchResult
      def listSubscriptionTypes()
        path = '/api/v2/definitions/subscriptiontypes';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax authorities.
      # 
      # Returns the full list of Avalara-supported tax authorities.
      # This API is intended to be useful to identify all the different authorities that receive tax.
      # 
      # @return FetchResult
      def listTaxAuthorities()
        path = '/api/v2/definitions/taxauthorities';
        get (path)
      end


      # Retrieve the full list of Avalara-supported forms for each tax authority.
      # 
      # Returns the full list of Avalara-supported forms for each tax authority.
      # This list represents tax forms that Avalara recognizes.
      # Customers who subscribe to Avalara Managed Returns Service can request these forms to be filed automatically 
      # based on the customer's AvaTax data.
      # 
      # @return FetchResult
      def listTaxAuthorityForms()
        path = '/api/v2/definitions/taxauthorityforms';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax authority types.
      # 
      # Returns the full list of Avalara-supported tax authority types.
      # This API is intended to be useful to identify all the different authority types.
      # 
      # @return FetchResult
      def listTaxAuthorityTypes()
        path = '/api/v2/definitions/taxauthoritytypes';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax codes.
      # 
      # Retrieves the list of Avalara-supported system tax codes.
      # A 'TaxCode' represents a uniquely identified type of product, good, or service.
      # Avalara supports correct tax rates and taxability rules for all TaxCodes in all supported jurisdictions.
      # If you identify your products by tax code in your 'Create Transacion' API calls, Avalara will correctly calculate tax rates and
      # taxability rules for this product in all supported jurisdictions.
      # 
      # @return FetchResult
      def listTaxCodes()
        path = '/api/v2/definitions/taxcodes';
        get (path)
      end


      # Retrieve the full list of Avalara-supported tax code types.
      # 
      # Returns the full list of recognized tax code types.
      # A 'Tax Code Type' represents a broad category of tax codes, and is less detailed than a single TaxCode.
      # This API is intended to be useful for broadly searching for tax codes by tax code type.
      # 
      # @return TaxCodeTypesModel
      def listTaxCodeTypes()
        path = '/api/v2/definitions/taxcodetypes';
        get (path)
      end

    end
  end
end