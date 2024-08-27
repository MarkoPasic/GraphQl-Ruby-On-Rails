module Mutations
    class Orders::DeleteOrder < BaseMutation
      argument :id, Int, required: true
  
      def resolve(id: nil)
        
        order = Order.find(id)
        order.deleted_at = Time.now
        order.save

      end
      
    end
  end