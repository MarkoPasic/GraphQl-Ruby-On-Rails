module Types
  class OrderItemType < Types::BaseObject
    field :id, ID, null: false
    field :order_id, Integer, null: false
    field :name, String, null: true
    field :product_id, Integer, null: true
    field :unit_price, Float, null: true
    field :qty, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :tax_rate, Float, null: true
    field :qty_fulfilled, Integer, null: true
    field :extras, String, null: true
    field :option, String, null: true
    field :option_id, Integer, null: true
    field :extra_ids, String, null: true
    field :product, Types::ProductType, null: true
  end
end
