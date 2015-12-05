require "spec_helper"

describe Lita::Handlers::Teamwork, lita_handler: true do

  before(:each) do
    AccountRepo.instance.clear
  end

  it { is_expected.to route("list").to(:list) }
  it { is_expected.to route('set githubname').to(:regist) }
  it { is_expected.to route('delete').to(:delete) }
  it { is_expected.to route('issues').to(:issues) }

  it "set" do
    send_message("set yutaka")
    expect(replies.last).to eq("set *@#{user.name}* is *yutaka* in _GitHub_")
  end

  it "list" do
    send_message("set yutakakinjyo")
    send_message("list")
    expect(replies.last).to eq("*Test User* is *yutakakinjyo* in _GitHub_")
  end

  it "list is empty" do
    send_message("list")
    expect(replies.last).to eq("list is empty")
  end


  it "delete" do
    send_message("set yutakakinjyo")
    send_message("delete")
    expect(replies.last).to eq("delete *yutakakinjyo* from list")
  end

  it "isseus", :skip => true do
    send_message("set yutakakinjyo")
    send_message("issues")
    expect(replies.last).to eq("*\"issue for test\"* _assignee_ *Test User*")
  end


end
