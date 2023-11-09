module AvaTax
  class Client
    module DomainControlVerification 


      # Create Domain control verification
      #
      # 
      # Swagger Name: AvaTaxClient	  
      # @param model [Object] 
      # @return [Object]
      def create_dcv(model)        path = "/api/v2/domain-control-verifications"
        post(path, model, {}, AvaTax::VERSION)      end

      # Get domain control verifications by logged in user/domain name.
      #
      # 
      # Swagger Name: AvaTaxClient	  
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* Id, Context, Token, Status, EmailId, CreatedOn, CreatedBy, UpdatedOn, UpdatedBy
      # @return [DcvViewModel[]]
      def filter_dcv(options={})        path = "/api/v2/domain-control-verifications"
        get(path, options, AvaTax::VERSION)      end

      # Get domain control verification by domainControlVerificationId
      #
      # 
      # Swagger Name: AvaTaxClient	  
      # @param domainControlVerificationId [String] 
      # @return [Object]
      def get_dcv_by_id(domainControlVerificationId)        path = "/api/v2/domain-control-verifications/#{domainControlVerificationId}"
        get(path, {}, AvaTax::VERSION)      end
    end
  end
end