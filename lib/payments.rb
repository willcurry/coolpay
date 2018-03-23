require_relative 'coolpay_api.rb'

class Payments
  def initialize(coolpay_api=CoolpayAPI.new, token)
    @coolpay_api = coolpay_api
    @token = token
  end

  def create(params)
    amount = params[:amount]
    currency = params[:currency]
    recipient_id = params[:recipient_id]
    @coolpay_api.create_payment(amount, currency, recipient_id, @token)
  end

  def get_by_id(params)
    id = params[:payment_id]
    @coolpay_api.get_all_payments(@token).select {|payment| payment["id"] == id}
  end

  def get_all
    @coolpay_api.get_all_payments(@token)
  end
end
