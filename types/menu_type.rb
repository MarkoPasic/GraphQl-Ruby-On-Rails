module Types
  class MenuType < Types::BaseObject
    field :id, ID, null: false
    field :account_id, Integer, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :deleted_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :slug, String, null: true
    field :delivery, Boolean, null: true
    field :collection, Boolean, null: true
    field :table_service, Boolean, null: true
    field :accept_tips, Boolean, null: true
    field :delivery_fee, Float, null: true
    field :buffer_minutes, Integer, null: true
    field :published, Boolean, null: true
    field :position, Integer, null: true
    field :minimum_order_value, Float, null: true
    field :address, String, null: true
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    field :max_orders_per_day, Integer, null: true
    field :limit_delivery_area, Boolean, null: true
    field :delivery_area, Float, null: true
    field :zoom_level, Integer, null: true
    field :dispatch, Boolean, null: true
    field :custom_fulfilment, String, null: true
    field :custom_fulfilment_instructions, String, null: true
    field :menus_products, [Types::MenusProductType], null: true
    field :custom_fee, String, null: true
    field :custom_fee_amount, Float, null: true
    field :custom_fee_type, String, null: true

  end
end
