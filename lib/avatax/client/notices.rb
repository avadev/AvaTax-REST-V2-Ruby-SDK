module AvaTax
  class Client
    module Notices 


      # Create a new notice comment.
      # 
      # This API is available by invitation only.
      # 'Notice comments' are updates by the notice team on the work to be done and that has been done so far on a notice.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $companyId The ID of the company that owns this notice.
      # @param int $id The ID of the tax notice we are adding the comment for.
      # @param NoticeCommentModel[] $model The notice comments you wish to create.
      # @return NoticeCommentModel[]
      def createNoticeComment($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/notices/#{id}/comments';
        post (path)
      end


      # Create a new notice finance details.
      # 
      # This API is available by invitation only.
      # 'Notice finance details' is the categorical breakdown of the total charge levied by the tax authority on our customer,
      # as broken down in our "notice log" found in Workflow. Main examples of the categories are 'Tax Due', 'Interest', 'Penalty', 'Total Abated'.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $companyId The ID of the company that owns this notice.
      # @param int $id The ID of the notice added to the finance details.
      # @param NoticeFinanceModel[] $model The notice finance details you wish to create.
      # @return NoticeFinanceModel[]
      def createNoticeFinanceDetails($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/notices/#{id}/financedetails';
        post (path)
      end


      # Create a new notice responsibility.
      # 
      # This API is available by invitation only.
      # 'Notice comments' are updates by the notice team on the work to be done and that has been done so far on a notice.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $companyId The ID of the company that owns this notice.
      # @param int $id The ID of the tax notice we are adding the responsibility for.
      # @param NoticeResponsibilityDetailModel[] $model The notice responsibilities you wish to create.
      # @return NoticeResponsibilityDetailModel[]
      def createNoticeResponsibilities($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/notices/#{id}/responsibilities';
        post (path)
      end


      # Create a new notice root cause.
      # 
      # This API is available by invitation only.
      # 'Notice root causes' are are those who are responsible for the notice.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $companyId The ID of the company that owns this notice.
      # @param int $id The ID of the tax notice we are adding the responsibility for.
      # @param NoticeRootCauseDetailModel[] $model The notice root causes you wish to create.
      # @return NoticeRootCauseDetailModel[]
      def createNoticeRootCauses($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/notices/#{id}/rootcauses';
        post (path)
      end


      # Create a new notice.
      # 
      # This API is available by invitation only.
      # Create one or more new notice objects.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $companyId The ID of the company that owns this notice.
      # @param NoticeModel[] $model The notice object you wish to create.
      # @return NoticeModel[]
      def createNotices($companyId, $model)
        path = '/api/v2/companies/#{companyId}/notices';
        post (path)
      end


      # Delete a single notice.
      # 
      # This API is available by invitation only.
      # Mark the existing notice object at this URL as deleted.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $companyId The ID of the company that owns this notice.
      # @param int $id The ID of the notice you wish to delete.
      # @return ErrorDetail[]
      def deleteNotice($companyId, $id)
        path = '/api/v2/companies/#{companyId}/notices/#{id}';
        delete (path)
      end


      # Retrieve a single attachment
      # 
      # This API is available by invitation only.
      # Get the file attachment identified by this URL.
      # 
      # @param int $companyId The ID of the company for this attachment.
      # @param int $id The ResourceFileId of the attachment to download.
      # @return FileResult
      def downloadNoticeAttachment($companyId, $id)
        path = '/api/v2/companies/#{companyId}/notices/files/#{id}/attachment';
        get (path)
      end


      # Retrieve a single notice.
      # 
      # This API is available by invitation only.
      # Get the tax notice object identified by this URL.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $companyId The ID of the company for this notice.
      # @param int $id The ID of this notice.
      # @return NoticeModel
      def getNotice($companyId, $id)
        path = '/api/v2/companies/#{companyId}/notices/#{id}';
        get (path)
      end


      # Retrieve notice comments for a specific notice.
      # 
      # This API is available by invitation only.
      # 'Notice comments' are updates by the notice team on the work to be done and that has been done so far on a notice.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $id The ID of the notice.
      # @param int $companyId The ID of the company that owns these notices.
      # @return FetchResult
      def getNoticeComments($id, $companyId)
        path = '/api/v2/companies/#{companyId}/notices/#{id}/comments';
        get (path)
      end


      # Retrieve notice finance details for a specific notice.
      # 
      # This API is available by invitation only.
      # 'Notice finance details' is the categorical breakdown of the total charge levied by the tax authority on our customer,
      # as broken down in our "notice log" found in Workflow. Main examples of the categories are 'Tax Due', 'Interest', 'Penalty', 'Total Abated'.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $id The ID of the company that owns these notices.
      # @param int $companyId The ID of the company that owns these notices.
      # @return FetchResult
      def getNoticeFinanceDetails($id, $companyId)
        path = '/api/v2/companies/#{companyId}/notices/#{id}/financedetails';
        get (path)
      end


      # Retrieve notice responsibilities for a specific notice.
      # 
      # This API is available by invitation only.
      # 'Notice responsibilities' are are those who are responsible for the notice.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $id The ID of the notice.
      # @param int $companyId The ID of the company that owns these notices.
      # @return FetchResult
      def getNoticeResponsibilities($id, $companyId)
        path = '/api/v2/companies/#{companyId}/notices/#{id}/responsibilities';
        get (path)
      end


      # Retrieve notice root causes for a specific notice.
      # 
      # This API is available by invitation only.
      # 'Notice root causes' are are those who are responsible for the notice.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # @param int $id The ID of the notice.
      # @param int $companyId The ID of the company that owns these notices.
      # @return FetchResult
      def getNoticeRootCauses($id, $companyId)
        path = '/api/v2/companies/#{companyId}/notices/#{id}/rootcauses';
        get (path)
      end


      # Retrieve notices for a company.
      # 
      # This API is available by invitation only.
      # List all tax notice objects assigned to this company.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # 
      # @param int $companyId The ID of the company that owns these notices.
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def listNoticesByCompany($companyId, $filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/companies/#{companyId}/notices';
        get (path)
      end


      # Retrieve all notices.
      # 
      # This API is available by invitation only.
      # Get multiple notice objects across all companies.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # 
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # 
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def queryNotices($filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/notices';
        get (path)
      end


      # Update a single notice.
      # 
      # This API is available by invitation only.
      # Replace the existing notice object at this URL with an updated object.
      # A 'notice' represents a letter sent to a business by a tax authority regarding tax filing issues. Avalara
      # Returns customers often receive support and assistance from the Compliance Notices team in handling notices received by taxing authorities.
      # All data from the existing object will be replaced with data in the object you PUT. 
      # To set a field's value to null, you may either set its value to null or omit that field from the object you post.
      # 
      # @param int $companyId The ID of the company that this notice belongs to.
      # @param int $id The ID of the notice you wish to update.
      # @param NoticeModel $model The notice object you wish to update.
      # @return NoticeModel
      def updateNotice($companyId, $id, $model)
        path = '/api/v2/companies/#{companyId}/notices/#{id}';
        put (path)
      end


      # Retrieve a single attachment
      # 
      # This API is available by invitation only.
      # Get the file attachment identified by this URL.
      # 
      # @param int $companyId The ID of the company for this attachment.
      # @param ResourceFileUploadRequestModel $model The ResourceFileId of the attachment to download.
      # @return FileResult
      def uploadAttachment($companyId, $model)
        path = '/api/v2/companies/#{companyId}/notices/files/attachment';
        post (path)
      end

    end
  end
end