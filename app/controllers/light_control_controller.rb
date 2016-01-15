class LightControlController < ApplicationController
  def welcome
  end

  def new
  end
  
  def on
    require 'socket'
    
    s = TCPSocket.new '187.207.57.43', 8000
    s.puts "LightOn\n"
    sleep 0.5
    s.close  
  end

  def off
    require 'socket'
    
    s = TCPSocket.new '187.207.57.43', 8000
    s.puts "LightOff\n"
    sleep 0.5
    s.close  
  end
  
  def verify
    require 'socket'
    
    s = TCPSocket.new '187.207.57.43', 8000
    s.puts "Verify\n"
    while line = s.gets # Read lines from socket
      if line == "On"
        redirect_to(on_path) and return
      elsif line == "Off"
        redirect_to(off_path) and return
      end         
    end
    s.close    
    redirect_to new_path
  end
end
