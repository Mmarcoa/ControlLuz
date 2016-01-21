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
    s = TCPTimeout::TCPSocket.new session[:ip], 8000, connect_timeout: 10
    s.write "LightOn\n"
    sleep 0.05
    s.close
    rescue Errno::ECONNREFUSED
      flash[:notice] = "Hubo un error, vuelva a intentarlo"
      session[:ip] = nil
      redirect_to(root_path)
    rescue TCPTimeout::SocketTimeout
      flash[:notice] = "Su router pudo haber cambiado de IP, vuelva a intentarlo"
      session[:ip] = nil
      redirect_to(root_path)
  end

  def off
    require 'socket'
    unless session[:ip]
      redirect_to(root_path) and return
    end    
    s = TCPTimeout::TCPSocket.new session[:ip], 8000, connect_timeout: 10
    s.write "LightOff\n"
    sleep 0.05
    s.close
    rescue Errno::ECONNREFUSED
      flash[:notice] = "Hubo un error, vuelva a intentarlo"
      session[:ip] = nil
      redirect_to(root_path)
    rescue TCPTimeout::SocketTimeout
      flash[:notice] = "Su router pudo haber cambiado de IP, vuelva a intentarlo"
      session[:ip] = nil
      redirect_to(root_path)    
  end
  
  def verify
    require 'socket'
    
    s = TCPTimeout::TCPSocket.new session[:ip], 8000, connect_timeout: 10
    s.write "Verify\n"
    while line = s.read(3) # Read lines from socket
      if line == "Onn"
        redirect_to(on_path) and return
      elsif line == "Off"
        redirect_to(off_path) and return
      end         
    end
    s.close
    rescue Errno::ECONNREFUSED
      flash[:notice] = "Hubo un error, vuelva a intentarlo"
      session[:ip] = nil
      redirect_to(root_path)
    rescue TCPTimeout::SocketTimeout
      flash[:notice] = "Su router pudo haber cambiado de IP, vuelva a intentarlo"
      session[:ip] = nil
      redirect_to(root_path)        
  end
  
end
