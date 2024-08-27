module Types
  class CollectionType < Types::BaseObject
    field :id, ID, null: false
    field :account_id, Integer, null: false
    field :name, String, null: true
    field :published, Boolean, null: true
    field :deleted_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :menu_id, Integer, null: true
    field :position, Integer, null: true
    field :menu, Types::MenuType, null: true
  end
end
