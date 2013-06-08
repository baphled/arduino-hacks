#!/usr/bin/env ruby
require "rubygems"
require "serialport"

sp = SerialPort.new "/dev/tty.usbserial-A601MZBI", 9600
sp.write "Hello there, I'm ruby. How are you doing?"
sp.close