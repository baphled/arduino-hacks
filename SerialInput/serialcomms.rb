#!/usr/bin/env ruby
require "rubygems"
require "serialport"
require "twitter"
require "./config"

client = Twitter::Client.new

last_tweet = client.user_timeline.first.text
puts last_tweet
sp = SerialPort.new "/dev/tty.usbserial-A601MZBI", 9600
sp.write last_tweet
sp.close