require 'net/smtp'

class Emailer

  attr_accessor :smtp_server, :domain, :account_address, :account_password, :port

  def initialize(smtp_server, domain, account_address, account_password, port = 587)
    self.smtp_server      = smtp_server
    self.domain           = domain
    self.account_address  = account_address
    self.account_password = account_password
    self.port             = port
  end

  def send(email)
    email.from_address = account_address

    if REALLY_SENDING
      print "Mailing #{email.to_address}..."

      Net::SMTP.enable_tls
      Net::SMTP.start(smtp_server, port, domain, account_address, password, :login) do |smtp| 
        smtp.send_message(email.message, email.from_address, email.to_address)
      end
      
      print "sent!\n"
    else
      puts "**Testing; not really mailing anything**\nEmail would be as follows:\n\n"
      puts email.message
      puts "======"
    end
  end
end
