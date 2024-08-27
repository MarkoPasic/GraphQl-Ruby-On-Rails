module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    require 'graphql-pagination'

    field :orders, resolver: Resolvers::Orders::OrdersSearch, description: "List of all orders, can take filters and params"
    field :order, resolver: Resolvers::Orders::OrderOne
    field :order_stats, resolver: Resolvers::Orders::OrderStats

    field :products, resolver: Resolvers::Products::ProductsSearch, description: "List of all products, can take filters and params"
    field :user, resolver: Resolvers::Users::UserOne

  end
end
