require 'singleton'

class GithubRepo
  include Singleton

  def regist(repo)
    @hub_repo = repo
  end

  def name
    @hub_repo
  end

  def clear
    @hub_repo = nil
  end

end
