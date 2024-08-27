module Types
  class OrderItemInputType < Types::BaseInputObject
    argument :order_id, Integer, required: false
    argument :name, String, required: false
    argument :product_id, Integer, required: false
    argument :unit_price, Float, required: false
    argument :qty, Integer, required: false
    argument :tax_rate, Float, required: false
    argument :extras, String, required: false
    argument :option, String, required: false
    argument :option_id, Integer, required: false
    argument :extra_ids, String, required: false
  end
end
