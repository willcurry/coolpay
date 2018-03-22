require 'sinatra'
require_relative 'handler.rb'

class ApplicationController < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 2592000
  set :views, "#{settings.root}/../views"

  before do
    @handler = Handler.new
    session[:token] = @handler.get_token unless has_token?
  end

  get "/" do
    erb :index
  end

  post "/create-recipient" do
    @handler.create_recipient(params, token)
    redirect "/"
  end

  post "/create-payment" do
    @handler.create_payment(params, token)
    redirect "/"
  end

  private

  def token
    session[:token]
  end

  def has_token?
    !token.nil?
  end
end
