require 'spec_helper'

# Tested with arduino echo server on USB serial port driver
describe "Echo server test" do
  it "should send and receive data over serial port" do
    @data = nil
    serial_device = '/dev/tty.usbserial-A100QDRR'

    class Handler < EM::Connection
      def receive_data data
        @data = data
        EM.stop
        @data.should == "an"
      end
    end

    EM.run do
      EventMachine.open_serial(serial_device, 9600, 8, 1, SerialPort::NONE, Handler) do |serial|
        serial.send_data "an"
      end
    end
  end
end