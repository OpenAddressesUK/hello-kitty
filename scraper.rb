require 'json'
require 'turbotlib'

Turbotlib.log("Starting run...")

datas = []
HelloKitty.uniques_since(nil).each do |token|
  datas.push HelloKitty.infer(token)
end

puts datas.inspect

#puts tokens
#puts JSON.dump(j)
