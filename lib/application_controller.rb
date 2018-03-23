require 'sinatra'
require_relative 'auth.rb'
require_relative 'payments.rb'
require_relative 'recipients.rb'

class ApplicationController < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 2592000
  set :views, "#{settings.root}/../views"

  before do
    @recipients = Recipients.new
    @payments = Payments.new
    if !has_token?
      auth = Auth.new
      session[:token] = auth.get_token
    end
  end

  get "/" do
    erb :index
  end

  post "/create-recipient" do
    @recipients.create(params, token)
    redirect "/"
  end

  post "/create-payment" do
    @payments.create(params, token)
    redirect "/"
  end

  post "/search-recipient" do
    @found_recipients = @recipients.get_by_name(params, token)
    erb :recipient
  end

  private

  def token
    session[:token]
  end

  def has_token?
    !token.nil?
  end
end
