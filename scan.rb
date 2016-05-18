require 'awesome_bot'

if ARGV.count==0
    puts 'usage: scan <input> <output>'
    exit 
end

r, f = ARGV
f = 'temp' if f.nil?

warn 'input: ' + r
warn 'output: ' + f

c = File.read r
links = AwesomeBot.links_find c
warn 'links:' + links

if links.count == 0
    puts 'no links found'
    exit 
end

link = links[0]
warn 'link: ' + link

require 'net/http'
require 'uri'

b = Net::HTTP.get(URI.parse(link))
warn b

puts 'Writing ' + f
File.write f, b
puts '👍 '
