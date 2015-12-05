require "spec_helper"

describe Lita::Handlers::Teamwork, lita_handler: true do

  before(:each) do
    AccountRepo.instance.clear
  end

  it { is_expected.to route("list").to(:list) }
  it { is_expected.to route('regist yutaka').to(:regist) }
  it { is_expected.to route('delete').to(:delete) }
  it { is_expected.to route('issues').to(:issues) }

  it "regist" do
    send_message("regist yutaka")
    expect(replies.last).to eq("register \"" + user.name + "\" to yutaka")
  end

  it "list" do
    send_message("regist yutakakinjyo")
    send_message("list")
    expect(replies.last).to eq("*@Test User* is *yutakakinjyo* in _GitHub_")
  end

  it "delete" do
    send_message("regist yutakakinjyo")
    send_message("delete")
    expect(replies.last).to eq("delete yutakakinjyo from account map list")
  end

  it "isseus", :skip => true do
    send_message("regist yutakakinjyo")
    send_message("issues")
    expect(replies.last).to eq("issue for test assignee Test User")
  end


end
