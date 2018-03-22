require 'json'

class CoolpayAPIMock

  def login
    JSON.parse(login_json_payload)['token']
  end

  def get_all_recipients(token)
    JSON.parse(get_recipients_payload)['recipients']
  end

  def create_recipient(name, token)
    payload = create_recipient_payload(name)
    JSON.parse(payload)['recipient']
  end

  private

  def login_json_payload
    {'token' => 'fake token'}.to_json
  end

  def get_recipients_payload
    {'recipients' => {'id' => 'fake id', 'name' => 'fake name'}}.to_json
  end

  def create_recipient_payload(name)
    {'recipient' => {'id' => 'fake id', 'name' => name}}.to_json
  end
end
