module FbGraph2
  class Edge
    module Subscriptions
      def subscriptions(params = {})
        subscriptions = self.edge :subscriptions, params
        subscriptions.collect! do |subscription|
          Struct::Subscription.new subscription
        end
      end

      def subscription!(params = {})
        self.post params, edge: :subscriptions
      end
    end
  end
end