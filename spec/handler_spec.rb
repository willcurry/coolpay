require_relative '../lib/handler.rb'
require_relative 'coolpay_api_mock.rb'

RSpec.describe Handler do
  let(:handler) {Handler.new(CoolpayAPIMock.new)}

  it "returns a token when initialised" do
    expect(handler.get_token).to eq("fake token")
  end

  it "returns a list of all recipients" do
    expected_hash = {"id"=>"fake id", "name"=>"fake name"}
    expect(handler.get_all_recipients("fake token")).to eq(expected_hash)
  end

  it "returns recipient name and id upon creation" do
    expected_hash = {"id"=>"fake id", "name"=>"fake name"}
    params = {:fullname => "fake name"}
    expect(handler.create_recipient(params, "fake token")).to eq(expected_hash)
  end
end
