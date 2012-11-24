require 'time'

class Email
  attr_accessor :from_address, :to_address, :subject, :body

  def initialize(to_address, subject, body)
    self.to_address   = to_address
    self.subject      = subject
    self.body         = body
  end

  def headers
    raise "Must set `from_address` before getting headers!" unless from_address
  <<EOF
From: #{from_address}
To: #{to_address}
Subject: #{subject}
Date: #{Time.now.rfc2822}
EOF
  end

  def message
    headers + "\n" + body
  end

end
