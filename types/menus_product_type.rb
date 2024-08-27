module Types
  class MenusProductType < Types::BaseObject
    field :menu_id, Integer, null: true
    field :product_id, Integer, null: true
    field :collection_id, Integer, null: true
    field :position, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :product, Types::ProductType, null: true
    field :collection, Types::CollectionType, null: true

  end
end
