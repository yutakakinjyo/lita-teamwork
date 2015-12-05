require "spec_helper"

describe Lita::Handlers::Teamwork, lita_handler: true do

  before(:each) do
    AccountRepo.instance.clear
  end

  it { is_expected.to route("list") }
  it { is_expected.to route("list").to(:list) }

  it { is_expected.to route('regist yutaka') }
  it { is_expected.to route('regist yutaka').to(:regist) }

  it "regist" do
    send_message("regist yutaka")
    expect(replies.last).to eq("register \"" + user.name + "\" to yutaka")
  end

  it "list" do
    send_message("regist yutakakinjyo")
    send_message("list")
    expect(replies.last).to eq(user.name + " is yutakakinjyo in GitHub")
  end


end
