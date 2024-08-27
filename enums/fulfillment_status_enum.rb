module Enums
    class FulfillmentStatusEnum < Types::BaseEnum
        graphql_name 'FulfillmentStatus'
    
        value 'not_scheduled'
        value 'scheduled'
        value 'not_prepared'
        value 'upcoming_collections'
        value 'collection_today'
        value 'collection_today_remaining'
        value 'collection_today_collected'
        value 'collection_tomorrow'
        value 'collection_yesterday'
        value 'collection_overdue'
        value 'collected'
        value 'not_collected'
      end
  
  end
  