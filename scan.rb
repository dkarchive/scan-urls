require 'awesome_bot'

if ARGV.count==0
    puts 'usage: scan <input> <output>'
    exit 
end

SKIP = [
'https://github.com/dkhamsing/awesome_bot', 
'https://github.com/dkhamsing/scan-urls/pull/3',
'https://github.com/dkhamsing',
'https://twitter.com/dkhamsing'
]

r, f = ARGV
f = 'temp' if f.nil?

warn 'input: ' + r
warn 'output: ' + f

c = File.read r

SKIP.each do |x|
  c = c.sub x, ''
end

links = AwesomeBot.links_find c
warn 'links:' + links.to_s

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
