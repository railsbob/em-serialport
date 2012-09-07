module EventMachine
  class << self
    def connect_serial(dev, baud, databits, stopbits, parity)
      SerialPort.open(dev, baud, databits, stopbits, parity).uuid
    end

    def open_serial(dev, baud, databits, stopbits, parity, handler=nil)
      klass = if(handler and handler.is_a?(Class))
        handler
      else
        Class.new(Connection) {handler and include handler}
      end
      uuid          = connect_serial(dev, baud, databits, stopbits, parity)
      connection    = klass.new uuid
      @conns[uuid]  = connection
      block_given? and yield connection
      connection
    end
  end

  class SerialPort < StreamObject
    def self.open(dev, baud, databits, stopbits, parity)
      io = ::SerialPort.new(dev, baud, databits, stopbits, parity)
      self.new(io)
    end

    def initialize(io)
      super
    end
  end
end
