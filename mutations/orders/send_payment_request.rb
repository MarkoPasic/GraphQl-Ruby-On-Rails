module Mutations
    class Orders::SendPaymentRequest < BaseMutation
      argument :id, Int, required: true
  
      def resolve(id: nil)
        
        order = Order.find(id)
        
        if Current.user.admin || order.payment_request_last_sent_at.nil? || (order.payment_request_last_sent_at.present? && order.payment_request_last_sent_at < (Time.now - 1.day))
    
            CustomerMailer.with(order: order).payment_request.deliver_later
            order.payment_request_last_sent_at = Time.current
            order.save
            order = Order.find(id)
        else
            raise GraphQL::ExecutionError, "Payment Request Email Not Sent (Email was last sent less than 24 hours ago)" unless order
        end
           
        end
      
    end
  end