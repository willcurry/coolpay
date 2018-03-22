require 'json'

class CoolpayAPIMock

  def login
    JSON.parse(login_json_payload)['token']
  end

  private

  def login_json_payload
    {'token' => 'fake token'}.to_json
  end
end
