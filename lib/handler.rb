require_relative 'coolpay_api.rb'

class Handler
  def initialize(coolpay_api=CoolpayAPI.new)
    @coolpay_api = coolpay_api
  end

  def get_token
    @coolpay_api.login
  end
end