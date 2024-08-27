module Mutations
    class Orders::SendConfirmation < BaseMutation
      argument :id, Int, required: true
  
      def resolve(id: nil)
        order = Order.find(id)
        CustomerMailer.with(order: order).order_received.deliver_later
        order = Order.find(id)
      end
      
    end
  end