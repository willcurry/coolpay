require 'httparty'
require 'json'

class CoolpayAPI
  BASE_URI = 'https://coolpay.herokuapp.com/api'

  def login
    body = {:username => ENV['COOLPAY_USERNAME'], 'apikey' => ENV['COOLPAY_APIKEY']}
    headers = {"Content-Type" => "application/x-www-form-urlencoded"}
    response = post_request("/login", body, headers)
    response["token"]
  end

  def get_all_recipients(token)
    headers = {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"}
    response = get_request("/recipients", headers)
    response["recipients"]
  end

  def create_recipient(name, token)
    body = {"recipient" => {"name" => name}}
    response = post_request("/recipients", body, post_headers)
    response["recipient"]
  end

  def create_payment(amount, currency, recipient_id)
    body = {"payment" => {"amount" => amount, "currency" => currency, "recipient_id" => recipient_id}}
    response = post_request("/payments", body, post_headers)
    response["payment"]
  end

  private

  def post_headers
    {"Content-Type" => "application/x-www-form-urlencoded", "Authorization" => "Bearer #{token}"}
  end

  def post_request(route, body, headers)
     response = HTTParty.post(BASE_URI + route,
                  :body => body,
                  :headers => headers)
     JSON.parse(response.body)
  end

  def get_request(route, headers)
    response = HTTParty.get(BASE_URI + route,
                  :headers => headers)
    JSON.parse(response.body)
  end
end
