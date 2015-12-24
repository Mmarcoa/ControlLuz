class LightControlController < ApplicationController
  def welcome
  end

  def new
  end
  
  def on
  end

  def off
  end
  
  def verify
    require 'socket'
    
    s = TCPSocket.new '187.207.2.4', 8000
    s.puts "Verify\r\n"
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
