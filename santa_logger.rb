class SantaLogger
  
  attr_accessor :sending

  def log(message)
    puts "#{message}" unless REALLY_SENDING # Sshh! It's a secret!
  end

end
