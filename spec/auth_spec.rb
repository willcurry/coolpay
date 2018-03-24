require 'auth'

RSpec.describe Auth do
  let(:auth) {Auth.new(CoolpayAPIMock.new)}

  it "returns a token when initialised" do
    expect(auth.get_token).to eq("fake token")
  end
end
