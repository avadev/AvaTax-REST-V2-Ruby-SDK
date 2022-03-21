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
      # @param api-version [String] (Optional): API version that should satisfy the request. If omitted, defaults to 2.2
      # @param x-avalara-version [String] (Optional): API version that should satisfy the request. If omitted, defaults to 2.2. Header takes precendence if both header and query parameters are present.
      # @return []
      def deregister_shipment(companyCode, transactionCode, options={}, x_avalara_version="")        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/shipment/registration"
        headers= Hash.new
        headers["x-avalara-version"]=x_avalara_version if !(x_avalara_version.nil? || x_avalara_version.empty?);
        delete(path, options, "", headers)      end

      # Registers the transaction so that it may be included when evaluating regulations that span multiple transactions.
      #
      # 
      # Swagger Name: AvaTaxBeverageClient	  
      # @param companyCode [String] The company code of the company that recorded the transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param documentType [String] (Optional): The document type of the transaction to operate on. If omitted, defaults to "SalesInvoice"
      # @param api-version [String] (Optional): API version that should satisfy the request. If omitted, defaults to 2.2
      # @param x-avalara-version [String] (Optional): API version that should satisfy the request. If omitted, defaults to 2.2. Header takes precendence if both header and query parameters are present.
      # @return []
      def register_shipment(companyCode, transactionCode, options={}, x_avalara_version="")        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/shipment/registration"
        headers= Hash.new
        headers["x-avalara-version"]=x_avalara_version if !(x_avalara_version.nil? || x_avalara_version.empty?);
        put(path, options, "", headers)      end

      # Evaluates a transaction against a set of direct-to-consumer shipping regulations and, if compliant, registers the transaction so that it may be included when evaluating regulations that span multiple transactions.
      #
      # 
      # Swagger Name: AvaTaxBeverageClient	  
      # @param companyCode [String] The company code of the company that recorded the transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param documentType [String] (Optional): The document type of the transaction to operate on. If omitted, defaults to "SalesInvoice"
      # @param api-version [String] (Optional): API version that should satisfy the request. If omitted, defaults to 2.2
      # @param x-avalara-version [String] (Optional): API version that should satisfy the request. If omitted, defaults to 2.2. Header takes precendence if both header and query parameters are present.
      # @return [Object]
      def register_shipment_if_compliant(companyCode, transactionCode, options={}, x_avalara_version="")        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/shipment/registerIfCompliant"
        headers= Hash.new
        headers["x-avalara-version"]=x_avalara_version if !(x_avalara_version.nil? || x_avalara_version.empty?);
        put(path, options, "", headers)      end

      # Evaluates a transaction against a set of direct-to-consumer shipping regulations.
      #
      # The transaction and its lines must meet the following criteria in order to be evaluated:
      # * The transaction must be recorded. Using a type of *SalesInvoice* is recommended.
      # * A parameter with the name *AlcoholRouteType* must be specified and the value must be one of the following: '*DTC*', '*Retailer DTC*'
      # * A parameter with the name *RecipientName* must be specified and the value must be the name of the recipient.
      # * Each alcohol line must include a *ContainerSize* parameter that describes the volume of a single container. Use the *unit* field to specify one of the following units: '*Litre*', '*Millilitre*', '*gallon (US fluid)*', '*quart (US fluid)*', '*ounce (fluid US customary)*'
      # * Each alcohol line must include a *PackSize* parameter that describes the number of containers in a pack. Specify *Count* in the *unit* field.
      # * Each alcohol line must include a *AlcoholContent* parameter that describes the alcohol percentage by volume of the item. Specify *Percentage* in the *unit* field. If unable to provide this parameter, use version 2.1 of the API.
      #
      # Optionally, the transaction and its lines may use the following parameters:
      # * The *ShipDate* parameter may be used if the date of shipment is different than the date of the transaction. The value should be ISO-8601 compliant (e.g. 2020-07-21).
      # * The *RecipientDOB* parameter may be used to evaluate age restrictions. The value should be ISO-8601 compliant (e.g. 2020-07-21).
      # * The *PurchaserDOB* parameter may be used to evaluate age restrictions. The value should be ISO-8601 compliant (e.g. 2020-07-21).
      # * The *SalesLocation* parameter may be used to describe whether the sale was made *OnSite* or *OffSite*. *OffSite* is the default value.
      #
      # **Security Policies**
      # This API depends on all of the following active subscriptions: *AvaAlcohol, AutoAddress, AvaTaxPro*
      # Swagger Name: AvaTaxBeverageClient	  
      # @param companyCode [String] The company code of the company that recorded the transaction
      # @param transactionCode [String] The transaction code to retrieve
      # @param documentType [String] (Optional): The document type of the transaction to operate on. If omitted, defaults to "SalesInvoice"
      # @param api-version [String] (Optional): API version that should satisfy the request. If omitted, defaults to 2.2
      # @param x-avalara-version [String] (Optional): API version that should satisfy the request. If omitted, defaults to 2.2. Header takes precendence if both header and query parameters are present.
      # @return [Object]
      def verify_shipment(companyCode, transactionCode, options={}, x_avalara_version="")        path = "/api/v2/companies/#{companyCode}/transactions/#{transactionCode}/shipment/verify"
        headers= Hash.new
        headers["x-avalara-version"]=x_avalara_version if !(x_avalara_version.nil? || x_avalara_version.empty?);
        get(path, options, "", headers)      end
    end
  end
end