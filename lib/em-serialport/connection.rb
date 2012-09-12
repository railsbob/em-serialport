module EventMachine
  class Connection
    def on_data(&blk)
      @on_data = blk
    end

    def trigger_on_data(data)
      @on_data.call(data) if @on_data
    end

    def receive_data data
      trigger_on_data(data)
    end

    def associate_callback_target(sig)
      return(nil)
    end
  end
end
