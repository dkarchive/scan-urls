require 'awesome_bot'

FILE = 'temp'

c = File.read 'README.md'
links = AwesomeBot.links_find c
link = links[0]

require 'net/http'
      require 'uri'

      uri = URI.parse link

      Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https', :open_timeout => 10) do |http|
        

          request = Net::HTTP::Get.new uri
        
        response = http.request request
b = response.body

File.open (FILE, 'w') {|f| f.puts b}
puts "Wrote" + FILE
