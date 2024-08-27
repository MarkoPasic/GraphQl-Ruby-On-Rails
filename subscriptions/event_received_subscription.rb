module Subscriptions
    class EventReceivedSubscription < Subscriptions::BaseSubscription
      argument :event_name, String, required: true
  
      field :event_name, String, null: false
      field :payload, String, null: true

      def event_name
        "eeevent name"
      end
      def subscribe( attrs = {})
        { event_name: "test" }
      end
  
      def update( attrs = {})
        puts 'UPDATE CALLED' # Nope, it's not being called
        super
      end
    end
  end