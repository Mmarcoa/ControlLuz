class LightControlController < ApplicationController

  def new
    require 'socket'
    session[:ip] ||= TCPSocket.gethostbyname("light-control.duckdns.org")[3]
  end
  
  def on
    require 'socket'
    unless session[:ip]
      redirect_to(root_path) and return
    end
    s = TCPSocket.new session[:ip], 8000
    s.puts "LightOn\n"
    sleep 0.05
    s.close  
  end

  def off
    require 'socket'
    unless session[:ip]
      redirect_to(root_path) and return
    end    
    s = TCPSocket.new session[:ip], 8000
    s.puts "LightOff\n"
    sleep 0.05
    s.close  
  end
  
  def verify
    require 'socket'
    
    s = TCPSocket.new session[:ip], 8000
    s.puts "Verify\n"
    while line = s.gets # Read lines from socket
      if line == "On"
        redirect_to(on_path) and return
      elsif line == "Off"
        redirect_to(off_path) and return
      end         
    end
    s.close    
    redirect_to root_path
  end
end
