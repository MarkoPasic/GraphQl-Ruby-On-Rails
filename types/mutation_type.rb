module Types
  class MutationType < Types::BaseObject
    field :sign_in_user, mutation: Mutations::SignInUser
    field :login, mutation: Mutations::Login
    field :impersonate_user, mutation: Mutations::ImpersonateUser
    field :switch_account, mutation: Mutations::SwitchAccount
    field :set_notification_token, mutation: Mutations::SetNotificationToken
    field :mark_as_prepared, Types::OrderType, mutation: Mutations::Orders::MarkAsPrepared
    field :mark_as_scheduled, Types::OrderType, mutation: Mutations::Orders::MarkAsScheduled
    field :mark_as_collected, Types::OrderType, mutation: Mutations::Orders::MarkAsCollected
    field :send_payment_request, Types::OrderType, mutation: Mutations::Orders::SendPaymentRequest
    field :send_confirmation, Types::OrderType, mutation: Mutations::Orders::SendConfirmation
    field :cancel_order, Types::OrderType, mutation: Mutations::Orders::CancelOrder
    field :uncancel_order, Types::OrderType, mutation: Mutations::Orders::UncancelOrder
    field :create_order, Types::OrderType, mutation: Mutations::Orders::CreateOrder
    field :update_order, Types::OrderType, mutation: Mutations::Orders::UpdateOrder
    field :delete_order, Types::OrderType, mutation: Mutations::Orders::DeleteOrder
    field :clear_notification_tokens, mutation: Mutations::ClearNotificationTokens
  end
end
