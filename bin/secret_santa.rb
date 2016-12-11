#!/usr/bin/env ruby

require_relative '../lib/secret_santa'

# Do some testing, then set this to true when ready to send
# Will cause logging output to be shushed and mails to be sent
REALLY_SENDING = ENV.fetch('REALLY_SENDING', false).downcase == true

@logger = SantaLogger.new(REALLY_SENDING)

people_config = YAML.load_file('config/people.yml')

people = people_config['people'].map do |attrs|
  Person.new(attrs)
end

santas = people.dup
people.each do |person|
  your_santa = santas.delete_at(SecureRandom.random_number(santas.size))
  person.santa = your_santa if your_santa
end

@logger.log 'Initial Santa assignments:'
people.each do |person|
  @logger.log person.with_santa
end

# This is the nice part of Dennis's solution: if there are any invalid
# assignments, they are corrected in as few passes as possible. (I
# originally said "a single pass", but that's not true because the
# `select` that looks for someone to swap santas with is just a
# way of saying "loop through the list of people looking for a match.")
# This works because corrections are made in a way that ensures no new
# invalid assignments are created.
@logger.log 'Checking assignments for validity'
people.each do |person|
  next unless person.santa.can_be_santa_of?(person)
  @logger.log "\n#{person} can't get a gift from #{person.santa}! Let's try to fix that..."
  swap_candidates = people.select { |p| person.can_swap_santas_with?(p) }
  raise "Failure! No one can swap santas with #{person}" if swap_candidates.empty?
  @logger.log "Any of these can swap santas with #{person}: #{swap_candidates.map(&:to_s)}"
  swapper = swap_candidates.sample
  @logger.log "Chose #{swapper} to swap santas with #{person}"
  misplaced_santa = person.santa
  person.santa    = swapper.santa
  swapper.santa   = misplaced_santa
end

@logger.log "\n\nFinal Santa assignments:"
people.each do |person|
  @logger.log person.with_santa
end
template_filepath = '../../lib/secret_santa/letter_template.erb'
template = File.read(File.expand_path(template_filepath, __FILE__))
people.each do |person|
  recipient_name = person.santa.name
  target_name    = person.name
  message        = ERB.new(template).result(binding)
  email = Email.new(
    person.santa.email,
    ENV.fetch('DEFAULT_SUBJECT'),
    message,
    sending: REALLY_SENDING
  )
  email.send
end
