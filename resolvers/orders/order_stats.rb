module Resolvers
    
    class Orders::OrderStats < GraphQL::Schema::Resolver
      type Types::OrderStatsType, null: false
      argument :date, GraphQL::Types::ISO8601DateTime, required: false

      def resolve(date: Date.current)
       
        @total_items = Order.received_or_draft.where(canceled_at: nil).where.not(order_type: "block_slot").collection_date(date)
       
        {
            "sold_out_products_count" => Product.out_of_stock.count,
            "fulfilled_count" =>  @total_items.collection_date(date).collected.count,
            "remaining_orders_count" => @total_items.received_or_draft.collection_date(date).not_collected.count,
            "total_order_value" => ActionController::Base.helpers.number_to_currency( @total_items.collection_date(date).paid.sum(:amount_received) / 100.0, unit: "EUR "),
            "pending_orders_count" => @total_items.where(collection_confirmed_at: nil).order(collection_scheduled_at: :asc).count,
            "completed_orders_count" => @total_items.where.not(collection_confirmed_at: nil).count,
            "new_orders_count" =>  @total_items.count,
            "overdue_orders_count" => @total_items.received_or_draft.collection_overdue.count

        }

       
      end
    end


    
  end
  