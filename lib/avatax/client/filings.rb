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
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period to approve.
      # @param int month The month of the filing period to approve.
      # @param ApproveFilingsModel model The approve request you wish to execute.
      # @return FilingModel[]
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
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period to approve.
      # @param int month The month of the filing period to approve.
      # @param string country The two-character ISO-3166 code for the country.
      # @param ApproveFilingsModel model The approve request you wish to execute.
      # @return FilingModel[]
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
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period to approve.
      # @param int month The month of the filing period to approve.
      # @param string country The two-character ISO-3166 code for the country.
      # @param string region The two or three character region code for the region.
      # @param ApproveFilingsModel model The approve request you wish to execute.
      # @return FilingModel[]
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
      # 
      # @param int companyId The ID of the company that owns the filing being adjusted.
      # @param int year The year of the filing's filing period being adjusted.
      # @param int month The month of the filing's filing period being adjusted.
      # @param string country The two-character ISO-3166 code for the country of the filing being adjusted.
      # @param string region The two or three character region code for the region.
      # @param string formCode The unique code of the form being adjusted.
      # @param FilingAdjustmentModel[] model A list of Adjustments to be created for the specified filing.
      # @return FilingAdjustmentModel[]
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
      # 
      # @param int companyId The ID of the company that owns the filing being changed.
      # @param int year The month of the filing's filing period being changed.
      # @param int month The month of the filing's filing period being changed.
      # @param string country The two-character ISO-3166 code for the country of the filing being changed.
      # @param string region The two or three character region code for the region of the filing being changed.
      # @param string formCode The unique code of the form being changed.
      # @param FilingAugmentationModel[] model A list of augmentations to be created for the specified filing.
      # @return FilingAugmentationModel[]
      def create_return_augmentation(companyId, year, month, country, region, formCode, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/#{formCode}/augment"
        
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
      # 
      # @param int companyId The ID of the company that owns the filing being adjusted.
      # @param int id The ID of the adjustment being deleted.
      # @return ErrorDetail[]
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
      # 
      # @param int companyId The ID of the company that owns the filing being changed.
      # @param int id The ID of the augmentation being added.
      # @return ErrorDetail[]
      def delete_return_augmentation(companyId, id)
        path = "/api/v2/companies/#{companyId}/filings/augment/#{id}"
        
        delete(path)
      end


      # Retrieve worksheet checkup report for company and filing period.
      # 
      # This API is available by invitation only.
      # 
      # @param int worksheetId The unique id of the worksheet.
      # @param int companyId The unique ID of the company that owns the worksheet.
      # @return FilingsCheckupModel
      def filings_checkup_report(worksheetId, companyId)
        path = "/api/v2/companies/#{companyId}/filings/#{worksheetId}/checkup"
        
        get(path)
      end


      # Retrieve worksheet checkup report for company and filing period.
      # 
      # This API is available by invitation only.
      # 
      # @param int companyId The unique ID of the company that owns the worksheets object.
      # @param int year The year of the filing period.
      # @param int month The month of the filing period.
      # @return FilingsCheckupModel
      def filings_checkup_reports(companyId, year, month)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/checkup"
        
        get(path)
      end


      # Retrieve a single attachment for a filing
      # 
      # This API is available by invitation only.
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int filingId The unique id of the worksheet return.
      # @param int fileId The unique id of the document you are downloading
      # @return FileResult
      def get_filing_attachment(companyId, filingId, options={})
        path = "/api/v2/companies/#{companyId}/filings/#{filingId}/attachment"
        
        get(path, options)
      end


      # Retrieve a list of filings for the specified company in the year and month of a given filing period.
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period.
      # @param int month The two digit month of the filing period.
      # @return FileResult
      def get_filing_attachments(companyId, year, month)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/attachments"
        
        get(path)
      end


      # Retrieve a single trace file for a company filing period
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period.
      # @param int month The two digit month of the filing period.
      # @return FileResult
      def get_filing_attachments_trace_file(companyId, year, month)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/attachments/tracefile"
        
        get(path)
      end


      # Retrieve a list of filings for the specified company in the year and month of a given filing period.
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period.
      # @param int month The two digit month of the filing period.
      # @return FetchResult
      def get_filings(companyId, year, month)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}"
        
        get(path)
      end


      # Retrieve a list of filings for the specified company in the given filing period and country.
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period.
      # @param int month The two digit month of the filing period.
      # @param string country The two-character ISO-3166 code for the country.
      # @return FetchResult
      def get_filings_by_country(companyId, year, month, country)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}"
        
        get(path)
      end


      # Retrieve a list of filings for the specified company in the filing period, country and region.
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period.
      # @param int month The two digit month of the filing period.
      # @param string country The two-character ISO-3166 code for the country.
      # @param string region The two or three character region code for the region.
      # @return FetchResult
      def get_filings_by_country_region(companyId, year, month, country, region)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}"
        
        get(path)
      end


      # Retrieve a list of filings for the specified company in the given filing period, country, region and form.
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period.
      # @param int month The two digit month of the filing period.
      # @param string country The two-character ISO-3166 code for the country.
      # @param string region The two or three character region code for the region.
      # @param string formCode The unique code of the form.
      # @return FetchResult
      def get_filings_by_return_name(companyId, year, month, country, region, formCode)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/#{formCode}"
        
        get(path)
      end


      # Rebuild a set of filings for the specified company in the given filing period.
      # 
      # This API is available by invitation only.
      # Rebuilding a return means re-creating or updating the amounts to be filed (worksheet) for a filing.
      # Rebuilding has to be done whenever a customer adds transactions to a filing.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # This API requires filing to be unapproved.
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period to be rebuilt.
      # @param int month The month of the filing period to be rebuilt.
      # @param RebuildFilingsModel model The rebuild request you wish to execute.
      # @return FetchResult
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
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period to be rebuilt.
      # @param int month The month of the filing period to be rebuilt.
      # @param string country The two-character ISO-3166 code for the country.
      # @param RebuildFilingsModel model The rebuild request you wish to execute.
      # @return FetchResult
      def rebuild_filings_by_country(companyId, year, month, country, model)
        path = "/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/rebuild"
        
        post(path, model)
      end


      # Rebuild a set of filings for the specified company in the given filing period, country and region.
      # 
      # This API is available by invitation only.
      # Rebuilding a return means re-creating or updating the amounts to be filed for a filing.
      # Rebuilding has to be done whenever a customer adds transactions to a filing. 
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # This API requires filing to be unapproved.
      # 
      # @param int companyId The ID of the company that owns the filings.
      # @param int year The year of the filing period to be rebuilt.
      # @param int month The month of the filing period to be rebuilt.
      # @param string country The two-character ISO-3166 code for the country.
      # @param string region The two or three character region code for the region.
      # @param RebuildFilingsModel model The rebuild request you wish to execute.
      # @return FetchResult
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
      # 
      # @param int companyId The ID of the company that owns the filing being adjusted.
      # @param int id The ID of the adjustment being edited.
      # @param FilingAdjustmentModel model The updated Adjustment.
      # @return FilingAdjustmentModel
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
      # 
      # @param int companyId The ID of the company that owns the filing being changed.
      # @param int id The ID of the augmentation being edited.
      # @param FilingAugmentationModel model The updated Augmentation.
      # @return FilingModel
      def update_return_augmentation(companyId, id, model)
        path = "/api/v2/companies/#{companyId}/filings/augment/#{id}"
        
        put(path, model)
      end

    end
  end
end