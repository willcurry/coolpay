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

  it "returns id when payment is made" do
    params = {:amount => 10, :currency => "GBP", :recipient_id => "fake id"}
    payment = handler.create_payment(params, "fake token")
    expect(payment["id"]).to eq("31db334f-9ac0-42cb-804b-09b2f899d4d2")
  end

  it "returns all payments" do
    expected_hash = {"id" => "31db334f-9ac0-42cb-804b-09b2f899d4d2",
                     "amount" => "10.50",
                     "currency" => "GBP",
                     "recipient_id" => "6e7b146e-5957-11e6-8b77-86f30ca893d3",
                     "status" => "paid"}
    expect(handler.get_all_payments("fake token")).to eq(expected_hash)
  end
end
