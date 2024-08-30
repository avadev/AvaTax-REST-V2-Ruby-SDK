module AvaTax
  class Client
    module EcmEventNotifications 


      # Delete AFC event notifications.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Required* (all): ECMPremiumComms, ECMProComms.
      # Swagger Name: AvaTaxClient	  
      # @param isDlq [Boolean] Specify `true` to delete event notifications from the dead letter queue; otherwise, specify `false`.
      # @param model [Object] Details of the event you want to delete.
      # @return [FetchResult]
      def delete_afc_event_notifications(model, options={})        path = "/api/v2/event-notifications/afc"
        delete(path, model, options, AvaTax::VERSION)      end

      # Delete company event notifications
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Required* (all): ECMPro, ECMPremium.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that recorded these event notifications.
      # @param model [Object] Details of the event you want to delete.
      # @return [FetchResult]
      def delete_event_notifications(companyId, model)        path = "/api/v2/event-notifications/companies/#{companyId}"
        delete(path, model, {}, AvaTax::VERSION)      end

      # Retrieve company event notifications.
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Required* (all): ECMPro, ECMPremium.
      # Swagger Name: AvaTaxClient	  
      # @param companyId [Integer] The unique ID number of the company that recorded these event notifications.
      # @return [FetchResult]
      def get_event_notifications(companyId)        path = "/api/v2/event-notifications/companies/#{companyId}"
        get(path, {}, AvaTax::VERSION)      end

      # Retrieve AFC event notifications
      #
      # ### Security Policies
      #
      # * This API depends on the following active services:*Required* (all): ECMPremiumComms, ECMProComms.
      # Swagger Name: AvaTaxClient	  
      # @param isDlq [Boolean] Specify `true` to retrieve event notifications from the dead letter queue; otherwise, specify `false`.
      # @return [FetchResult]
      def list_afc_event_notifications(options={})        path = "/api/v2/event-notifications/afc"
        get(path, options, AvaTax::VERSION)      end
    end
  end
end