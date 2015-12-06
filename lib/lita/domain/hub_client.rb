require 'octokit'
require 'dotenv'

class HubClient

  def initialize
    Dotenv.load
    @client = Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
    Octokit.auto_paginate = true
  end

  def list_issues(repo, option={})
    @client.list_issues(repo, option)
  end

end
