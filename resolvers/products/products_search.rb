module Resolvers
    require 'search_object'
    require 'search_object/plugin/graphql'

    class Products::ProductsSearch < GraphQL::Schema::Resolver

    include SearchObject.module(:graphql)

      type Types::ProductType.collection_type, null: false
      description 'Lists Products'
      scope { Product.all.with_attached_image }

      option :filter, type: String, with: :apply_filter
      option :sort_by, type: ::Types::SortBy, with: :apply_sort_by
      option :page, type: Int, with: :apply_page
      option :per, type: Int, with: :apply_per
      option :product_status, type: ::Enums::ProductStatusEnum, with: :apply_product_status

      def apply_page(scope, value)
        scope = scope.page(value)
      end
    
      def apply_per(scope, value)
        scope = scope.per(value)
      end

      def apply_product_status(scope, value)
        scope = scope.send(value)
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
        scope = Product.all.with_attached_image

        scope = scope.where("name ILIKE ? OR description ILIKE ? OR sku ILIKE ?", "%#{value}%", "%#{value}%", "%#{value}%") if value.present?

        branches << scope
    
        # value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?
    
        branches
      end
    end


    
  end
  