require 'octokit'
require 'dotenv'

class HubClient

  def initialize
    Dotenv.load
    @client = Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
    # @account = Account.new
    Octokit.auto_paginate = true
  end

  def list_issues(repo)
    @client.list_issues(repo)
    # puts issue.title + " " + @account.name(issue.assignee) if issue.assignee
  end

end
