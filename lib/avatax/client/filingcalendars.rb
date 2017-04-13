module AvaTax
  class Client
    module FilingCalendars 


      # Retrieve a single filing calendar
      # 
      # This API is available by invitation only.
      # 
      # @return FilingCalendarModel
      def apiV2CompaniesByCompanyIdFilingcalendarsByIdGet($companyId, $id)
        path = '/api/v2/companies/#{companyId}/filingcalendars/#{id}';
        get (path)
      end


      # Retrieve all filing calendars for this company
      # 
      # This API is available by invitation only.
      # 
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def apiV2CompaniesByCompanyIdFilingcalendarsGet($companyId, $filter, $top, $skip, $orderBy)
        path = '/api/v2/companies/#{companyId}/filingcalendars';
        get (path)
      end


      # Retrieve all filing requests for this company
      # 
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # 
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def apiV2CompaniesByCompanyIdFilingrequestsGet($companyId, $filter, $top, $skip, $orderBy)
        path = '/api/v2/companies/#{companyId}/filingrequests';
        get (path)
      end


      # Returns a list of options for adding the specified form.
      # 
      # This API is available by invitation only.
      # 
      # @param string $formCode The unique code of the form
      # @return CycleAddOptionModel[]
      def cycleSafeAdd($companyId, $formCode)
        path = '/api/v2/companies/#{companyId}/filingcalendars/add/options';
        get (path)
      end


      # Indicates when changes are allowed to be made to a filing calendar.
      # 
      # This API is available by invitation only.
      # 
     * @param FilingCalendarEditModel[] $model A list of filing calendar edits to be made
      # @return CycleEditOptionModel
      def cycleSafeEdit($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/filingcalendars/#{id}/edit/options';
        post (path)
      end


      # Returns a list of options for expiring a filing calendar
      # 
      # This API is available by invitation only.
      # 
      # @return CycleExpireModel
      def cycleSafeExpiration($companyId, $id)
        path = '/api/v2/companies/#{companyId}/filingcalendars/#{id}/cancel/options';
        get (path)
      end


      # Retrieve a single filing request
      # 
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # 
      # @return FilingRequestModel
      def filingRequests($companyId, $id)
        path = '/api/v2/companies/#{companyId}/filingrequests/#{id}';
        get (path)
      end


      # Create a new filing request to create a filing calendar
      # 
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # 
     * @param FilingRequestModel[] $model Information about the proposed new filing calendar
      # @return FilingRequestModel
      def filingRequestsAdd($companyId, $model)
        path = '/api/v2/companies/#{companyId}/filingcalendars/add/request';
        post (path)
      end


      # Approve existing Filing Request
      # 
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # The filing request must be in the "ChangeRequest" status to be approved.
      # 
      # @return FilingRequestModel
      def filingRequestsApprove($companyId, $id)
        path = '/api/v2/companies/#{companyId}/filingrequests/#{id}/approve';
        post (path)
      end


      # Cancel existing Filing Request
      # 
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # 
      # @return FilingRequestModel
      def filingRequestsCancel($companyId, $id)
        path = '/api/v2/companies/#{companyId}/filingrequests/#{id}/cancel';
        post (path)
      end


      # Create a new filing request to cancel a filing calendar
      # 
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # 
     * @param FilingRequestModel[] $model The cancellation request for this filing calendar
      # @return FilingRequestModel
      def filingRequestsNewCancel($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/filingcalendars/#{id}/cancel/request';
        post (path)
      end


      # Create a new filing request to edit a filing calendar
      # 
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # 
     * @param FilingRequestModel[] $model A list of filing calendar edits to be made
      # @return FilingRequestModel
      def filingRequestsNewEdit($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/filingcalendars/#{id}/edit/request';
        post (path)
      end


      # Edit existing Filing Request
      # 
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # 
     * @param FilingRequestModel $model A list of filing calendar edits to be made
      # @return FilingRequestModel
      def filingRequestsUpdate($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/filingrequests/#{id}';
        put (path)
      end


      # Gets the request status and Login Result
      # 
      # This API is available by invitation only.
      # 
      # @return LoginVerificationOutputModel
      def loginVerificationGet($jobId)
        path = '/api/v2/filingcalendars/credentials/#{jobId}';
        get (path)
      end


      # New request for getting for validating customer's login credentials
      # 
      # This API is available by invitation only.
      # 
     * @param LoginVerificationInputModel $model The model of the login information we are verifying
      # @return LoginVerificationOutputModel
      def loginVerificationPost($model)
        path = '/api/v2/filingcalendars/credentials/verify';
        post (path)
      end


      # Retrieve all filing calendars
      # 
      # This API is available by invitation only.
      # 
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def queryFilingCalendars($filter, $top, $skip, $orderBy)
        path = '/api/v2/filingcalendars';
        get (path)
      end


      # Retrieve all filing requests
      # 
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # 
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # 
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def queryFilingRequests($filter, $top, $skip, $orderBy)
        path = '/api/v2/filingrequests';
        get (path)
      end

    end
  end
end