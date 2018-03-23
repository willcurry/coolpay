require_relative '../lib/recipients.rb'
require_relative 'coolpay_api_mock.rb'

RSpec.describe Recipients do
  let(:recipients) {Recipients.new(CoolpayAPIMock.new)}

  it "returns a list of all recipients" do
    expected_hash = {"id"=>"fake id", "name"=>"fake name"}
    expect(recipients.get_all("fake token")).to eq(expected_hash)
  end

  it "returns recipient name and id upon creation" do
    expected_hash = {"id"=>"fake id", "name"=>"fake name"}
    params = {:fullname => "fake name"}
    expect(recipients.create(params, "fake token")).to eq(expected_hash)
  end

  it "returns the correct recipient on search by name" do
    expected_hash = {"id"=>"123", "name"=>"jake mcfriend"}
    params = {:fullname => "fake name"}
    expect(recipients.get_by_name(params, "fake token")).to eq(expected_hash)
  end
end
