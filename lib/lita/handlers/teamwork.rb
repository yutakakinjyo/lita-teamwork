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
        @ac_repo = AccountRepo.instance
        @hub_repo = GithubRepo.instance
      end

      def map(response)
        response.reply("map is empty") if @ac_repo.list.empty?
        @ac_repo.list.each do |key,value|
          response.reply("*#{value}* is *#{key}* in _GitHub_")
        end
      end

      def map_regist(response)
        @ac_repo.regist(login: response.match_data[1], slack_name: response.user.name)
        response.reply("set *#{response.user.name}* is *#{response.match_data[1]}* in _GitHub_")
      end

      def delete(response)
        login_name = @ac_repo.find_by(response.user.name)
        @ac_repo.delete(login_name)
        response.reply("delete *#{login_name}* from map")
      end

      def hub(response)
        response.reply(@hub_repo.name)
      end


      def hub_regist(response)
        @hub_repo.regist(response.match_data[1])
        response.reply("set *#{response.match_data[1]}* to repository")
      end

      def issues(response)
        client = HubClient.new
        account = Account.new
        issues = client.list_issues(@hub_repo.name)
        issues.each do |issue|
          response.reply "*`#{issue.title}`* _assignee_ *#{account.name(issue.assignee)}*" if issue.assignee
        end
      end

      Lita.register_handler(self)
    end
  end
end
