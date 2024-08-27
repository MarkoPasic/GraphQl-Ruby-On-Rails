module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :account_id, Integer, null: false
    field :deleted_at, GraphQL::Types::ISO8601DateTime, null: true
    field :sku, String, null: true
    field :price, Float, null: true
    field :qty_available, Integer, null: true
    field :continue_selling, Boolean, null: true
    field :slug, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :tax_rate, Float, null: true
    field :published, Boolean, null: true
    field :position, Integer, null: true
    field :qty_type, ::Enums::QtyTypeEnum, null: true
    field :qty_hidden, Boolean, null: true
    field :qty_remaining, Integer, null: true
    field :featured, Boolean, null: true
    field :sale_price, Float, null: true
    field :price_including_tax, Boolean, null: true
    field :menus_products, [Types::MenusProductType], null: true
    field :image_path, String, null: true
    field :sold_qty, Integer, null: true
    field :currency_symbol, String, null: true

  end
end
