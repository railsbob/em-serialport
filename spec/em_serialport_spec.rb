require 'spec_helper'

describe "EM::Serialport" do
  it "should use pure_ruby as library_type" do
    EventMachine.library_type.should eql(:pure_ruby)
  end

  it "should load dependencies" do
    defined?(EventMachine::StreamObject).should eql("constant")
    defined?(SerialPort).should eql("constant")
  end
end