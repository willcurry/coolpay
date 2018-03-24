require "auth"
require "sinatra"

class ApplicationController < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 2592000
  set :views, File.expand_path('../../../views', __FILE__)

  configure do
    set :auth, ::Auth.new
  end

  before do
    if !has_token?
      session[:token] = settings.auth.get_token
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
