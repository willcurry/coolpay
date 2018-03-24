require 'json'
require 'http_requests'

class CoolpayAPI
  BASE_URI = "https://coolpay.herokuapp.com/api"
  CONTENT_TYPES = {:post => "application/x-www-form-urlencoded", :get => "application/json"}

  def initialize(http=HTTPRequests.new)
    @http = http
  end

  def login
    body = {:username => ENV['COOLPAY_USERNAME'], 'apikey' => ENV['COOLPAY_APIKEY']}
    headers = {"Content-Type" => "application/x-www-form-urlencoded"}
    response = @http.post(BASE_URI + "/login", body, headers)
    JSON.parse(response.body)["token"]
  end

  def get_all_recipients(token)
    get_request("/recipients", token, "recipients")
  end

  def create_recipient(name, token)
    body = {"recipient" => {"name" => name}}
    post_request("/recipients", body, token, "recipient")
  end

  def create_payment(amount, currency, recipient_id, token)
    body = {"payment" => {"amount" => amount, "currency" => currency, "recipient_id" => recipient_id}}
    post_request("/payments", body, token, "payment")
  end

  def get_all_payments(token)
    get_request("/payments", token, "payments")
  end

  def get_recipient_by_name(name, token)
    get_request("/recipients?name=#{name}", token, "recipients")
  end

  private

  def headers(type, token)
    {"Content-Type" => CONTENT_TYPES[type], "Authorization" => "Bearer #{token}"}
  end

  def post_request(route, body, token, index)
     response = @http.post(BASE_URI + route, body, headers(:post, token))
     JSON.parse(response.body)[index]
  end

  def get_request(route, token, index)
    response = @http.get(BASE_URI + route, headers(:get, token))
    JSON.parse(response.body)[index]
  end
end
