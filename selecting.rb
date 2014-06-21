require 'agent'
require 'socket'

#this example involves selecting between 
#two channels.

$string_chan = channel!(String, 1)
$int_chan = channel!(Integer, 1)

def process_chan
  loop do
    select! do |s|
      s.case($string_chan, :receive) do |value|
        puts "Received string: ", value
      end

      s.case($int_chan, :receive) do |value|
        puts "Received integer: ", value
      end
    end
  end
end

go! do
  process_chan
end

$string_chan << "hello"
$int_chan << 18
$string_chan << "world"

#in a typical design, this would not actually
#be here; more or less specific to this example
loop do
end

