module AvaTax
  class Client
    module AgeVerification 


      # Determines whether an individual meets or exceeds the minimum legal drinking age.
      #
      # The request must meet the following criteria in order to be evaluated:
      # * *firstName*, *lastName*, and *address* are required fields.
      # * One of the following sets of attributes are required for the *address*:
      #  * *line1, city, region*
      #  * *line1, postalCode*
      #
      # Optionally, the transaction and its lines may use the following parameters:
      # * A *DOB* (Date of Birth) field. The value should be ISO-8601 compliant (e.g. 2020-07-21).
      # * Beyond the required *address* fields above, a *country* field is permitted
      #  * The valid values for this attribute are [*US, USA*]
      #
      # **Security Policies**
      # This API depends on the active subscription *AgeVerification*
      # Swagger Name: AvaTaxBeverageClient	  
      # @param simulatedFailureCode [String] (Optional) The failure code included in the simulated response of the endpoint. Note that this endpoint is only available in Sandbox for testing purposes.
      # @param model [Object] Information about the individual whose age is being verified.
      # @return [Object]
      def verify_age(model, options={})        path = "/api/v2/ageverification/verify"
        post(path, model, options, "")      end
    end
  end
end