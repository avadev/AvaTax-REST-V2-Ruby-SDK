module AvaTax
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include AvaTax::Client::Accounts
    include AvaTax::Client::Addresses
    include AvaTax::Client::Batches
    include AvaTax::Client::CertExpressInvites
    include AvaTax::Client::Companies
    include AvaTax::Client::Contacts
    include AvaTax::Client::Customers
    include AvaTax::Client::Definitions
    include AvaTax::Client::FilingCalendars
    include AvaTax::Client::Filings
    include AvaTax::Client::Free
    include AvaTax::Client::FundingRequests
    include AvaTax::Client::Items
    include AvaTax::Client::JurisdictionOverrides
    include AvaTax::Client::Locations
    include AvaTax::Client::Nexus
    include AvaTax::Client::Notices
    include AvaTax::Client::Onboarding
    include AvaTax::Client::PointOfSale
    include AvaTax::Client::Registrar
    include AvaTax::Client::Settings
    include AvaTax::Client::Subscriptions
    include AvaTax::Client::TaxCodes
    include AvaTax::Client::TaxContent
    include AvaTax::Client::TaxRules
    include AvaTax::Client::Transactions
    include AvaTax::Client::Upcs
    include AvaTax::Client::Users
    include AvaTax::Client::Utilities
    include AvaTax::Client::ShippingVerification
    include AvaTax::Client::AgeVerification
  end
end
