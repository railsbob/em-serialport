$eventmachine_library = :pure_ruby
require 'eventmachine'
require 'serialport'

%w(serial_port connection).each do |file|
  require "em-serialport/#{file}"
end