require 'spec_helper'

# Tested with arduino echo server on USB serial port driver
describe "Echo server test" do
  it "should send and receive data over serial port" do
    @data = nil
    serial_device = '/dev/tty.usbserial-A100QDRR'

    EM.run do
      serial = EventMachine.open_serial(serial_device, 9600, 8, 1, SerialPort::NONE)
      serial.send_data "an"

      serial.on_data do |data|
        data.should == "an"
        EM.stop
      end
    end
  end
end