module Subscriptions
    class ServerInfoSubscription < Subscriptions::BaseSubscription
      field :date_time, GraphQL::Types::ISO8601DateTime, null: false
  
      def subscribe( attrs = {})
        { date_time: DateTime.now }
      end
  
      def update( attrs = {})
        puts 'UPDATE CALLED' # Nope, it's not being called
        super
      end
    end
  end