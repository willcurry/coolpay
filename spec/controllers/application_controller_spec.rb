ENV['RACK_ENV'] = 'test'

require 'controllers/application_controller'
require 'rack/test'

RSpec.describe ApplicationController do
  include Rack::Test::Methods

  def app
    ApplicationController.new
  end

  let (:auth) {Auth.new(CoolpayAPIMock.new)}

  before do
    ApplicationController.set :auth, auth
  end

  it "get / route returns ok response" do
    get "/"
    expect(last_response).to be_ok
  end
end
