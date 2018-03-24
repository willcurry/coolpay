require 'payments'

RSpec.describe Payments do
  let(:payments) {Payments.new(CoolpayAPIMock.new)}

  before(:each) do
    payments.set_token("fake token")
  end

  it "returns an object containing an id when payment is made" do
    params = {:amount => 10, :currency => "GBP", :recipient_id => "fake id"}
    payment = payments.create(params)
    expect(payment["id"]).to eq("31db334f-9ac0-42cb-804b-09b2f899d4d2")
  end

  it "returns all payments" do
    expected = [{"id" => "31db334f-9ac0-42cb-804b-09b2f899d4d2",
      "amount" => "10.50",
      "currency" => "GBP",
      "recipient_id" => "6e7b146e-5957-11e6-8b77-86f30ca893d3",
      "status" => "paid"},
    {"id" => "41db334f-9ac0-42cb-804b-09b2f899d4d2",
      "amount" => "20.50",
      "currency" => "GBP",
      "recipient_id" => "6e7b146e-5957-11e6-8b77-86f30ca893d3",
      "status" => "failed"}]
    expect(payments.get_all).to eq(expected)
  end

  it "returns payment with matching id" do
    params = {:payment_id => "31db334f-9ac0-42cb-804b-09b2f899d4d2"}
    payment = payments.get_by_id(params)
    expect(payment.first["id"]).to eq("31db334f-9ac0-42cb-804b-09b2f899d4d2")
  end
end
