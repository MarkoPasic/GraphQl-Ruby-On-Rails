module Enums
    class PaymentMethodEnum < Types::BaseEnum
        graphql_name 'PaymentMethod'
    
        value 'stripe_standard'
        value 'stripe_express'
        value 'aib_merchant_services'
      end
  
  end
  