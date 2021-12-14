module AvaTax
  class Client
    module ShippingVerification 


      # Removes the transaction from consideration when evaluating regulations that span multiple transactions.
      #
      # 
      # Swagger Name: AvaTaxBeverageClient	  
      # @param companyCode [String] The company code of the company that recorded the transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param documentType [String] (Optional): The document type of the transaction to operate on. If omitted, defaults to "SalesInvoice"
      # @return []
      def deregister_shipment(companyCode, transactionCode, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/shipment/registration"
        delete(path, options, "")      end

      # Registers the transaction so that it may be included when evaluating regulations that span multiple transactions.
      #
      # 
      # Swagger Name: AvaTaxBeverageClient	  
      # @param companyCode [String] The company code of the company that recorded the transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param documentType [String] (Optional): The document type of the transaction to operate on. If omitted, defaults to "SalesInvoice"
      # @return []
      def register_shipment(companyCode, transactionCode, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/shipment/registration"
        put(path, options, "")      end

      # Evaluates a transaction against a set of direct-to-consumer shipping regulations and, if compliant, registers the transaction so that it may be included when evaluating regulations that span multiple transactions.
      #
      # 
      # Swagger Name: AvaTaxBeverageClient	  
      # @param companyCode [String] The company code of the company that recorded the transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param documentType [String] (Optional): The document type of the transaction to operate on. If omitted, defaults to "SalesInvoice"
      # @return [Object]
      def register_shipment_if_compliant(companyCode, transactionCode, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/shipment/registerIfCompliant"
        put(path, options, "")      end

      # Evaluates a transaction against a set of direct-to-consumer shipping regulations.
      #
      # The transaction and its lines must meet the following criteria in order to be evaluated:
      # * The transaction must be recorded. Using a type of *SalesInvoice* is recommended.
      # * A parameter with the name *AlcoholRouteType* must be specified and the value must be one of the following: '*DTC*', '*Retailer DTC*'
      # * A parameter with the name *RecipientName* must be specified and the value must be the name of the recipient.
      # * Each alcohol line must include a *ContainerSize* parameter that describes the volume of a single container. Use the *unit* field to specify one of the following units: '*Litre*', '*Millilitre*', '*gallon (US fluid)*', '*quart (US fluid)*', '*ounce (fluid US customary)*'
      # * Each alcohol line must include a *PackSize* parameter that describes the number of containers in a pack. Specify *Count* in the *unit* field.
      #
      # Optionally, the transaction and its lines may use the following parameters:
      # * The *ShipDate* parameter may be used if the date of shipment is different than the date of the transaction. The value should be ISO-8601 compliant (e.g. 2020-07-21).
      # * The *RecipientDOB* parameter may be used to evaluate age restrictions. The value should be ISO-8601 compliant (e.g. 2020-07-21).
      # * The *PurchaserDOB* parameter may be used to evaluate age restrictions. The value should be ISO-8601 compliant (e.g. 2020-07-21).
      # * The *SalesLocation* parameter may be used to describe whether the sale was made *OnSite* or *OffSite*. *OffSite* is the default value.
      # * The *AlcoholContent* parameter may be used to describe the alcohol percentage by volume of the item. Specify *Percentage* in the *unit* field.
      #
      # **Security Policies**
      # This API depends on all of the following active subscriptions: *AvaAlcohol, AutoAddress, AvaTaxPro*
      # Swagger Name: AvaTaxBeverageClient	  
      # @param companyCode [String] The company code of the company that recorded the transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param documentType [String] (Optional): The document type of the transaction to operate on. If omitted, defaults to "SalesInvoice"
      # @return [Object]
      def verify_shipment(companyCode, transactionCode, options={})        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/shipment/verify"
        get(path, options, "")      end
    end
  end
end