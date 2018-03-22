require_relative 'coolpay_api.rb'

class Payments
  def initialize(coolpay_api=CoolpayAPI.new)
    @coolpay_api = coolpay_api
  end

  def create(params, token)
    amount = params[:amount]
    currency = params[:currency]
    recipient_id = params[:recipient_id]
    @coolpay_api.create_payment(amount, currency, recipient_id, token)
  end

  def get_all(token)
    @coolpay_api.get_all_payments(token)
  end
end
