require 'json'
require 'turbotlib'

$:.unshift File.dirname(__FILE__)
require 'hello_kitty'

Turbotlib.log("Starting run...")

last_run = DateTime.parse(ENV['LAST_RUN_AT']) rescue (Time.now - 86400)

HelloKitty.updates_since(last_run) do |token|
  HelloKitty.infer(token).each do |data|
    puts JSON.dump(data)
  end
end

