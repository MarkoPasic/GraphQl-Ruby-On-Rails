module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :account_id, Integer, null: false
    field :user_id, Integer, null: true
    field :amount, Integer, null: true
    field :processor, String, null: true
    field :processor_id, String, null: true
    field :card_type, String, null: true
    field :card_last4, String, null: true
    field :card_exp_month, String, null: true
    field :card_exp_year, String, null: true
    field :deleted_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :currency_symbol, String, null: true
    field :amount_refunded, Integer, null: true
    field :phone, String, null: true
    field :email, String, null: true
    field :message, String, null: true
    field :collection_scheduled_at, GraphQL::Types::ISO8601DateTime, null: true
    field :collection_confirmed_at, GraphQL::Types::ISO8601DateTime, null: true
    field :collection_scheduled_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :uuid, String, null: true
    field :collection_date, GraphQL::Types::ISO8601Date, null: true
    field :collection_time, GraphQL::Types::ISO8601DateTime, null: true
    field :stripe_session_id, String, null: true
    field :stripe_payment_intent, String, null: true
    field :amount_received, Integer, null: true
    field :customer_name, String, null: true
    field :checkout_completed_at, GraphQL::Types::ISO8601DateTime, null: true
    field :captured, Boolean, null: true
    field :livemode, Boolean, null: true
    field :capture_method, String, null: true
    field :cancellation_reason, String, null: true
    field :status, String, null: true
    field :payment_request_last_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :canceled_at, GraphQL::Types::ISO8601DateTime, null: true
    field :location_id, Integer, null: true
    field :draft, Boolean, null: true
    field :address, String, null: true
    field :county, String, null: true
    field :postcode, String, null: true
    field :point_id, Integer, null: true
    field :order_number, Integer, null: true
    field :last_webhook_at, GraphQL::Types::ISO8601DateTime, null: true
    field :order_type, ::Enums::OrderTypeEnum, null: true
    field :menu_id, Integer, null: true
    field :tip_amount, Float, null: true
    field :delivery_fee, Float, null: true
    field :tip_percent, Integer, null: true
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    field :table_id, Integer, null: true
    field :discount_amount, Float, null: true
    field :coupon_code, String, null: true
    field :checkout_by_webhook_at, GraphQL::Types::ISO8601DateTime, null: true
    field :bypass_date_and_slots, Boolean, null: true
    field :coupon_id, Integer, null: true
    field :application_fee, String, null: true
    field :application_fee_amount, Integer, null: true
    field :application_fee_percent, Float, null: true
    field :stripe_intent_time, Integer, null: true
    field :city, String, null: true
    field :country, String, null: true
    field :street, String, null: true
    field :street_number, String, null: true
    field :locality, String, null: true
    field :usePhone, Boolean, null: true
    field :usephone, Boolean, null: true
    field :usesmsmessage, Boolean, null: true
    field :useemail, Boolean, null: true
    field :cookiescriptconsent, String, null: true
    field :payment_method, ::Enums::PaymentMethodEnum, null: true
    field :is_fee_collected_in_aib, Boolean, null: true
    field :use_personal_info_for_marketing, Boolean, null: true
    field :menu, Types::MenuType, null: true
    field :order_items, [Types::OrderItemType], null: true
    field :destination, String, null: true
    field :table, Types::TableType, null: true
    field :collection_time_at, GraphQL::Types::ISO8601DateTime, null: true
    field :amount_in_pounds, Float, null: true
    field :amount_received_in_pounds, Float, null: true
    field :amount_refunded_in_pounds, Float, null: true
    field :subtotal, Float, null: true
    field :total, Float, null: true
    field :price_including_tax, Boolean, null: true
    field :tip_amount, Float, null: true
    field :delivery_fee, Float, null: true
    field :tax_by_product, Float, null: true
    field :paid, Boolean, null: true
    field :qty_required, Integer, null: true
    field :prepared_percentage, Integer, null: true
    field :prepared, Boolean, null: true
    field :product_items_reserved, Boolean, null: true
    field :order_emails, [Types::OrderEmailType], null: true
    field :payment_link, String, null: true
    field :custom_fee_amount, Float, null: true
    field :custom_fee_name, String, null: true


    def payment_link
      if !paid
       base_url = "lvh.me:3000"
      if(Rails.env.staging?)
        base_url = "tenvito.net"
      elsif(Rails.env.production?)
        base_url = "10vito.com"
      end
       "#{object.account.subdomain}.#{base_url}/cart?id=#{object.uuid}"
    else
      nil
    end
    end

    def paid
      object.paid?
    end

    def prepared
      object.prepared?
    end
    
    def product_items_reserved
      object.product_items_reserved?
    end
    

    def status

      if object.canceled_at.present?
       "Canceled"
      elsif object.amount_refunded.to_f > 0
       "Refunded"
      elsif object.amount_received && object.status == "requires_payment_method"
       "Error/Failed"
      elsif object.amount_received
        "Paid"
      elsif object.captured
         if object.block_slot?
          "Blocked"
         else
          "Paid Offline"
         end
      elsif object.collection_confirmed_at
        "Compleated"
      elsif object.payment_request_last_sent_at.present?
       "Request Sent"
      elsif object.draft
       "Draft"
      else 
       object.status.present? ? object.status.capitalize() : "No Status"
     end
     
     end


    
  end
end
