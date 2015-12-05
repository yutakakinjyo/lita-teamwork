module Lita
  module Handlers
    class Teamwork < Handler
      route(/list/, :list)
      route(/regist/, :regist)

      def regist
      end

      def list
      end

      Lita.register_handler(self)
    end
  end
end
