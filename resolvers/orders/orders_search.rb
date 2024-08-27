module Resolvers
    require 'search_object'
    require 'search_object/plugin/graphql'

    class Orders::OrdersSearch < GraphQL::Schema::Resolver

    include SearchObject.module(:graphql)

    type Types::OrderType.collection_type, null: false
    description 'Lists orders'
    scope { Order.received_or_draft }

      option :filter, type: String, with: :apply_filter
      option :sort_by, type: ::Types::SortBy, with: :apply_sort_by
      option :page, type: Int, with: :apply_page
      option :per, type: Int, with: :apply_per
      option :order_date, type: GraphQL::Types::ISO8601DateTime, with: :apply_order_date_filter
      option :fulfillment_date, type: GraphQL::Types::ISO8601DateTime, with: :apply_fulfillment_date_filter
      option :payment_status, type: ::Enums::PaymentStatusEnum, with: :apply_order_status
      option :fulfillment_status, type: ::Enums::FulfillmentStatusEnum, with: :apply_order_status

      def apply_page(scope, value)
        scope = scope.page(value)
      end
    
      def apply_per(scope, value)
        scope = scope.per(value)
      end

      def apply_order_status(scope, value)
        scope = scope.send(value)
      end

      def apply_order_date_filter(scope, value)
        scope = scope.order_date(value)
      end

      def apply_fulfillment_date_filter(scope, value)
        scope = scope.collection_date(value)
      end
    
       # apply_filter recursively loops through "OR" branches
      def apply_filter(scope, value)
        branches = normalize_filters(value).reduce { |a, b| a.or(b) }
        scope.merge branches
      end

      def apply_sort_by(scope, value)
        if value[:sortBy].present?
            scope.order value[:sortBy] + ' ' + (value[:sortOrder].present? ? value[:sortOrder] : 'DESC' )
        end
      end

      def normalize_filters(value, branches = [])
        scope = Order.received_or_draft

        scope = scope.where("id = ? OR email ILIKE ? OR phone ILIKE ? OR message ILIKE ? OR uuid ILIKE ? OR customer_name ILIKE ?", value.to_i, "%#{value}%", "%#{value}%", "%#{value}%", "%#{value}%", "%#{value}%") if value.present?

        branches << scope
    
        # value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?
    
        branches
      end
    end


    
  end
  