module Mutations
  class Orders::MarkAsScheduled< BaseMutation
    argument :id, Int, required: true
    argument :collection_scheduled_at, GraphQL::Types::ISO8601DateTime, required: true
   
    def resolve(id: nil, collection_scheduled_at: nil)
      order = Order.find(id)
      
      raise GraphQL::ExecutionError, 'Unable to find order!' unless order
     
      if order.collection_scheduled_at.present?
        order.collection_scheduled_at = collection_scheduled_at
        order.collection_scheduled_sent_at = Time.current
        order.save
      
        CustomerMailer.with(order: order).collection_scheduled.deliver_later
        order
      end
      
         
      end
    
  end
end