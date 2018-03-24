require "controllers/application_controller.rb"
require "recipients.rb"

class RecipientsController < ApplicationController
  before do
    @recipients = Recipients.new(session[:token])
  end

  post "/create" do
    @recipients.create(params)
    redirect "/recipients"
  end

  post "/search" do
    @recipients_to_display = @recipients.get_by_name(params)
    erb :recipients
  end

  get "/" do
    @recipients_to_display = @recipients.get_all
    erb :recipients
  end
end
