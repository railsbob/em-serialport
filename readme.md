# em-serialport

Eventmachine compatible asynchronous, ruby-serialport library.

## Installation

    gem install em-serialport

## Usage

If you are on Mac, you need to set up a virtual USB serial port by installing a driver from [http://www.ftdichip.com/Drivers/VCP.htm](http://www.ftdichip.com/Drivers/VCP.htm). Identify your serial port device. For ex: /dev/tty.usbserial-xxxxxxxx

    EM.run do
      serial = EventMachine.open_serial('/dev/tty.usbserial-xxxxxxxx', 9600, 8, 1, 0)
      serial.send_data "foo"

      serial.on_data do |data|
        # do something with data
      end
    end

