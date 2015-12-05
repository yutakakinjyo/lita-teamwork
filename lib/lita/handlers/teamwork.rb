module Lita
  module Handlers
    class Teamwork < Handler

      route(/list/, :list)
      route(/regist\s+(.+)/, :regist)

      def list(response)
        @repo = AccountRepo.instance
        @repo.list.each do |key,value|
          response.reply(value + " is " + key + " in GitHub")
        end
      end

      def regist(response)
        @repo = AccountRepo.instance
        @repo.regist(login: response.match_data[1], slack_name: response.user.name)
        response.reply("register \"" + response.user.name + "\" to " + response.match_data[1])
      end


      Lita.register_handler(self)
    end
  end
end
