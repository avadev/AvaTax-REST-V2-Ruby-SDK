module AvaTax
  class Client
    module AdvancedRules 


      # Create a lookup file for a company
      #
      # 
      # @param accountId [Integer] The ID of the account for the company
      # @param companyId [Integer] The ID of the company for which the lookup file is to be created
      # @param model [Object] The lookup file you wish to create
      # @return [Object]
      def create_company_lookup_file(accountId, companyId, model)
        path = "/api/v2/advancedrules/accounts/#{accountId}/companies/#{companyId}/lookupFiles"
        post(path, model)
      end


      # Delete a lookup file
      #
      # 
      # @param accountId [Integer] The ID of the account for the company the lookup file is for
      # @param id [String] The unique ID/GUID for the company lookup file to be deleted
      # @return [ErrorDetail[]]
      def delete_lookup_file(accountId, id)
        path = "/api/v2/advancedrules/accounts/#{accountId}/lookupFiles/#{id}"
        delete(path)
      end


      # Get the lookup files for a company
      #
      # 
      # @param accountId [Integer] The account ID for the company
      # @param companyId [Integer] The ID of the company for which to retrieve lookup files
      # @return [FetchResult]
      def get_company_lookup_files(accountId, companyId)
        path = "/api/v2/advancedrules/accounts/#{accountId}/companies/#{companyId}/lookupFiles"
        get(path)
      end


      # Get a lookup file for an accountId and companyLookupFileId
      #
      # 
      # @param accountId [Integer] The ID of the account for the lookup file
      # @param id [String] The unique ID/GUID of the company lookup file to return
      # @return [Object]
      def get_lookup_file(accountId, id)
        path = "/api/v2/advancedrules/accounts/#{accountId}/lookupFiles/#{id}"
        get(path)
      end


      # Update a lookup file
      #
      # 
      # @param accountId [Integer] The ID of the account for the company the lookup file is for
      # @param id [String] The unique ID/GUID of the company lookup file to be updated
      # @param model [Object] The new values to update the lookup file
      # @return [Object]
      def update_lookup_file(accountId, id, model)
        path = "/api/v2/advancedrules/accounts/#{accountId}/lookupFiles/#{id}"
        put(path, model)
      end

    end
  end
end