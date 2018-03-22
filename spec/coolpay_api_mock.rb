require 'json'

class CoolpayAPIMock

  def login
    JSON.parse(login_json_payload)['token']
  end

  def get_all_recipients(token)
    JSON.parse(recipients_payload)['recipients']
  end

  private

  def login_json_payload
    {'token' => 'fake token'}.to_json
  end

  def recipients_payload
    {'recipients' => {'id' => 'fake id', 'name' => 'fake name'}}.to_json
  end
end
