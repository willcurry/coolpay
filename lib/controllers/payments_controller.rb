require_relative "application_controller.rb"
require_relative '../payments.rb'

class PaymentsController < ApplicationController
  before do
    @payments = Payments.new(session[:token])
  end

  post "/create" do
    @payments.create(params)
    redirect "/payments"
  end

  get "/" do
    @payments_to_display = @payments.get_all
    erb :payments
  end
end
