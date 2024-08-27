module Mutations
    class Login < GraphQL::Schema::RelayClassicMutation
      include JwtHelper

      argument_class Types::BaseArgument
      field_class Types::BaseField
      input_object_class Types::BaseInputObject
      object_class GraphQL::Schema::Object
      argument :email, String, required: true
      argument :password, String, required: true
  
      field :token, String, null: true

      def resolve(**params)
        return unless params
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password])
            return unless user

            if user.user_notification_tokens.present?
             user.user_notification_tokens.where(temp: true).destroy_all
            end

             payload = {
  "nameid": user.id,
  "unique_name": user.email,
  "role": "Admin, StoreAdmin, DigitalSampling, TenvitoMedia, LoyaltyCards, TenvitoAdmin",
  "account_id": user.accounts[0].id,
  "nbf": DateTime.now.to_i, # Set to the current time
  "iat": DateTime.now.to_i, # Set to the current time
  "iss": "test.com"
}

            {token: JwtHelper.encode(payload)}
        else
           raise GraphQL::ExecutionError, 'Wrong username or password!'
        end
      end
    end
  end