module Types
    class OrderStatsType < Types::BaseObject
      field :new_orders_count, Integer, null: false
      field :sold_out_products_count, Integer, null: false
      field :fulfilled_count, Integer, null: false
      field :remaining_orders_count, Integer, null: false
      field :total_order_value, String, null: true
      field :pending_orders_count, Integer, null: false
      field :completed_orders_count, Integer, null: false
      field :overdue_orders_count, Integer, null: false

  end
end  
  