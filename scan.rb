require 'awesome_bot'

FILE = 'temp'

c = File.read 'README.md'
links = AwesomeBot.links_find c
link = links[0]

warn link

 

require 'net/http'
require 'uri'

def open(url)
  Net::HTTP.get(URI.parse(url))
end

b = open link
 

      
warn b

File.write FILE, b
puts "Wrote temp"
