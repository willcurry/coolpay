require_relative "application_controller.rb"
require_relative '../payments.rb'

class PaymentsController < ApplicationController
  before do
    @payments = Payments.new
  end

  post "/create" do
    @payments.create(params, session[:token])
    redirect "/payments"
  end

  get "/" do
    @payments_to_display = @payments.get_all(session[:token])
    erb :payments
  end
end
