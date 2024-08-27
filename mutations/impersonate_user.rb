module Mutations
    class ImpersonateUser < BaseMutation
      argument :email, String, required: true
  
      field :user, Types::PublicUserType, null: true
      field :current_account_id, Integer, null: true
      field :token, String, null: true
      field :token_expires_at, GraphQL::Types::ISO8601DateTime, null: true

      def resolve(**params)

        raise GraphQL::ExecutionError, "Please login again!" unless context[:current_user].present?
        raise GraphQL::ExecutionError, "Don't have permission for this action" unless context[:current_user]&.admin
      
        if  user = User.find_by(email: params[:email])

          crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
          expires_at = Time.current + 24.hours   
            
            keys = {
               user_id: user.id,
               account_id: user.accounts[0]&.id
            }

            token = crypt.encrypt_and_sign(keys, expires_at: expires_at)
      
            { user: user, current_account_id: keys[:account_id],  token: token, token_expires_at: expires_at }

      else
         raise GraphQL::ExecutionError, "Unable to find user with email #{params[:email]}!"
      end
      
      end
    end
  end