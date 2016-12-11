require 'rubygems'
require 'bundler/setup'
Bundler.require

class Email
  attr_accessor :from_address, :to_address, :subject, :body
  attr_reader :sending
  Dotenv.load

  def initialize(to_address, subject, body, sending: false)
    @from_address = ENV.fetch('DEFAULT_FROM')
    @to_address   = to_address
    @subject      = subject
    @body         = body
    @sending      = sending
  end

  def send # First, instantiate the Mailgun Client with your API key
    if sending
      print "Mailing #{@to_address}..."
      mg_client = Mailgun::Client.new(ENV.fetch('MAILGUN_API_KEY'))
      message_params = { from:     @from_address,
                         to:       @to_address,
                         subject:  @subject,
                         text:     @body }

      # Send your message through the client
      mg_client.send_message ENV.fetch('SENDING_DOMAIN'), message_params
    else
      debug_output(@from_address, @to_address, @subject, @body)
    end
  end

  private

  def debug_output(from, to, subject, body)
    puts %(
            **Testing; not really mailing anything**
            from: #{from}
            to: #{to}
            subject: #{subject}
            #{body}
          )
  end
end
