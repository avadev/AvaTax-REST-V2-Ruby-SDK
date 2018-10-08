module AvaTax
  class Client
    module Filings 


      # Approve all filings for the specified company in the given filing period.
      #
      # This API is available by invitation only.
      # Approving a return means the customer is ready to let Avalara file that return.
      # Customer either approves themselves from admin console,
      # else system auto-approves the night before the filing cycle.
      # Sometimes Compliance has to manually unapprove and reapprove to modify liability or filing for the customer.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period to approve.
      # @param month [Integer] The month of the filing period to approve.
      # @param model [Object] The approve request you wish to execute.
      # @return [FilingModel[]]
      def approve_filings(companyId, year, month, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/approve"
        post(path, model)
      end


      # Approve all filings for the specified company in the given filing period and country.
      #
      # This API is available by invitation only.
      # Approving a return means the customer is ready to let Avalara file that return.
      # Customer either approves themselves from admin console,
      # else system auto-approves the night before the filing cycle.
      # Sometimes Compliance has to manually unapprove and reapprove to modify liability or filing for the customer.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period to approve.
      # @param month [Integer] The month of the filing period to approve.
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param model [Object] The approve request you wish to execute.
      # @return [FilingModel[]]
      def approve_filings_country(companyId, year, month, country, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/approve"
        post(path, model)
      end


      # Approve all filings for the specified company in the given filing period, country and region.
      #
      # This API is available by invitation only.
      # Approving a return means the customer is ready to let Avalara file that return.
      # Customer either approves themselves from admin console,
      # else system auto-approves the night before the filing cycle
      # Sometimes Compliance has to manually unapprove and reapprove to modify liability or filing for the customer.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period to approve.
      # @param month [Integer] The month of the filing period to approve.
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param region [String] The two or three character region code for the region.
      # @param model [Object] The approve request you wish to execute.
      # @return [FilingModel[]]
      def approve_filings_country_region(companyId, year, month, country, region, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/approve"
        post(path, model)
      end


      # Add an adjustment to a given filing.
      #
      # This API is available by invitation only.
      # An "Adjustment" is usually an increase or decrease to customer funding to Avalara,
      # such as early filer discount amounts that are refunded to the customer, or efile fees from websites.
      # Sometimes may be a manual change in tax liability similar to an augmentation.
      # This API creates a new adjustment for an existing tax filing.
      # This API can only be used when the filing has not yet been approved.
      # @param companyId [Integer] The ID of the company that owns the filing being adjusted.
      # @param year [Integer] The year of the filing's filing period being adjusted.
      # @param month [Integer] The month of the filing's filing period being adjusted.
      # @param country [String] The two-character ISO-3166 code for the country of the filing being adjusted.
      # @param region [String] The two or three character region code for the region.
      # @param formCode [String] The unique code of the form being adjusted.
      # @param model [FilingAdjustmentModel[]] A list of Adjustments to be created for the specified filing.
      # @return [FilingAdjustmentModel[]]
      def create_return_adjustment(companyId, year, month, country, region, formCode, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/#{formCode}/adjust"
        post(path, model)
      end


      # Add an augmentation for a given filing.
      #
      # This API is available by invitation only.
      # An "Augmentation" is a manually added increase or decrease in tax liability, by either customer or Avalara
      # usually due to customer wanting to report tax Avatax does not support, e.g. bad debts, rental tax.
      # This API creates a new augmentation for an existing tax filing.
      # This API can only be used when the filing has not been approved.
      # @param companyId [Integer] The ID of the company that owns the filing being changed.
      # @param year [Integer] The month of the filing's filing period being changed.
      # @param month [Integer] The month of the filing's filing period being changed.
      # @param country [String] The two-character ISO-3166 code for the country of the filing being changed.
      # @param region [String] The two or three character region code for the region of the filing being changed.
      # @param formCode [String] The unique code of the form being changed.
      # @param model [FilingAugmentationModel[]] A list of augmentations to be created for the specified filing.
      # @return [FilingAugmentationModel[]]
      def create_return_augmentation(companyId, year, month, country, region, formCode, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/#{formCode}/augment"
        post(path, model)
      end


      # Add an payment to a given filing.
      #
      # This API is available by invitation only.
      # An "Payment" is usually an increase or decrease to customer funding to Avalara,
      # such as early filer discount amounts that are refunded to the customer, or efile fees from websites.
      # Sometimes may be a manual change in tax liability similar to an augmentation.
      # This API creates a new payment for an existing tax filing.
      # This API can only be used when the filing has not yet been approved.
      # @param companyId [Integer] The ID of the company that owns the filing being adjusted.
      # @param year [Integer] The year of the filing's filing period being adjusted.
      # @param month [Integer] The month of the filing's filing period being adjusted.
      # @param country [String] The two-character ISO-3166 code for the country of the filing being adjusted.
      # @param region [String] The two or three character region code for the region.
      # @param formCode [String] The unique code of the form being adjusted.
      # @param model [FilingPaymentModel[]] A list of Payments to be created for the specified filing.
      # @return [FilingPaymentModel[]]
      def create_return_payment(companyId, year, month, country, region, formCode, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/#{formCode}/payment"
        post(path, model)
      end


      # Delete an adjustment for a given filing.
      #
      # This API is available by invitation only.
      # An "Adjustment" is usually an increase or decrease to customer funding to Avalara,
      # such as early filer discount amounts that are refunded to the customer, or efile fees from websites.
      # Sometimes may be a manual change in tax liability similar to an augmentation.
      # This API deletes an adjustment for an existing tax filing.
      # This API can only be used when the filing has been unapproved.
      # @param companyId [Integer] The ID of the company that owns the filing being adjusted.
      # @param id [Integer] The ID of the adjustment being deleted.
      # @return [ErrorDetail[]]
      def delete_return_adjustment(companyId, id)
        path = "/api/v2/companies/#{companyId}/filings/adjust/#{id}"
        delete(path)
      end


      # Delete an augmentation for a given filing.
      #
      # This API is available by invitation only.
      # An "Augmentation" is a manually added increase or decrease in tax liability, by either customer or Avalara
      # usually due to customer wanting to report tax Avatax does not support, e.g. bad debts, rental tax.
      # This API deletes an augmentation for an existing tax filing.
      # This API can only be used when the filing has been unapproved.
      # @param companyId [Integer] The ID of the company that owns the filing being changed.
      # @param id [Integer] The ID of the augmentation being added.
      # @return [ErrorDetail[]]
      def delete_return_augmentation(companyId, id)
        path = "/api/v2/companies/#{companyId}/filings/augment/#{id}"
        delete(path)
      end


      # Delete an payment for a given filing.
      #
      # This API is available by invitation only.
      # An "Payment" is usually an increase or decrease to customer funding to Avalara,
      # such as early filer discount amounts that are refunded to the customer, or efile fees from websites.
      # Sometimes may be a manual change in tax liability similar to an augmentation.
      # This API deletes an payment for an existing tax filing.
      # This API can only be used when the filing has been unapproved.
      # @param companyId [Integer] The ID of the company that owns the filing being adjusted.
      # @param id [Integer] The ID of the payment being deleted.
      # @return [ErrorDetail[]]
      def delete_return_payment(companyId, id)
        path = "/api/v2/companies/#{companyId}/filings/payment/#{id}"
        delete(path)
      end


      # Retrieve worksheet checkup report for company and filing period.
      #
      # This API is available by invitation only.
      # @param filingsId [Integer] The unique id of the worksheet.
      # @param companyId [Integer] The unique ID of the company that owns the worksheet.
      # @return [Object]
      def filings_checkup_report(filingsId, companyId)
        path = "/api/v2/companies/#{companyId}/filings/#{filingsId}/checkup"
        get(path)
      end


      # Retrieve worksheet checkup report for company and filing period.
      #
      # This API is available by invitation only.
      # @param companyId [Integer] The unique ID of the company that owns the worksheets object.
      # @param year [Integer] The year of the filing period.
      # @param month [Integer] The month of the filing period.
      # @return [Object]
      def filings_checkup_reports(companyId, year, month)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/checkup"
        get(path)
      end


      # Retrieve a single attachment for a filing
      #
      # This API is available by invitation only.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param filingReturnId [Integer] The unique id of the worksheet return.
      # @param fileId [Integer] The unique id of the document you are downloading
      # @return [Object]
      def get_filing_attachment(companyId, filingReturnId, options={})
        path = "/api/v2/companies/#{companyId}/filings/#{filingReturnId}/attachment"
        get(path, options)
      end


      # Retrieve a list of filings for the specified company in the year and month of a given filing period.
      #
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period.
      # @param month [Integer] The two digit month of the filing period.
      # @return [Object]
      def get_filing_attachments(companyId, year, month)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/attachments"
        get(path)
      end


      # Retrieve a single trace file for a company filing period
      #
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period.
      # @param month [Integer] The two digit month of the filing period.
      # @return [Object]
      def get_filing_attachments_trace_file(companyId, year, month)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/attachments/tracefile"
        get(path)
      end


      # Retrieve a filing for the specified company and id.
      #
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param id [Integer] The id of the filing return your retrieving
      # @param details [Boolean] Indicates if you would like the credit details returned
      # @return [FetchResult]
      def get_filing_return(companyId, id, options={})
        path = "/api/v2/companies/#{companyId}/filings/returns/#{id}"
        get(path, options)
      end


      # Retrieve a list of filings for the specified company in the year and month of a given filing period.
      #
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period.
      # @param month [Integer] The two digit month of the filing period.
      # @return [FetchResult]
      def get_filings(companyId, year, month)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}"
        get(path)
      end


      # Retrieve a list of filings for the specified company in the given filing period and country.
      #
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period.
      # @param month [Integer] The two digit month of the filing period.
      # @param country [String] The two-character ISO-3166 code for the country.
      # @return [FetchResult]
      def get_filings_by_country(companyId, year, month, country)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}"
        get(path)
      end


      # Retrieve a list of filings for the specified company in the filing period, country and region.
      #
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period.
      # @param month [Integer] The two digit month of the filing period.
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param region [String] The two or three character region code for the region.
      # @return [FetchResult]
      def get_filings_by_country_region(companyId, year, month, country, region)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}"
        get(path)
      end


      # Retrieve a list of filings for the specified company in the given filing period, country, region and form.
      #
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period.
      # @param month [Integer] The two digit month of the filing period.
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param region [String] The two or three character region code for the region.
      # @param formCode [String] The unique code of the form.
      # @return [FetchResult]
      def get_filings_by_return_name(companyId, year, month, country, region, formCode)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/#{formCode}"
        get(path)
      end


      # Retrieve a list of filings for the specified company in the year and month of a given filing period.
      # This gets the basic information from the filings and doesn't include anything extra.
      #
      # 
      # @param companyId [Integer] The ID of the company that owns these batches
      # @param endPeriodMonth [Integer] The month of the period you are trying to retrieve
      # @param endPeriodYear [Integer] The year of the period you are trying to retrieve
      # @param frequency [String] The frequency of the return you are trying to retrieve (See FilingFrequencyId::* for a list of allowable values)
      # @param status [String] The status of the return(s) you are trying to retrieve (See FilingStatusId::* for a list of allowable values)
      # @param country [String] The country of the return(s) you are trying to retrieve
      # @param region [String] The region of the return(s) you are trying to retrieve
      # @param filingCalendarId [Integer] The filing calendar id of the return you are trying to retrieve
      # @return [FetchResult]
      def get_filings_returns(companyId, options={})
        path = "/api/v2/companies/#{companyId}/filings/returns"
        get(path, options)
      end


      # Rebuild a set of filings for the specified company in the given filing period.
      #
      # This API is available by invitation only.
      # Rebuilding a return means re-creating or updating the amounts to be filed (worksheet) for a filing.
      # Rebuilding has to be done whenever a customer adds transactions to a filing.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # This API requires filing to be unapproved.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period to be rebuilt.
      # @param month [Integer] The month of the filing period to be rebuilt.
      # @param model [Object] The rebuild request you wish to execute.
      # @return [FetchResult]
      def rebuild_filings(companyId, year, month, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/rebuild"
        post(path, model)
      end


      # Rebuild a set of filings for the specified company in the given filing period and country.
      #
      # This API is available by invitation only.
      # Rebuilding a return means re-creating or updating the amounts to be filed (worksheet) for a filing.
      # Rebuilding has to be done whenever a customer adds transactions to a filing.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # This API requires filing to be unapproved.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period to be rebuilt.
      # @param month [Integer] The month of the filing period to be rebuilt.
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param model [Object] The rebuild request you wish to execute.
      # @return [FetchResult]
      def rebuild_filings_by_country(companyId, year, month, country, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/rebuild"
        post(path, model)
      end


      # Rebuild a set of filings for the specified company in the given filing period, country and region.
      #
      # This API is available by invitation only.audit.CheckAuthorizationReturns(null, companyId);
      # Rebuilding a return means re-creating or updating the amounts to be filed for a filing.
      # Rebuilding has to be done whenever a customer adds transactions to a filing.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing,
      # based on filing frequency of filing.
      # This API requires filing to be unapproved.
      # @param companyId [Integer] The ID of the company that owns the filings.
      # @param year [Integer] The year of the filing period to be rebuilt.
      # @param month [Integer] The month of the filing period to be rebuilt.
      # @param country [String] The two-character ISO-3166 code for the country.
      # @param region [String] The two or three character region code for the region.
      # @param model [Object] The rebuild request you wish to execute.
      # @return [FetchResult]
      def rebuild_filings_by_country_region(companyId, year, month, country, region, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/rebuild"
        post(path, model)
      end


      # Edit an adjustment for a given filing.
      #
      # This API is available by invitation only.
      # An "Adjustment" is usually an increase or decrease to customer funding to Avalara,
      # such as early filer discount amounts that are refunded to the customer, or efile fees from websites.
      # Sometimes may be a manual change in tax liability similar to an augmentation.
      # This API modifies an adjustment for an existing tax filing.
      # This API can only be used when the filing has not yet been approved.
      # @param companyId [Integer] The ID of the company that owns the filing being adjusted.
      # @param id [Integer] The ID of the adjustment being edited.
      # @param model [Object] The updated Adjustment.
      # @return [Object]
      def update_return_adjustment(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/filings/adjust/#{id}"
        put(path, model)
      end


      # Edit an augmentation for a given filing.
      #
      # This API is available by invitation only.
      # An "Augmentation" is a manually added increase or decrease in tax liability, by either customer or Avalara
      # usually due to customer wanting to report tax Avatax does not support, e.g. bad debts, rental tax.
      # This API modifies an augmentation for an existing tax filing.
      # This API can only be used when the filing has not been approved.
      # @param companyId [Integer] The ID of the company that owns the filing being changed.
      # @param id [Integer] The ID of the augmentation being edited.
      # @param model [Object] The updated Augmentation.
      # @return [Object]
      def update_return_augmentation(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/filings/augment/#{id}"
        put(path, model)
      end


      # Edit an payment for a given filing.
      #
      # This API is available by invitation only.
      # An "Payment" is usually an increase or decrease to customer funding to Avalara,
      # such as early filer discount amounts that are refunded to the customer, or efile fees from websites.
      # Sometimes may be a manual change in tax liability similar to an augmentation.
      # This API modifies an payment for an existing tax filing.
      # This API can only be used when the filing has not yet been approved.
      # @param companyId [Integer] The ID of the company that owns the filing being adjusted.
      # @param id [Integer] The ID of the payment being edited.
      # @param model [Object] The updated Payment.
      # @return [Object]
      def update_return_payment(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/filings/payment/#{id}"
        put(path, model)
      end

    end
  end
end