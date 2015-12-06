module Lita
  module Handlers
    class Teamwork < Handler

      route(/^map$/, :map)
      route(/^map\s+(.+)/, :map_regist)
      route(/^delete$/, :delete)
      route(/^hub$/, :hub)
      route(/^hub\s+(.+)$/, :hub_regist)
      route(/^issues$/, :issues)

      def initialize(robot)
        super(robot)
        @repo = AccountRepo.instance
        @hub = GithubRepo.instance
      end

      def map(response)
        response.reply("map is empty") if @repo.list.empty?
        @repo.list.each do |key,value|
          response.reply("*#{value}* is *#{key}* in _GitHub_")
        end
      end

      def map_regist(response)
        @repo.regist(login: response.match_data[1], slack_name: response.user.name)
        response.reply("set *#{response.user.name}* is *#{response.match_data[1]}* in _GitHub_")
      end

      def delete(response)
        login_name = @repo.find_by(response.user.name)
        @repo.delete(login_name)
        response.reply("delete *#{login_name}* from map")
      end

      def hub(response)
        response.reply(@hub.name)
      end


      def hub_regist(response)
        @hub.regist(response.match_data[1])
        response.reply("set *#{response.match_data[1]}* to repository")
      end

      def issues(response)
        client = HubClient.new
        account = Account.new
        issues = client.list_issues(@hub.name)
        issues.each do |issue|
          response.reply "*`#{issue.title}`* _assignee_ *#{account.name(issue.assignee)}*" if issue.assignee
        end
      end

      Lita.register_handler(self)
    end
  end
end
