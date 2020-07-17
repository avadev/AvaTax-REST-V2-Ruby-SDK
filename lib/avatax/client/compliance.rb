module AvaTax
  class Client
    module Compliance 


      # API to modify the reference fields at the document and the line level.
      #
      # 
      # @param companyId [Integer] 
      # @param model [TransactionReferenceFieldModel[]] 
      # @return [FetchResult]
      def tag_transaction(companyId, model)        path = "/api/v2/companies/#{companyId}/transactions/tag"
        put(path, model)      end
    end
  end
end