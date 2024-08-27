module Types
  class TableType < Types::BaseObject
    field :id, ID, null: false
    field :account_id, Integer, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :area_id, Integer, null: true
    field :bookable, Boolean, null: true
    field :booking_priority, Integer, null: true
    field :covers, Integer, null: true
    field :deleted_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
