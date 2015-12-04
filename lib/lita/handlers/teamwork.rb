module Lita
  module Handlers
    class Teamwork < Handler
      route(/list/, :list)

      def list
      end

      Lita.register_handler(self)
    end
  end
end
