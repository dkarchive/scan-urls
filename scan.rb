require 'awesome_bot'

r, f = ARGV

warn r
warn f

c = File.read r
links = AwesomeBot.links_find c
warn links
exit if links.count == 0
link = links[0]

warn link

require 'net/http'
require 'uri'

b = Net::HTTP.get(URI.parse(link))

warn b

File.write f, b
puts '👍'
