require 'coolpay_api'

class Auth
  def initialize(coolpay_api=CoolpayAPI.new)
    @coolpay_api = coolpay_api
  end

  def get_token
    @coolpay_api.login
  end
end
