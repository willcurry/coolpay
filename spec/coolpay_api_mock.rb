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

  def create_payment(amount, currency, recipient_id, token)
    payload = create_payment_payload(amount, currency, recipient_id)
    JSON.parse(payload)['payment']
  end

  def get_all_payments(token)
    JSON.parse(get_payments_payload)['payments']
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

  def create_payment_payload(amount, currency, recipient_id)
    {"payment":
     {"id" => "31db334f-9ac0-42cb-804b-09b2f899d4d2",
      "amount" => amount,
      "currency" => currency,
      "recipient_id" => recipient_id,
      "status" => "processing"}
    }.to_json
  end

  def get_payments_payload
    {"payments" =>
     {"id" => "31db334f-9ac0-42cb-804b-09b2f899d4d2",
      "amount" => "10.50",
      "currency" => "GBP",
      "recipient_id" => "6e7b146e-5957-11e6-8b77-86f30ca893d3",
      "status" => "paid"}
    }.to_json
  end
end
