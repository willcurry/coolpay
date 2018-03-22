require 'sinatra'
require_relative 'handler.rb'

class ApplicationController < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 2592000
  set :views, "#{settings.root}/../views"

  before do
    if !has_token? then
      handler = Handler.new
      session[:token] = handler.get_token
    end
  end

  get "/" do
    erb :index
  end

  private

  def has_token?
    !session[:token].nil?
  end
end
