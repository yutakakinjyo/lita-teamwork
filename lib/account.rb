require 'account_repo'

class Account

  def initialize
    @repo = AccountRepo.new
  end

  def name(assignee)
    return "no one" if assignee.nil?
    account_mapping(assignee.login)
  end

  private

  def account_mapping(login)
    account = @repo.find_by(login)
    account ? account : login
  end

end
