module Types
  class PublicUserType < GraphQL::Schema::Object
    field_class Types::BaseField
    field :id, ID, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field :reset_password_token, String, null: true
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :remember_created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :confirmation_token, String, null: true
    field :confirmed_at, GraphQL::Types::ISO8601DateTime, null: true
    field :confirmation_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :unconfirmed_email, String, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :time_zone, String, null: true
    field :accepted_terms_at, GraphQL::Types::ISO8601DateTime, null: true
    field :accepted_privacy_at, GraphQL::Types::ISO8601DateTime, null: true
    field :announcements_read_at, GraphQL::Types::ISO8601DateTime, null: true
    field :admin, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :invitation_token, String, null: true
    field :invitation_created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :invitation_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :invitation_accepted_at, GraphQL::Types::ISO8601DateTime, null: true
    field :invitation_limit, Integer, null: true
    field :invited_by_type, String, null: true
    field :invited_by_id, Integer, null: true
    field :invitations_count, Integer, null: true
    field :partner, Boolean, null: true
    field :preferred_language, String, null: true
    field :failed_attempts, Integer, null: true
    field :unlock_token, String, null: true
    field :locked_at, GraphQL::Types::ISO8601DateTime, null: true
    field :accounts, [Types::AccountType], null: true

  end
end
