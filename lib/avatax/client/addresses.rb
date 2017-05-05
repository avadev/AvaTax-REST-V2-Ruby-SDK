module AvaTax
  class Client
    module Addresses 


      # Retrieve geolocation information for a specified address
      # 
      # Resolve an address against Avalara's address-validation system. If the address can be resolved, this API 
      # provides the latitude and longitude of the resolved location. The value 'resolutionQuality' can be used 
      # to identify how closely this address can be located. If the address cannot be clearly located, use the 
      # 'messages' structure to learn more about problems with this address.
      # This is the same API as the POST /api/v2/addresses/resolve endpoint.
      # Both verbs are supported to provide for flexible implementation.
      # 
      # @param string line1 Line 1
      # @param string line2 Line 2
      # @param string line3 Line 3
      # @param string city City
      # @param string region State / Province / Region
      # @param string postalCode Postal Code / Zip Code
      # @param string country Two character ISO 3166 Country Code (see /api/v2/definitions/countries for a full list)
      # @param string textCase selectable text case for address validation (See TextCase::* for a list of allowable values)
      # @param float latitude Geospatial latitude measurement
      # @param float longitude Geospatial longitude measurement
      # @return AddressResolutionModel
      def resolve_address(options={})
        path = "/api/v2/addresses/resolve"
        
        get(path, options)
      end


      # Retrieve geolocation information for a specified address
      # 
      # Resolve an address against Avalara's address-validation system. If the address can be resolved, this API 
      # provides the latitude and longitude of the resolved location. The value 'resolutionQuality' can be used 
      # to identify how closely this address can be located. If the address cannot be clearly located, use the 
      # 'messages' structure to learn more about problems with this address.
      # This is the same API as the GET /api/v2/addresses/resolve endpoint.
      # Both verbs are supported to provide for flexible implementation.
      # 
      # @param AddressValidationInfo model The address to resolve
      # @return AddressResolutionModel
      def resolve_address_post(model)
        path = "/api/v2/addresses/resolve"
        
        post(path, model)
      end

    end
  end
end