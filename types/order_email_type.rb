module Types
  class OrderEmailType < Types::BaseObject
    field :id, ID, null: false
    field :account_id, Integer, null: true
    field :order_id, Integer, null: true
    field :email, String, null: true
    field :subject, String, null: true
    field :content, String, null: true
    field :message_id, String, null: true
    field :delivered_at, GraphQL::Types::ISO8601DateTime, null: true
    field :received_at, GraphQL::Types::ISO8601DateTime, null: true
    field :bounced_at, GraphQL::Types::ISO8601DateTime, null: true
    field :delivery_data, String, null: true
    field :bounce_data, String, null: true
    field :spam_data, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :uuid, String, null: true
  end
end
