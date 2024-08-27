module Mutations
    class Orders::CreateOrder < BaseMutation
      argument :order, Types::OrderInputType, required: true
  
      def resolve(order: nil)

        params = order.to_h
  
        if order[:order_type].present? && order[:order_type] == 5
         
          params[:order_type] = "block_slot"
          @order = Order.new(order)
          @order.draft = true
          @order.captured = true
          @order.save
        else 

          params = order.to_h
          
          params[:collection_date] = order[:collection_scheduled_at].to_time.utc
          params[:collection_time] = order[:collection_scheduled_at].to_time.utc
      
          @order = Order.new(params)
      
          #USED to differenciate POS / merchant created orders from customer created ones on dasboard (different time out periods for the two)
          @order.draft = true
          
          if @order.save
            
            # reduce product stock levels
            if @order.captured
              # Remove stock qty_available from fixed_quantity products
              @order.order_items.each do |order_item|
                if product = order_item.product
                  
                  # Only reduce QTY for fixed quantity items
                  if product.fixed_quantity?
                    product.qty_available = product.qty_available.to_i - order_item.qty
                    product.save
                  end
                  
                end
              end
            end
            
            @order
      
          else
            raise GraphQL::ExecutionError, "Unable to save order!"
          end
    
      end
      
    end

    def order_params(order)
      order.require(:order).permit(:account_id, :user_id, :amount, :amount_refunded, :processor, :processor_id, :card_type, :card_last4, :card_exp_month, :card_exp_year, :phone, :email, :message, :collection_scheduled_at, :collection_date, :collection_time, :currency, :customer_name, :captured, :amount_received, :address, :postcode, :country, :county, :street_number,:city,:street,:locality, :table_id, :delivery_fee, :tip_amount, :discount_amount, :order_type, :menu_id, :bypass_date_and_slots, :payment_method, :use_personal_info_for_marketing, :usesmsmessage, :useemail, :cookiescriptconsent, order_items_attributes: [:id, :name, :unit_price, :qty, :product_id, :tax_rate, :_destroy])
    end
  end
end