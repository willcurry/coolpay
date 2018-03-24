ENV['RACK_ENV'] = 'test'

require 'controllers/payments_controller'
require 'rack/test'
require 'payments'

RSpec.describe PaymentsController do
  include Rack::Test::Methods

  let (:payments) {Payments.new(CoolpayAPIMock.new)}

  def app
    PaymentsController.new
  end

  before do
    PaymentsController.set :payments, payments
  end

  it "post /create redirects" do
    post "/create"
    expect(last_response.status).to eq(302)
  end

  it "get / displays payments" do
    get "/"
    expect(last_response.body).to include("<td>31db334f-9ac0-42cb-804b-09b2f899d4d2</td>")
    expect(last_response.body).to include("<td>41db334f-9ac0-42cb-804b-09b2f899d4d2</td>")
  end

  it "post /search displays payment searched and not any other" do
    post "/search", {:payment_id => "41db334f-9ac0-42cb-804b-09b2f899d4d2"}
    expect(last_response.body).to include("<td>41db334f-9ac0-42cb-804b-09b2f899d4d2</td>")
    expect(last_response.body).to_not include("<td>31db334f-9ac0-42cb-804b-09b2f899d4d2</td>")
  end
end
