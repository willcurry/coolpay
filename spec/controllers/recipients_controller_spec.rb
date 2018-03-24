ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'controllers/recipients_controller'
require 'recipients'

RSpec.describe RecipientsController do
  include Rack::Test::Methods

  let (:recipients) {Recipients.new(CoolpayAPIMock.new)}

  def app
    RecipientsController.new
  end

  before do
    RecipientsController.set :recipients, recipients
  end

  it "post /create redirects" do
    post "/create"
    expect(last_response.status).to eq(302)
  end

  it "get / displays recipients" do
    get "/"
    expect(last_response.body).to include("<td>fake name</td>")
  end

  it "post /search displays recipient searched and not any other" do
    post "/search", {:fullname => "fake name"}
    expect(last_response.body).to include("<td>jake mcfriend</td>")
  end
end
