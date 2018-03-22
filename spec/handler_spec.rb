require_relative '../lib/handler.rb'
require_relative 'coolpay_api_mock.rb'

RSpec.describe Handler do
  it "returns a token when initialised" do
    handler = Handler.new(CoolpayAPIMock.new)
    expect(handler.get_token).to eq("fake token")
  end
end
