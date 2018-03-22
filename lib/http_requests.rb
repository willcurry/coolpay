require 'httparty'

class HTTPRequests
  def post(uri, body, headers)
    HTTParty.post(uri, :body => body, :headers => headers)
  end

  def get(uri, headers)
    HTTParty.get(uri, :headers => headers)
  end
end
