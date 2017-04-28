module AvaTax
  class Client
    module Batches 


      # Create a new batch
      # 
      # Create one or more new batch objects attached to this company.
      # A batch object is a large collection of API calls stored in a compact file.
      # When you create a batch, it is added to the AvaTax Batch Queue and will be processed in the order it was received.
      # You may fetch a batch to check on its status and retrieve the results of the batch operation.
      # Each batch object may have one or more file objects attached.
      # 
      # @param int $companyId The ID of the company that owns this batch.
      # @param BatchModel[] $model The batch you wish to create.
      # @return BatchModel[]
      def createBatches($companyId, $model)
        path = '/api/v2/companies/#{companyId}/batches';
        post (path)
      end


      # Delete a single batch
      # 
      # Mark the existing batch object at this URL as deleted.
      # 
      # @param int $companyId The ID of the company that owns this batch.
      # @param int $id The ID of the batch you wish to delete.
      # @return ErrorDetail[]
      def deleteBatch($companyId, $id)
        path = '/api/v2/companies/#{companyId}/batches/#{id}';
        delete (path)
      end


      # Download a single batch file
      # 
      # Download a single batch file identified by this URL.
      # 
      # @param int $companyId The ID of the company that owns this batch
      # @param int $batchId The ID of the batch object
      # @param int $id The primary key of this batch file object
      # @return FileResult
      def downloadBatch($companyId, $batchId, $id)
        path = '/api/v2/companies/#{companyId}/batches/#{batchId}/files/#{id}/attachment';
        get (path)
      end


      # Retrieve a single batch
      # 
      # Get the batch object identified by this URL.
      # A batch object is a large collection of API calls stored in a compact file.
      # When you create a batch, it is added to the AvaTax Batch Queue and will be processed in the order it was received.
      # You may fetch a batch to check on its status and retrieve the results of the batch operation.
      # 
      # @param int $companyId The ID of the company that owns this batch
      # @param int $id The primary key of this batch
      # @return BatchModel
      def getBatch($companyId, $id)
        path = '/api/v2/companies/#{companyId}/batches/#{id}';
        get (path)
      end


      # Retrieve all batches for this company
      # 
      # List all batch objects attached to the specified company.
      # A batch object is a large collection of API calls stored in a compact file.
      # When you create a batch, it is added to the AvaTax Batch Queue and will be processed in the order it was received.
      # You may fetch a batch to check on its status and retrieve the results of the batch operation.
      # Search for specific objects using the criteria in the `$filter` parameter; full documentation is available on [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # Paginate your results using the `$top`, `$skip`, and `$orderby` parameters.
      # 
      # @param int $companyId The ID of the company that owns these batches
      # @param string $filter A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/) .
      # @param string $include A comma separated list of child objects to return underneath the primary object.
      # @param int $top If nonzero, return no more than this number of results. Used with $skip to provide pagination for large datasets.
      # @param int $skip If nonzero, skip this number of results before returning data. Used with $top to provide pagination for large datasets.
      # @param string $orderBy A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return FetchResult
      def listBatchesByCompany($companyId, $filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/companies/#{companyId}/batches';
        get (path)
      end


      # Retrieve all batches
      # 
      # Get multiple batch objects across all companies.
      # A batch object is a large collection of API calls stored in a compact file.
      # When you create a batch, it is added to the AvaTax Batch Queue and will be processed in the order it was received.
      # You may fetch a batch to check on its status and retrieve the results of the batch operation.
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
      def queryBatches($filter, $include, $top, $skip, $orderBy)
        path = '/api/v2/batches';
        get (path)
      end

    end
  end
end