require 'twilio-ruby'

class TwilioSender
  attr_accessor :account_sid, :auth_token, :from

  def initialize(account_sid, auth_token, from)
    self.account_sid = account_sid
    self.auth_token = auth_token
    self.from = from
  end

  def send(to, body)
    if REALLY_SENDING
      twilio_client.account.messages.create({
        :from => from,
        :to => to,
        :body => body,
      })
    else
      puts "**Testing: not really sending text messages\nThe message would be as follows:\n\n"
      puts "message: #{body}, to: #{to}"
      puts '========'
    end
  end

  def twilio_client
    @twilio_client ||= Twilio::REST::Client.new account_sid, auth_token
  end
end
