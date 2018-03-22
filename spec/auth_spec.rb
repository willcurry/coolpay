require_relative '../lib/auth.rb'
require_relative 'coolpay_api_mock.rb'

RSpec.describe Auth do
  let(:auth) {Auth.new(CoolpayAPIMock.new)}

  it "returns a token when initialised" do
    expect(auth.get_token).to eq("fake token")
  end
end
