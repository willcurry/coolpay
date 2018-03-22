require "sinatra"

use Rack::Session::Pool, :expire_after => 2592000

get "/" do
  erb :index
end
