require 'coolpay_api'

class Recipients
  def initialize(coolpay_api=CoolpayAPI.new)
    @coolpay_api = coolpay_api
  end

  def set_token(token)
    @token = token
  end

  def create(params)
    fullname = params[:fullname]
    @coolpay_api.create_recipient(fullname, @token)
  end

  def get_all
    @coolpay_api.get_all_recipients(@token)
  end

  def get_by_name(params)
    fullname = params[:fullname]
    @coolpay_api.get_recipient_by_name(fullname, @token)
  end
end
