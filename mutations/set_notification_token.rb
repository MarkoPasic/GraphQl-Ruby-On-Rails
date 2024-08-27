module Mutations
  class SetNotificationToken < BaseMutation
    argument :token, String, required: true
    argument :device_id, String, required: false
    argument :impersonate, Boolean, required: false

    field :user, Types::UserType, null: true

    def resolve(token: nil, device_id: nil, impersonate: false)
      raise GraphQL::ExecutionError, "Please login again!" unless context[:current_user].present? && context[:current_account].present?
      context_user = context[:current_user]
      user = User.find(context_user.id)
      begin 
     if device_id.present? 
      if user.user_notification_tokens.present?
         ids_for_delete = user.user_notification_tokens.where(device_id: device_id).pluck(:id)
         UserNotificationToken.where(id: ids_for_delete ).destroy_all
         user.user_notification_tokens.where(temp: true).destroy_all
      end

        @notification_token = UserNotificationToken.new
        @notification_token.user_id = user.id
        @notification_token.account_id = context[:current_account].id
        @notification_token.token = token
        @notification_token.device_id = device_id
        @notification_token.timestamp = Time.now
        @notification_token.temp = impersonate
        @notification_token.save
    
      end
      { user: User.find(context_user.id) }
    rescue
       { user: User.find(context_user.id) }

    end
    end
    
  end
end