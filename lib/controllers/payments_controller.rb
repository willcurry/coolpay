require "controllers/application_controller.rb"
require "payments.rb"

class PaymentsController < ApplicationController
  before do
    @payments = Payments.new(session[:token])
  end

  post "/create" do
    @payments.create(params)
    redirect "/payments"
  end

  post "/search" do
    @payments_to_display = @payments.get_by_id(params)
    erb :payments
  end

  get "/" do
    @payments_to_display = @payments.get_all
    erb :payments
  end
end
