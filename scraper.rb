require 'json'
require 'turbotlib'
require './hello_kitty'

Turbotlib.log("Starting run...")

last_run = DateTime.parse(ENV['LAST_RUN_AT'])

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