module Lita
  module Handlers
    class Teamwork < Handler

      route(/list/, :list)
      route(/regist\s+(.+)/, :regist)
      route(/delete/, :delete)
      route(/issues/, :issues)

      def initialize(robot)
        super(robot)
        @repo = AccountRepo.instance
      end

      def list(response)
        @repo.list.each do |key,value|
          response.reply(value + " is " + key + " in GitHub")
        end
      end

      def regist(response)
        @repo.regist(login: response.match_data[1], slack_name: response.user.name)
        response.reply("register \"" + response.user.name + "\" to " + response.match_data[1])
      end

      def delete(response)
        login_name = @repo.find_by(response.user.name)
        @repo.delete(login_name)
        response.reply("delete " + login_name + " from account map list")
      end

      def issues(response)
        client = HubClient.new
        account = Account.new
        issues = client.list_issues("yutakakinjyo/lita-teamwork")
        issues.each do |issue|
          response.reply issue.title + " assignee " + account.name(issue.assignee) if issue.assignee
        end
      end

      Lita.register_handler(self)
    end
  end
end
