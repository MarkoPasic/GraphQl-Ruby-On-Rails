module Mutations
  class Orders::MarkAsCollected < BaseMutation
    argument :id, Int, required: true
    argument :send_email, Boolean, required: false

    def resolve(id: nil, send_email: false)
      order = Order.find(id)
      
      order.collection_confirmed_at = Time.current
      if order.save
        order.remove_from_live_dashboard  
      end
      
      if send_email == true
        CustomerMailer.with(order: order).order_collected.deliver_later
      end
      order
      end
    
  end
end