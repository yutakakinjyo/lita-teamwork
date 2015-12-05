require "spec_helper"

describe AccountRepo do

  before(:each) do
    @repo = AccountRepo.instance
    @repo.clear
  end
  
  it "regist account name" do
    @repo.regist(login: 'taro_github', slack_name: 'taro_slack')
    expect('taro_slack').to eq(@repo.find_by('taro_github'))
  end

  it "show list" do
    list = {'yutakakinjyo' => 'yutaka', 'taro_github' => 'taro_slack'}
    @repo.regist(login: 'yutakakinjyo', slack_name: 'yutaka')
    @repo.regist(login: 'taro_github', slack_name: 'taro_slack')
    expect(list).to eq(@repo.list)
  end

  it "delete account by key" do
    @repo.regist(login: 'yutakakinjyo', slack_name: 'yutaka')
    @repo.regist(login: 'taro_github', slack_name: 'taro_slack')

    @repo.delete('yutakakinjyo')
    expect(1).to eq(@repo.list.count)
  end

  


end        
