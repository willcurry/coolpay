require 'httparty'
require 'json'

class CoolpayAPI
  def login
    response = HTTParty.post("https://coolpay.herokuapp.com/api/login",
                  :body => {:username => ENV['COOLPAY_USERNAME'], 'apikey' => ENV['COOLPAY_APIKEY']},
                  :headers => {"Content-Type" => "application/x-www-form-urlencoded"})
    parsed_response = JSON.parse(response.body)
    parsed_response["token"]
  end
end
