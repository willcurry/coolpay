require_relative '../lib/handler.rb'
require_relative 'coolpay_api_mock.rb'

RSpec.describe Handler do
  it "returns a token when initialised" do
    handler = Handler.new(CoolpayAPIMock.new)
    expect(handler.get_token).to eq("fake token")
  end

  it "returns a list of all recipients" do
    handler = Handler.new(CoolpayAPIMock.new)
    expected_hash = {"id"=>"fake id", "name"=>"fake name"}
    expect(handler.get_all_recipients("fake token")).to eq(expected_hash)
  end
end
