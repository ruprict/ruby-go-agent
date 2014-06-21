require 'agent'

buffered_chan = channel!(Integer, 2)

#this goroutine makes Ruby think
#there isn't a deadlock
go! do
  loop do
  end
end

#should not block
buffered_chan << 1
puts 'added one message to buffered_chan'

#should not block
buffered_chan << 1
puts 'added one message to buffered_chan'

#will block
buffered_chan << 1
puts 'this should never print'