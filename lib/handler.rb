require_relative 'coolpay_api.rb'

class Handler
  def initialize(coolpay_api=CoolpayAPI.new)
    @coolpay_api = coolpay_api
  end

  def get_token
    @coolpay_api.login
  end

  def get_all_recipients(token)
    @coolpay_api.get_all_recipients(token)
  end

  def create_recipient(params, token)
    fullname = params[:fullname]
    @coolpay_api.create_recipient(fullname, token)
  end
end
