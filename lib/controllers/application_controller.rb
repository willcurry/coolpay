require "auth"
require "sinatra"

class ApplicationController < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 2592000
  set :views, File.expand_path('../../../views', __FILE__)

  before do
    if !has_token?
      auth = Auth.new
      session[:token] = auth.get_token
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
