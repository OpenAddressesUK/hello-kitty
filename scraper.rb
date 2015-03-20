require 'json'
require 'turbotlib'

$:.unshift File.dirname(__FILE__)
require 'hello_kitty'

Turbotlib.log("Starting run...")

last_run = DateTime.parse(ENV['LAST_RUN_AT']) rescue (Time.now - 86400)

datas = []
HelloKitty.updates_since(last_run).each do |token|
  puts token
  new_data = HelloKitty.infer(token)
  puts new_data.length
  datas.concat new_data
end

datas.each do |data|
  puts JSON.dump(data)
end
