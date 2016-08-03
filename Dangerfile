# Check links
require 'json'
results = File.read 'ab-results-temp-markdown-table.json'
j = JSON.parse results
if j['error']==true
  fail j['title']
  markdown j['message']
end
