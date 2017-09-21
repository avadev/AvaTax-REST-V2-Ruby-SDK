module AvaTax
  class Client
    module FilingCalendars 


      # Approve existing Filing Request
      #
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # The filing request must be in the "ChangeRequest" status to be approved.
      # @param companyId [Integer] The unique ID of the company that owns the filing request object
      # @param id [Integer] The unique ID of the filing request object
      # @return [Object]
      def approve_filing_request(companyId, id)
        path = "/api/v2/companies/#{companyId}/filingrequests/#{id}/approve"
        post(path)
      end


      # Cancel existing Filing Request
      #
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # @param companyId [Integer] The unique ID of the company that owns the filing request object
      # @param id [Integer] The unique ID of the filing request object
      # @return [Object]
      def cancel_filing_request(companyId, id)
        path = "/api/v2/companies/#{companyId}/filingrequests/#{id}/cancel"
        post(path)
      end


      # Create a new filing request to cancel a filing calendar
      #
      # This API is available by invitation only.
      #
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # @param companyId [Integer] The unique ID of the company that owns the filing calendar object
      # @param id [Integer] The unique ID number of the filing calendar to cancel
      # @param model [FilingRequestModel[]] The cancellation request for this filing calendar
      # @return [Object]
      def cancel_filing_requests(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/filingcalendars/#{id}/cancel/request"
        post(path, model)
      end


      # Create a new filing request to create a filing calendar
      #
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # @param companyId [Integer] The unique ID of the company that will add the new filing calendar
      # @param model [FilingRequestModel[]] Information about the proposed new filing calendar
      # @return [Object]
      def create_filing_requests(companyId, model)
        path = "/api/v2/companies/#{companyId}/filingcalendars/add/request"
        post(path, model)
      end


      # Returns a list of options for adding the specified form.
      #
      # This API is available by invitation only.
      # @param companyId [Integer] The unique ID of the company that owns the filing calendar object
      # @param formCode [String] The unique code of the form
      # @return [CycleAddOptionModel[]]
      def cycle_safe_add(companyId, options={})
        path = "/api/v2/companies/#{companyId}/filingcalendars/add/options"
        get(path, options)
      end


      # Indicates when changes are allowed to be made to a filing calendar.
      #
      # This API is available by invitation only.
      # @param companyId [Integer] The unique ID of the company that owns the filing calendar object
      # @param id [Integer] The unique ID of the filing calendar object
      # @param model [FilingCalendarEditModel[]] A list of filing calendar edits to be made
      # @return [Object]
      def cycle_safe_edit(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/filingcalendars/#{id}/edit/options"
        post(path, model)
      end


      # Returns a list of options for expiring a filing calendar
      #
      # This API is available by invitation only.
      # @param companyId [Integer] The unique ID of the company that owns the filing calendar object
      # @param id [Integer] The unique ID of the filing calendar object
      # @return [Object]
      def cycle_safe_expiration(companyId, id)
        path = "/api/v2/companies/#{companyId}/filingcalendars/#{id}/cancel/options"
        get(path)
      end


      # Delete a single filing calendar.
      #
      # This API is available by invitation only.
      # Mark the existing notice object at this URL as deleted.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # @param companyId [Integer] The ID of the company that owns this filing calendar.
      # @param id [Integer] The ID of the filing calendar you wish to delete.
      # @return [ErrorDetail[]]
      def delete_filing_calendar(companyId, id)
        path = "/api/v2/companies/#{companyId}/filingcalendars/#{id}"
        delete(path)
      end


      # Retrieve a single filing calendar
      #
      # This API is available by invitation only.
      # @param companyId [Integer] The ID of the company that owns this filing calendar
      # @param id [Integer] The primary key of this filing calendar
      # @return [Object]
      def get_filing_calendar(companyId, id)
        path = "/api/v2/companies/#{companyId}/filingcalendars/#{id}"
        get(path)
      end


      # Retrieve a single filing request
      #
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # @param companyId [Integer] The ID of the company that owns this filing calendar
      # @param id [Integer] The primary key of this filing calendar
      # @return [Object]
      def get_filing_request(companyId, id)
        path = "/api/v2/companies/#{companyId}/filingrequests/#{id}"
        get(path)
      end


      # Retrieve all filing calendars for this company
      #
      # This API is available by invitation only.
      # @param companyId [Integer] The ID of the company that owns these batches
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param returnCountry [String] A comma separated list of countries
      # @param returnRegion [String] A comma separated list of regions
      # @return [FetchResult]
      def list_filing_calendars(companyId, options={})
        path = "/api/v2/companies/#{companyId}/filingcalendars"
        get(path, options)
      end


      # Retrieve all filing requests for this company
      #
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # @param companyId [Integer] The ID of the company that owns these batches
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_filing_requests(companyId, options={})
        path = "/api/v2/companies/#{companyId}/filingrequests"
        get(path, options)
      end


      # New request for getting for validating customer's login credentials
      #
      # This API is available by invitation only.
      #
      # This API verifies that a customer has submitted correct login credentials for a tax authority's online filing system.
      # @param model [Object] The model of the login information we are verifying
      # @return [Object]
      def login_verification_request(model)
        path = "/api/v2/filingcalendars/credentials/verify"
        post(path, model)
      end


      # Gets the request status and Login Result
      #
      # This API is available by invitation only.
      #
      # This API checks the status of a login verification request. It may only be called by authorized users from the account
      # that initially requested the login verification.
      # @param jobId [Integer] The unique ID number of this login request
      # @return [Object]
      def login_verification_status(jobId)
        path = "/api/v2/filingcalendars/credentials/#{jobId}"
        get(path)
      end


      # Retrieve all filing calendars
      #
      # This API is available by invitation only.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @param returnCountry [String] If specified, fetches only filing calendars that apply to tax filings in this specific country. Uses ISO 3166 country codes.
      # @param returnRegion [String] If specified, fetches only filing calendars that apply to tax filings in this specific region. Uses ISO 3166 region codes.
      # @return [FetchResult]
      def query_filing_calendars(options={})
        path = "/api/v2/filingcalendars"
        get(path, options)
      end


      # Retrieve all filing requests
      #
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      #
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param top [Integer] If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_filing_requests(options={})
        path = "/api/v2/filingrequests"
        get(path, options)
      end


      # Create a new filing request to edit a filing calendar
      #
      # This API is available by invitation only.
      #
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      #
      # Certain users may not update filing calendars directly. Instead, they may submit an edit request
      # to modify the value of a filing calendar using this API.
      # @param companyId [Integer] The unique ID of the company that owns the filing calendar object
      # @param id [Integer] The unique ID number of the filing calendar to edit
      # @param model [FilingRequestModel[]] A list of filing calendar edits to be made
      # @return [Object]
      def request_filing_calendar_update(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/filingcalendars/#{id}/edit/request"
        post(path, model)
      end


      # Edit existing Filing Calendar's Notes
      #
      # This API is available by invitation only.
      # This API only allows updating of internal notes and company filing instructions.
      # All other updates must go through a filing request at this time.
      # @param companyId [Integer] The unique ID of the company that owns the filing request object
      # @param id [Integer] The unique ID of the filing calendar object
      # @param model [Object] The filing calendar model you are wishing to update with.
      # @return [Object]
      def update_filing_calendar(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/filingcalendars/#{id}"
        put(path, model)
      end


      # Edit existing Filing Request
      #
      # This API is available by invitation only.
      # A "filing request" represents a request to change an existing filing calendar. Filing requests
      # are reviewed and validated by Avalara Compliance before being implemented.
      # @param companyId [Integer] The unique ID of the company that owns the filing request object
      # @param id [Integer] The unique ID of the filing request object
      # @param model [Object] A list of filing calendar edits to be made
      # @return [Object]
      def update_filing_request(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/filingrequests/#{id}"
        put(path, model)
      end

    end
  end
end