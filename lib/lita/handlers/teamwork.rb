module Lita
  module Handlers
    class Teamwork < Handler

      route(/list/, :list)
      route(/regist\s+(.+)/, :regist)

      def regist(response)
        @repo = AccountRepo.instance
        response.reply("register \"" + response.user.name + "\" to " + response.match_data[1])
      end

      def list
      end

      Lita.register_handler(self)
    end
  end
end
