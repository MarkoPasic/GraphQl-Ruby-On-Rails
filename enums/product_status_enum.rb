module Enums
    class ProductStatusEnum < Types::BaseEnum
        graphql_name 'ProductStatus'
    
        value 'out_of_stock'
        value 'published'
        value 'unpublished'
      end
  
  end
  