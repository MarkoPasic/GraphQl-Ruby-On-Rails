module Resolvers
    
    class Users::UserOne < GraphQL::Schema::Resolver
      type Types::UserType, null: false
      argument :id, Int, required: true
  
      def resolve(id: nil)
        user = User.find(id)
        user
      end
    end


    
  end
  