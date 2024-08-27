module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument
    argument :sortBy, String, required: false
    argument :sortOrder, String, required: false
  end

end
