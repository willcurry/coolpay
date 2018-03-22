require 'json'
require_relative 'http_requests.rb'

class CoolpayAPI
  BASE_URI = 'https://coolpay.herokuapp.com/api'

  def initialize
    @http = HTTPRequests.new
  end

  def login
    body = {:username => ENV['COOLPAY_USERNAME'], 'apikey' => ENV['COOLPAY_APIKEY']}
    headers = {"Content-Type" => "application/x-www-form-urlencoded"}
    post_request("/login", body, headers, "token")
  end

  def get_all_recipients(token)
    get_request("/recipients", get_headers(token), "recipients")
  end

  def create_recipient(name, token)
    body = {"recipient" => {"name" => name}}
    post_request("/recipients", body, post_headers(token), "recipient")
  end

  def create_payment(amount, currency, recipient_id, token)
    body = {"payment" => {"amount" => amount, "currency" => currency, "recipient_id" => recipient_id}}
    post_request("/payments", body, post_headers(token), "payment")
  end

  def get_all_payments(token)
    get_request("/payments", get_headers(token), "payments")
  end

  private

  def post_headers(token)
    {"Content-Type" => "application/x-www-form-urlencoded", "Authorization" => "Bearer #{token}"}
  end

  def get_headers(token)
    {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"}
  end

  def post_request(route, body, headers, index)
     response = @http.post(BASE_URI + route, body, headers)
     parsed_response = JSON.parse(response.body)
     parsed_response[index]
  end

  def get_request(route, headers, index)
    response = @http.get(BASE_URI + route, headers)
    parsed_response = JSON.parse(response.body)
    parsed_response[index]
  end
end
