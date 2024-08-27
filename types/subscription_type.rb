module Subscriptions
    class Types::SubscriptionType < Types::BaseObject
      field :server_info, subscription: Subscriptions::ServerInfoSubscription, null: false
      field :event_received, subscription: Subscriptions::EventReceivedSubscription, null: false

    end
  end