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
     * @param ApproveFilingsModel $model The approve request you wish to execute.
      # @return FilingModel[]
      def approveFilings($companyId, $year, $month, $model)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/approve';
        post (path)
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
     * @param ApproveFilingsModel $model The approve request you wish to execute.
      # @return FilingModel[]
      def approveFilingsCountry($companyId, $year, $month, $country, $model)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/approve';
        post (path)
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
     * @param ApproveFilingsModel $model The approve request you wish to execute.
      # @return FilingModel[]
      def approveFilingsCountryRegion($companyId, $year, $month, $country, $region, $model)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/approve';
        post (path)
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
     * @param FilingAdjustmentModel[] $model A list of Adjustments to be created for the specified filing.
      # @return FilingAdjustmentModel[]
      def createReturnAdjustment($companyId, $year, $month, $country, $region, $formCode, $model)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/#{formCode}/adjust';
        post (path)
      end


      # Add an augmentation for a given filing.
      # 
      # This API is available by invitation only.
      # An "Augmentation" is a manually added increase or decrease in tax liability, by either customer or Avalara 
      # usually due to customer wanting to report tax Avatax does not support, e.g. bad debts, rental tax.
      # This API creates a new augmentation for an existing tax filing.
      # This API can only be used when the filing has not been approved.
      # 
     * @param FilingAugmentationModel[] $model A list of augmentations to be created for the specified filing.
      # @return FilingAugmentationModel[]
      def createReturnAugmentation($companyId, $year, $month, $country, $region, $formCode, $model)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/#{formCode}/augment';
        post (path)
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
      # @return ErrorDetail[]
      def deleteReturnAdjustment($companyId, $id)
        path = '/api/v2/companies/#{companyId}/filings/adjust/#{id}';
        delete (path)
      end


      # Delete an augmentation for a given filing.
      # 
      # This API is available by invitation only.
      # An "Augmentation" is a manually added increase or decrease in tax liability, by either customer or Avalara 
      # usually due to customer wanting to report tax Avatax does not support, e.g. bad debts, rental tax.
      # This API deletes an augmentation for an existing tax filing.
      # This API can only be used when the filing has been unapproved.
      # 
      # @return ErrorDetail[]
      def deleteReturnAugmentation($companyId, $id)
        path = '/api/v2/companies/#{companyId}/filings/augment/#{id}';
        delete (path)
      end


      # Retrieve worksheet checkup report for company and filing period.
      # 
      # This API is available by invitation only.
      # 
      # @return FilingsCheckupModel
      def filingsCheckupReport($worksheetId, $companyId)
        path = '/api/v2/companies/#{companyId}/filings/#{worksheetId}/checkup';
        get (path)
      end


      # Retrieve worksheet checkup report for company and filing period.
      # 
      # This API is available by invitation only.
      # 
      # @return FilingsCheckupModel
      def filingsCheckupReports($companyId, $year, $month)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/checkup';
        get (path)
      end


      # Retrieve a single attachment for a filing
      # 
      # This API is available by invitation only.
      # 
      # @return FileResult
      def getFilingAttachment($companyId, $filingId)
        path = '/api/v2/companies/#{companyId}/filings/#{filingId}/attachment';
        get (path)
      end


      # Retrieve a list of filings for the specified company in the year and month of a given filing period.
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @return FileResult
      def getFilingAttachments($companyId, $year, $month)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/attachments';
        get (path)
      end


      # Retrieve a single trace file for a company filing period
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @return FileResult
      def getFilingAttachmentsTraceFile($companyId, $year, $month)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/attachments/tracefile';
        get (path)
      end


      # Retrieve a list of filings for the specified company in the year and month of a given filing period.
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @return FetchResult
      def getFilings($companyId, $year, $month)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}';
        get (path)
      end


      # Retrieve a list of filings for the specified company in the given filing period and country.
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @return FetchResult
      def getFilingsByCountry($companyId, $year, $month, $country)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}';
        get (path)
      end


      # Retrieve a list of filings for the specified company in the filing period, country and region.
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @return FetchResult
      def getFilingsByCountryRegion($companyId, $year, $month, $country, $region)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}';
        get (path)
      end


      # Retrieve a list of filings for the specified company in the given filing period, country, region and form.
      # 
      # This API is available by invitation only.
      # A "filing period" is the year and month of the date of the latest customer transaction allowed to be reported on a filing, 
      # based on filing frequency of filing.
      # 
      # @return FetchResult
      def getFilingsByReturnName($companyId, $year, $month, $country, $region, $formCode)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/#{formCode}';
        get (path)
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
     * @param RebuildFilingsModel $model The rebuild request you wish to execute.
      # @return FetchResult
      def rebuildFilings($companyId, $year, $month, $model)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/rebuild';
        post (path)
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
     * @param RebuildFilingsModel $model The rebuild request you wish to execute.
      # @return FetchResult
      def rebuildFilingsByCountry($companyId, $year, $month, $country, $model)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/rebuild';
        post (path)
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
     * @param RebuildFilingsModel $model The rebuild request you wish to execute.
      # @return FetchResult
      def rebuildFilingsByCountryRegion($companyId, $year, $month, $country, $region, $model)
        path = '/api/v2/companies/#{companyId}/filings/#{year}/#{month}/#{country}/#{region}/rebuild';
        post (path)
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
     * @param FilingAdjustmentModel $model The updated Adjustment.
      # @return FilingAdjustmentModel
      def updateReturnAdjustment($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/filings/adjust/#{id}';
        put (path)
      end


      # Edit an augmentation for a given filing.
      # 
      # This API is available by invitation only.
      # An "Augmentation" is a manually added increase or decrease in tax liability, by either customer or Avalara 
      # usually due to customer wanting to report tax Avatax does not support, e.g. bad debts, rental tax.
      # This API modifies an augmentation for an existing tax filing.
      # This API can only be used when the filing has not been approved.
      # 
     * @param FilingAugmentationModel $model The updated Augmentation.
      # @return FilingModel
      def updateReturnAugmentation($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/filings/augment/#{id}';
        put (path)
      end

    end
  end
end