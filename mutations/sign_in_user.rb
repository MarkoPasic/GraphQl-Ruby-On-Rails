module Mutations
    class SignInUser < GraphQL::Schema::RelayClassicMutation
      argument_class Types::BaseArgument
      field_class Types::BaseField
      input_object_class Types::BaseInputObject
      object_class GraphQL::Schema::Object
      argument :email, String, required: true
      argument :password, String, required: true
  
      field :token, String, null: true
      field :user, Types::PublicUserType, null: true
      field :current_account_id, Integer, null: true
      field :token_expires_at, GraphQL::Types::ISO8601DateTime, null: true

      def resolve(**params)
        return unless params
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password])
            return unless user

            if user.user_notification_tokens.present?
             user.user_notification_tokens.where(temp: true).destroy_all
            end

            expires_at = Time.current + 24.hours
            
            keys = {
               nameid: user.id,
               unique_name: user.email,
               role: "Admin",
               account_id: user.accounts[0]&.id,
               nbf: DateTime.now.to_i, # Set to the current time
               iat: DateTime.now.to_i, # Set to the current time
               iss: "https://test.com"
            }

            token = JwtHelper.encode(keys, expires_at)
      
            { user: user, current_account_id: keys[:account_id],  token: token, token_expires_at: expires_at }
        else
           raise GraphQL::ExecutionError, 'Wrong username or password!'
        end
      end




      # def resolve(**params)
      #   return unless params
      #   user = User.find_by(email: params[:email])
      #   if user&.valid_password?(params[:password])
      #       return unless user

      #       if user.user_notification_tokens.present?
      #        user.user_notification_tokens.where(temp: true).destroy_all
      #       end

      #       crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      #       expires_at = Time.current + 24.hours
            
      #       keys = {
      #          user_id: user.id,
      #          account_id: user.accounts[0]&.id
      #       }

      #       token = crypt.encrypt_and_sign(keys, expires_at: expires_at)
      
      #       { user: user, current_account_id: keys[:account_id],  token: token, token_expires_at: expires_at }
      #   else
      #      raise GraphQL::ExecutionError, 'Wrong username or password!'
      #   end
      # end
    end
  end