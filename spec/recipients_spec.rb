require 'recipients'

RSpec.describe Recipients do
  let(:recipients) {Recipients.new(CoolpayAPIMock.new)}

  before(:each) do
    recipients.set_token("fake token")
  end

  it "returns a list of all recipients" do
    expected = [{"id"=>"fake id", "name"=>"fake name"}]
    expect(recipients.get_all).to eq(expected)
  end

  it "returns recipient name and id upon creation" do
    expected_hash = {"id"=>"fake id", "name"=>"fake name"}
    params = {:fullname => "fake name"}
    expect(recipients.create(params)).to eq(expected_hash)
  end

  it "returns the correct recipient on search by name" do
    expected = [{"id"=>"123", "name"=>"jake mcfriend"}]
    params = {:fullname => "fake name"}
    expect(recipients.get_by_name(params)).to eq(expected)
  end
end
