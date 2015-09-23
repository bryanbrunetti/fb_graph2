module FbGraph2
  class Edge
    module SubscribedApps
      def subscribed_apps(*args)
        params = args.extract_options!
        events = self.edge :subscribed_apps, params, edge_scope: args.first
        events.collect! do |app|
          App.new(app[:id], app).authenticate self.access_token
        end
      end
    end
  end
end