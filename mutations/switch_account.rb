module Mutations
    class SwitchAccount < BaseMutation
      argument :account_id, Integer, required: true
      
      field :user, Types::PublicUserType, null: true
      field :current_account_id, Integer, null: true
      field :token, String, null: true
      field :token_expires_at, GraphQL::Types::ISO8601DateTime, null: true

      def resolve(**params)
      raise GraphQL::ExecutionError, "Please login again!" unless context[:current_user].present?

       if  user = User.find_by(id: context[:current_user].id)
        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        expires_at = Time.current + 24.hours
      
          requested_account = user.accounts.where(id:  params[:account_id])[0]
          raise GraphQL::ExecutionError, "Unable to find account with this id" unless requested_account.present?

            keys = {
               user_id: user.id,
               account_id: requested_account.id
            }

            token = crypt.encrypt_and_sign(keys, expires_at: expires_at)
      
            { user: user, current_account_id: keys[:account_id],  token: token, token_expires_at: expires_at }

         else
          raise GraphQL::ExecutionError, "Unable to find user with email #{params[:email]}!"
         end


      
      end
    end
  end