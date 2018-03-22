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

  def create_payment(params, token)
    amount = params[:amount]
    currency = params[:currency]
    recipient_id = params[:recipient_id]
    @coolpay_api.create_payment(amount, currency, recipient_id, token)
  end

  def get_all_payments(token)
    @coolpay_api.get_all_payments(token)
  end
end
