module Types
  class OrderInputType < BaseInputObject
    description "Attributes for creating or updating an Order"
    # argument :id, String, required: true
    # argument :customer, String, required: true

    argument :id, ID, required: false
    argument :account_id, Integer, required: false 
    argument :user_id, Integer, required: false 
    argument :amount, Integer, required: false 
    argument :processor, String, required: false 
    argument :processor_id, String, required: false 

    argument :currency, String, required: false 
    argument :amount_refunded, Integer, required: false 
    argument :phone, String, required: false 
    argument :email, String, required: false 
    argument :message, String, required: false 
    argument :collection_scheduled_at, GraphQL::Types::ISO8601DateTime, required: false 

    argument :collection_date, GraphQL::Types::ISO8601Date, required: false 
    argument :collection_time, GraphQL::Types::ISO8601DateTime, required: false 

    argument :amount_received, Integer, required: false 
    argument :customer_name, String, required: false 
    argument :checkout_completed_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :captured, Boolean, required: false 
 
    argument :address, String, required: false 
    argument :postcode, String, required: false 
    argument :point_id, Integer, required: false
    argument :order_type, Integer, required: false 
    argument :menu_id, Integer, required: false 

    argument :table_id, Integer, required: false 
    argument :discount_amount, Float, required: false 

    argument :bypass_date_and_slots, Boolean, required: false 

    argument :city, String, required: false 
    argument :country, String, required: false 
    argument :street, String, required: false 
    argument :street_number, String, required: false 
    argument :locality, String, required: false 

    argument :payment_method, Integer, required: false 

    argument :tip_amount, Float, required: false 
    argument :delivery_fee, Float, required: false 
    argument :order_items_attributes, [Types::OrderItemInputType], required: false
  end
end
