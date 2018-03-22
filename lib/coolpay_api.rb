require 'httparty'
require 'json'

class CoolpayAPI
  BASE_URI = 'https://coolpay.herokuapp.com/api/'
  def login
    response = HTTParty.post("#{BASE_URI}/login",
                  :body => {:username => ENV['COOLPAY_USERNAME'], 'apikey' => ENV['COOLPAY_APIKEY']},
                  :headers => {"Content-Type" => "application/x-www-form-urlencoded"})
    parsed_response = JSON.parse(response.body)
    parsed_response["token"]
  end

  def get_all_recipients(token)
    response = HTTParty.get("#{BASE_URI}/recipients",
                  :headers => {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})
    parsed_response = JSON.parse(response.body)
    parsed_response["recipients"]
  end

  def create_recipient(name, token)
    response = HTTParty.post("#{BASE_URI}/recipients",
                  :body => {"recipient" => {"name" => name}},
                  :headers => {"Content-Type" => "application/x-www-form-urlencoded", "Authorization" => "Bearer #{token}"})
    parsed_response = JSON.parse(response.body)
    parsed_response["recipient"]
  end
end
