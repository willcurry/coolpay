require_relative "application_controller.rb"
require_relative '../recipients.rb'

class RecipientsController < ApplicationController
  before do
    @recipients = Recipients.new
  end

  post "/create" do
    @recipients.create(params, session[:token])
    redirect "/recipients"
  end

  post "/search" do
    @recipients_to_display = @recipients.get_by_name(params, session[:token])
    erb :recipients
  end

  get "/" do
    @recipients_to_display = @recipients.get_all(session[:token])
    erb :recipients
  end
end
