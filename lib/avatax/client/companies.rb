module AvaTax
  class Client
    module Companies 


      # Quick setup for a company with a single physical address
      # 
      # Shortcut to quickly setup a single-physical-location company with critical information and activate it.
      # This API provides quick and simple company setup functionality and does the following things:
      #  
      # * Create a company object with its own tax profile
      # * Add a key contact person for the company
      # * Set up one physical location for the main office
      # * Declare nexus in all taxing jurisdictions for that main office address
      # * Activate the company
      #  
      # This API only provides a limited subset of functionality compared to the 'Create Company' API call. 
      # If you need additional features or options not present in this 'Quick Setup' API call, please use the full 'Create Company' call instead.
      # 
      # @param CompanyInitializationModel $model Information about the company you wish to create.
      # @return CompanyModel
      def companyInitialize($model)
        path = '/api/v2/companies/initialize';
        post (path)
      end


      # Create new companies
      # 
      # Create one or more new company objects.
      # A 'company' represents a single corporation or individual that is registered to handle transactional taxes.
      # You may attach nested data objects such as contacts, locations, and nexus with this CREATE call, and those objects will be created with the company.
      # 
      # @param CompanyModel[] $model Either a single company object or an array of companies to create
      # @return CompanyModel[]
      def createCompanies($model)
        path = '/api/v2/companies';
        post (path)
      end


      # Request managed returns funding setup for a company
      # 
      # This API is available by invitation only.
      # Companies that use the Avalara Managed Returns or the SST Certified Service Provider services are 
      # required to setup their funding configuration before Avalara can begin filing tax returns on their 
      # behalf.
      # Funding configuration for each company is set up by submitting a funding setup request, which can
      # be sent either via email or via an embedded HTML widget.
      # When the funding configuration is submitted to Avalara, it will be reviewed by treasury team members
      # before approval.
      # This API records that an ambedded HTML funding setup widget was activated.
      # This API requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      # 
      # @param int $id The unique identifier of the company
      # @param FundingInitiateModel $model The funding initialization request
      # @return FundingStatusModel
      def createFundingRequest($id, $model)
        path = '/api/v2/companies/#{id}/funding/setup';
        post (path)
      end


      # Delete a single company
      # 
      # Deleting a company will delete all child companies, and all users attached to this company.
      # 
      # @param int $id The ID of the company you wish to delete.
      # @return ErrorDetail[]
      def deleteCompany($id)
        path = '/api/v2/companies/#{id}';
        delete (path)
      end


      # Retrieve a single company
      # 
      # Get the company object identified by this URL.
      # A 'company' represents a single corporation or individual that is registered to handle transactional taxes.
      # You may specify one or more of the following values in the '$include' parameter to fetch additional nested data, using commas to separate multiple values:
      # 
      #  * Contacts
      #  * Items
      #  * Locations
      #  * Nexus
      #  * Settings
      #  * TaxCodes
      #  * TaxRules
      #  * UPC
      # 
      # @param int $id The ID of the company to retrieve.
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @return CompanyModel
      def getCompany($id, $include)
        path = '/api/v2/companies/#{id}';
        get (path)
      end


      # Get configuration settings for this company
      # 
      # Retrieve a list of all configuration settings tied to this company.
      # 
      # Configuration settings provide you with the ability to control features of your account and of your
      # tax software. The category names `AvaCertServiceConfig` is reserved for
      # Avalara internal software configuration values; to store your own account-level settings, please
      # create a new category name that begins with `X-`, for example, `X-MyCustomCategory`.
      # 
      # Company settings are permanent settings that cannot be deleted. You can set the value of a
      # company setting to null if desired.
      # 
      # Avalara-based account settings for `AvaCertServiceConfig` affect your account's exemption certificate
      # processing, and should only be changed with care.
      # 
      # @param int $id 
      # @return CompanyConfigurationModel[]
      def getCompanyConfiguration($id)
        path = '/api/v2/companies/#{id}/configuration';
        get (path)
      end


      # Check managed returns funding configuration for a company
      # 
      # This API is available by invitation only.
      # Requires a subscription to Avalara Managed Returns or SST Certified Service Provider.
      # Returns a list of funding setup requests and their current status.
      # Each object in the result is a request that was made to setup or adjust funding configuration for this company.
      # 
      # @param int $id The unique identifier of the company
      # @return FundingStatusModel[]
      def listFundingRequestsByCompany($id)
        path = '/api/v2/companies/#{id}/funding';
        get (path)
      end


      # Retrieve all companies
      # 
      # Get multiple company objects.
      # A 'company' represents a single corporation or individual that is registered to handle transactional taxes.
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # You may specify one or more of the following values in the `$include` parameter to fetch additional nested data, using commas to separate multiple values:
      #  
      # * Contacts
      # * Items
      # * Locations
      # * Nexus
      # * Settings
      # * TaxCodes
      # * TaxRules
      # * UPC
      # 
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def queryCompanies($include, $filter, $top, $skip, $orderBy)
        path = '/api/v2/companies';
        get (path)
      end


      # Change configuration settings for this account
      # 
      # Update configuration settings tied to this account.
      # 
      # Configuration settings provide you with the ability to control features of your account and of your
      # tax software. The category names `AvaCertServiceConfig` is reserved for
      # Avalara internal software configuration values; to store your own account-level settings, please
      # create a new category name that begins with `X-`, for example, `X-MyCustomCategory`.
      # 
      # Company settings are permanent settings that cannot be deleted. You can set the value of a
      # company setting to null if desired.
      # 
      # Avalara-based account settings for `AvaCertServiceConfig` affect your account's exemption certificate
      # processing, and should only be changed with care.
      # 
      # @param int $id 
      # @param CompanyConfigurationModel[] $model 
      # @return CompanyConfigurationModel[]
      def setCompanyConfiguration($id, $model)
        path = '/api/v2/companies/#{id}/configuration';
        post (path)
      end


      # Update a single company
      # 
      # Replace the existing company object at this URL with an updated object.
      # A 'company' represents a single corporation or individual that is registered to handle transactional taxes.
      # All data from the existing object will be replaced with data in the object you PUT. 
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # 
      # @param int $id The ID of the company you wish to update.
      # @param CompanyModel $model The company object you wish to update.
      # @return CompanyModel
      def updateCompany($id, $model)
        path = '/api/v2/companies/#{id}';
        put (path)
      end

    end
  end
end