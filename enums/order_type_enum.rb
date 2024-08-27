module Enums
    class OrderTypeEnum < Types::BaseEnum
        graphql_name 'OrderType'
    
        value 'collection'
        value 'delivery'
        value 'table_service'
        value 'dispatch'
        value 'custom_fulfilment'
        value 'block_slot'
      end
  
  end
  