require_relative 'coolpay_api.rb'

class Recipients
  def initialize(coolpay_api=CoolpayAPI.new, token)
    @coolpay_api = coolpay_api
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
