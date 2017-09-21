module AvaTax
  class Client
    module Reports 


      # Export a report accurate to the line level
      #
      # 
      # @param companyId [Integer] 
      # @param model [Object] 
      # @return [Object]
      def export_document_line(companyId, model)
        path = "/api/v2/companies/#{companyId}/reports/exportdocumentline"
        post(path, model)
      end

    end
  end
end