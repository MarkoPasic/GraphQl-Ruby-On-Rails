module Enums
    class PaymentStatusEnum < Types::BaseEnum
        graphql_name 'PaymentStatus'
    
        value 'paid'
        value 'latest'
        value 'unpaid'
        value 'refunded'
        value 'draft'
        value 'order_canceled'
        value 'payment_canceled'
        value 'payment_succeeded'
        value 'abandoned'
      end
  
  end
  