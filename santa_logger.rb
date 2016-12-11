class SantaLogger
  attr_accessor :sending

  def initialize(sending=false)
    @sending = sending
  end

  def log(message)
    puts "#{message}" unless @sending # Sshh! It's a secret!
  end
end
