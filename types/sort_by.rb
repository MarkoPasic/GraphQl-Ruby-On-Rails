module Types
  class SortBy < BaseInputObject
    argument :sortBy, String, required: false
    argument :sortOrder, String, required: false
  end

end
