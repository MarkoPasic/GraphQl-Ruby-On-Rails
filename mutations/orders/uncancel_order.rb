module Mutations
    class Orders::UncancelOrder < BaseMutation
      argument :id, Int, required: true
  
      def resolve(id: nil)
        
        order = Order.find(id)

        order.canceled_at = nil
        if order.save
    
          order.add_to_live_dashboard
    
          # Remove stock qty_available from products
          order.order_items.each do |order_item|
            if product = order_item.product                
              # Only reduce QTY for fixed quantity items
              product.qty_available = product.qty_available.to_i - order_item.qty if product.fixed_quantity?
              product.save                
            end
          end 
    
            order
        end
       
      end
      
    end
  end