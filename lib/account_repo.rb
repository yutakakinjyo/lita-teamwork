require 'singleton'

class AccountRepo

  include Singleton

  def initialize
    @accounts = {}
  end

  def find_by(name)
    @accounts[name]
  end

  def regist(login:, slack_name:)
    @accounts[login] = slack_name
  end

  def list
    @accounts
  end

  def delete(name)
    @accounts.delete(name)
  end

  def clear
    @accounts = {}
  end


end
