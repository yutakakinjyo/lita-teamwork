require "spec_helper"

describe HubClient do

  before do
    @client = HubClient.new
  end

  it "list_issues" , :skip => true do
    issue = @client.list_issues("yutakakinjyo/lita-teamwork")[0]
    expect("issue for test").to eq(issue.title)
  end

  it "list_issues option", :skip => true  do
    issue = @client.list_issues("yutakakinjyo/lita-teamwork", {labels: "Working"})[0]
    expect("issue for test").to eq(issue.title)
  end


end
