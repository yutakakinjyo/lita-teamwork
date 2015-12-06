require "spec_helper"

describe Lita::Handlers::Teamwork, lita_handler: true do

  before(:each) do
    AccountRepo.instance.clear
    GithubRepo.instance.clear
  end

  it { is_expected.to route("map").to(:map) }
  it { is_expected.to route('map githubname').to(:map_regist) }
  it { is_expected.to route('delete').to(:delete) }
  it { is_expected.to route('hub githubname').to(:hub_regist) }
  it { is_expected.to route('hub').to(:hub) }
  it { is_expected.to route('issues').to(:issues) }
  it { is_expected.to route('working').to(:working) }

  it "map" do
    send_message("map yutaka")
    expect(replies.last).to eq("set *#{user.name}* is *yutaka* in _GitHub_")
  end

  it "map" do
    send_message("map yutakakinjyo")
    send_message("map")
    expect(replies.last).to eq("*Test User* is *yutakakinjyo* in _GitHub_")
  end

  it "map is empty" do
    send_message("map")
    expect(replies.last).to eq("map is empty")
  end

  it "delete" do
    send_message("map yutakakinjyo")
    send_message("delete")
    expect(replies.last).to eq("delete *yutakakinjyo* from map")
  end

  it "set hub repo" do
    send_message("hub yutakakinjyo/lita-teamwork")
    expect(replies.last).to eq("set *yutakakinjyo/lita-teamwork* to repository")
  end

  it "hub name" do
    send_message("hub yutakakinjyo/lita-teamwork")
    send_message("hub")
    expect(replies.last).to eq("yutakakinjyo/lita-teamwork")
  end


  it "isseus", :skip => true do
    send_message("hub yutakakinjyo/lita-teamwork")
    send_message("map yutakakinjyo")
    send_message("issues")
    expect(replies.last).to eq("*`issue for test`* _assignee_ *Test User*")
  end

  it "working", :skip => true do
    send_message("hub yutakakinjyo/lita-teamwork")
    send_message("map yutakakinjyo")
    send_message("working")
    expect(replies.last).to eq("*`issue for test`* working _assignee_ *Test User*")
  end



end
