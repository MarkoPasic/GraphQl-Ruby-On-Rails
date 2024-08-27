module Mutations
  class ClearNotificationTokens < BaseMutation

    field :user, Types::UserType, null: true

    def resolve()
      raise GraphQL::ExecutionError, "Please login again!" unless context[:current_user].present? && context[:current_account].present?
      context_user = context[:current_user]
      user = User.find(context_user.id)

      if user.user_notification_tokens.present?
         user.user_notification_tokens.destroy_all
      end

      { user: User.find(context_user.id) }
    end
    
  end
end