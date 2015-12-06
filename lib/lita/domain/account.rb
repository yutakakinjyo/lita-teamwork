class Account

  def initialize
    @ac_repo = AccountRepo.instance
  end

  def name(assignee)
    return "no one" if assignee.nil?
    account_mapping(assignee.login)
  end

  private

  def account_mapping(login)
    account = @ac_repo.find_by(login)
    account ? account : login
  end

end

