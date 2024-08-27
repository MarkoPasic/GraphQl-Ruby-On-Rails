module Types
  class UserNotificationTokenType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :account_id, Integer, null: true
    field :token, String, null: true
    field :device_id, String, null: true
    field :temp, Boolean, null: true
    field :timestamp, GraphQL::Types::ISO8601DateTime, null: true
  end
end
