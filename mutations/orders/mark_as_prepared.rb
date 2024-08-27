module Mutations
  class Orders::MarkAsPrepared < BaseMutation
    argument :id, Int, required: true

    def resolve(id: nil)
      order = Order.find(id)
      
      raise GraphQL::ExecutionError, 'Unable to find order' unless order

      order.order_items.each do |order_item|
        order_item.qty_fulfilled = order_item.qty.to_i
        order_item.save
      end
      
      order 
      end
    
  end
end