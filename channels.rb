require 'agent'

chan = channel!(Integer)

go! do
  #the program should only end
  #when this goroutine ends
  sleep 10

  puts "Hello, world!"
  chan << 1
end

puts chan.receive.first
