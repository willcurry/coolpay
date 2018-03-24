require "controllers/application_controller.rb"
require "recipients.rb"

class RecipientsController < ApplicationController
  configure do
    set :recipients, ::Recipients.new
  end

  before do
    settings.recipients.set_token(session[:token])
  end

  post "/create" do
    settings.recipients.create(params)
    redirect "/recipients"
  end

  post "/search" do
    @recipients_to_display = settings.recipients.get_by_name(params)
    erb :recipients
  end

  get "/" do
    @recipients_to_display = settings.recipients.get_all
    erb :recipients
  end
end
