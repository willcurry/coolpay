require "controllers/application_controller.rb"
require "payments.rb"

class PaymentsController < ApplicationController
  configure do
    set :payments, ::Payments.new
  end

  before do
    settings.payments.set_token(session[:token])
  end

  post "/create" do
    settings.payments.create(params)
    redirect "/payments"
  end

  post "/search" do
    @payments_to_display = settings.payments.get_by_id(params)
    erb :payments
  end

  get "/" do
    @payments_to_display = settings.payments.get_all
    erb :payments
  end
end
