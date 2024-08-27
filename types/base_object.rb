module Types
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField
    def self.authorized?(object, context)
      object != nil ? super && context[:current_user] != nil : true
     end
  end
end
