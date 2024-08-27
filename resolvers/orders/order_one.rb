module Resolvers
    
    class Orders::OrderOne < GraphQL::Schema::Resolver
      type Types::OrderType, null: false
      argument :id, Int, required: true
  
      def resolve(id: nil)
        Order.find(id)
      end
    end


    
  end
  