require 'json'
require 'turbotlib'

Turbotlib.log("Starting run...")

jess = 'http://jess.openaddressesuk.org/infer'
source = 'https://alpha.openaddressesuk.org/'
source = 'https://alpha.openaddressesuk.org/addresses.json?street=greenfinch+way&town=Horsham'

response = HTTPClient.new.get source
j = JSON.parse(response.content)

#postcodes = j['addresses'].uniq { |a| a['postcode']['name'] }
tokens = j['addresses'].map { |p| p['url'].split('/').last }

datas = []

tokens.each do |token|
  response = HTTPClient.new.post jess, "token=#{token}"
  datas.push response.content
end

puts datas.inspect

#puts tokens
#puts JSON.dump(j)
