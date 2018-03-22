require_relative 'response_mock.rb'

class HTTPRequestsMock
  def post(uri, body, headers)
    ResponseMock.new
  end

  def get(uri, headers)
    ResponseMock.new
  end
end
