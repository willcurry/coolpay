require 'coolpay_api'

RSpec.describe CoolpayAPI do
  let(:http) {HTTPRequestsMock.new}
  let(:api) {CoolpayAPI.new(http)}

  it "calls post request with correct body and headers on login" do
    expected_body = {:username=>ENV['COOLPAY_USERNAME'], "apikey"=>ENV['COOLPAY_APIKEY']}
    expected_headers = {"Content-Type"=>"application/x-www-form-urlencoded"}
    expect(http).to receive(:post).with("https://coolpay.herokuapp.com/api/login", expected_body, expected_headers).and_call_original
    api.login
  end

  it "calls get request with correct headers on get_all_recipients" do
    expected_headers = {"Content-Type"=>"application/json", "Authorization"=>"Bearer fake token"}
    expect(http).to receive(:get).with("https://coolpay.herokuapp.com/api/recipients", expected_headers).and_call_original
    api.get_all_recipients("fake token")
  end

  it "calls post request with correct body and headers on create_recipent" do
    expected_body = {"recipient"=>{"name"=>"fake name"}}
    expected_headers = {"Content-Type"=>"application/x-www-form-urlencoded", "Authorization"=>"Bearer fake token"}
    expect(http).to receive(:post).with("https://coolpay.herokuapp.com/api/recipients", expected_body, expected_headers).and_call_original
    api.create_recipient("fake name", "fake token")
  end

  it "calls get request with correct headers on get_all_payments" do
    expected_headers = {"Content-Type"=>"application/json", "Authorization"=>"Bearer fake token"}
    expect(http).to receive(:get).with("https://coolpay.herokuapp.com/api/payments", expected_headers).and_call_original
    api.get_all_payments("fake token")
  end

  it "calls post request with correct body and headers on create_payment" do
    expected_body = {"payment"=>{"amount"=>10, "currency"=>"GBP", "recipient_id"=>"fake id"}}
    expected_headers = {"Content-Type"=>"application/x-www-form-urlencoded", "Authorization"=>"Bearer fake token"}
    expect(http).to receive(:post).with("https://coolpay.herokuapp.com/api/payments", expected_body, expected_headers).and_call_original
    api.create_payment(10, "GBP", "fake id", "fake token")
  end

  it "calls get request with correct headers and correct uri on get_recipient_by_name" do
    expected_headers = {"Content-Type"=>"application/json", "Authorization"=>"Bearer fake token"}
    expect(http).to receive(:get).with("https://coolpay.herokuapp.com/api/recipients?name=fake name", expected_headers).and_call_original
    api.get_recipient_by_name("fake name", "fake token")
  end
end
