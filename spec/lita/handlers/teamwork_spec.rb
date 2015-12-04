require "spec_helper"

describe Lita::Handlers::Teamwork, lita_handler: true do

  it { is_expected.to route("list")}
  it { is_expected.to route("list").to(:list)}

end
