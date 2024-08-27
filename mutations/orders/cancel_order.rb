module Mutations
    class Orders::CancelOrder < BaseMutation
      argument :id, Int, required: true
  
      def resolve(id: nil)
        
        order = Order.find(id)
        order.canceled_at = Time.now
        # Free up time slot again
        # order.collection_time = nil
        if order.save
          order.remove_from_live_dashboard
               
          # Re-add stock quantities on cancel
          order.order_items.each do |order_item|
            if product = order_item.product                
              # Only reduce QTY for fixed quantity items
              product.qty_available = product.qty_available.to_i + order_item.qty if product.fixed_quantity?
              product.save                
            end
         end 
    
        end
        order
      end
      
    end
  end