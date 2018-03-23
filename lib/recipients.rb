require_relative 'coolpay_api.rb'

class Recipients
  def initialize(coolpay_api=CoolpayAPI.new)
    @coolpay_api = coolpay_api
  end

  def create(params, token)
    fullname = params[:fullname]
    @coolpay_api.create_recipient(fullname, token)
  end

  def get_all(token)
    @coolpay_api.get_all_recipients(token)
  end

  def get_by_name(params, token)
    fullname = params[:fullname]
    @coolpay_api.get_recipient_by_name(fullname, token)
  end
end
