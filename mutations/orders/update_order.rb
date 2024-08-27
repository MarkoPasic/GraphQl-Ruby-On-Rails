module Mutations
    class Orders::UpdateOrder < BaseMutation
      argument :order, Types::OrderInputType, required: true
  
      def resolve(order: nil)
        old_captured_state = order.captured
    
    
        if order.update(order)
          
          marked_as_paid = (order.captured && order.captured != old_captured_state) ? true : false
          
          # reduce product stock levels
          if order.captured && marked_as_paid
            # Remove stock qty_available from fixed_quantity products
            order.order_items.each do |order_item|
              if product = order_item.product
                
                # Only reduce QTY for fixed quantity items
                if product.fixed_quantity?
                  product.qty_available = product.qty_available.to_i - order_item.qty
                  product.save
                end
                
              end
            end
          end
          order
        else
          raise GraphQL::ExecutionError, "Unable to save order!"

        end
      
    end
  end
end