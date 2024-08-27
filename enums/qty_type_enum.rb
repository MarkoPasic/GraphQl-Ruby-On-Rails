module Enums
    class QtyTypeEnum < Types::BaseEnum
        graphql_name 'QtyType'
    
        value 'fixed_quantity'
        value 'daily_quantity'
        value 'unlimited_quantity'
    
      end

  end
  