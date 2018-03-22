require_relative '../lib/payments.rb'
require_relative 'coolpay_api_mock.rb'

RSpec.describe Payments do
  let(:payments) {Payments.new(CoolpayAPIMock.new)}

  it "returns an object containing an id when payment is made" do
    params = {:amount => 10, :currency => "GBP", :recipient_id => "fake id"}
    payment = payments.create(params, "fake token")
    expect(payment["id"]).to eq("31db334f-9ac0-42cb-804b-09b2f899d4d2")
  end

  it "returns all payments" do
    expected_hash = {"id" => "31db334f-9ac0-42cb-804b-09b2f899d4d2",
                     "amount" => "10.50",
                     "currency" => "GBP",
                     "recipient_id" => "6e7b146e-5957-11e6-8b77-86f30ca893d3",
                     "status" => "paid"}
    expect(payments.get_all("fake token")).to eq(expected_hash)
  end
end
