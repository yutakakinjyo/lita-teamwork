module Lita
  module Handlers
    class Teamwork < Handler

      route(/^list$/, :list)
      route(/^set\s+(.+)/, :regist)
      route(/^delete$/, :delete)
      route(/^issues$/, :issues)

      def initialize(robot)
        super(robot)
        @repo = AccountRepo.instance
      end

      def list(response)
        response.reply("list is empty") if @repo.list.empty?
        @repo.list.each do |key,value|
          response.reply("*#{value}* is *#{key}* in _GitHub_")
        end
      end

      def regist(response)
        @repo.regist(login: response.match_data[1], slack_name: response.user.name)
        response.reply("set *#{response.user.name}* is *#{response.match_data[1]}* in _GitHub_")
      end

      def delete(response)
        login_name = @repo.find_by(response.user.name)
        @repo.delete(login_name)
        response.reply("delete *#{login_name}* from list")
      end

      def issues(response)
        client = HubClient.new
        account = Account.new
        issues = client.list_issues("yutakakinjyo/lita-teamwork")
        issues.each do |issue|
          response.reply "*`#{issue.title}`* _assignee_ *#{account.name(issue.assignee)}*" if issue.assignee
        end
      end

      Lita.register_handler(self)
    end
  end
end
