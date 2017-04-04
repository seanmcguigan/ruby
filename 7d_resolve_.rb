require 'resolv'
require 'colorize'
# require 'colorize_string'

endpoints = File.readlines(ARGV[0]).collect(&:strip)

endpoints.map do |address|
	ip = Resolv.getaddress address

    puts ip =~ /^149.7.53|^84.45.95/ ? "%3s ".light_blue % "URL" + "%34s".light_green % ["#{address}"] + '  ' + "IP %-16s".yellow % ["#{ip}"] + ' ' + "-->   GS2".colorize(:color => :red, :background => :black) : ip =~ /^84.45.16/ ? "%3s ".light_blue % ["URL"] + "%34s".light_green % ["#{address}"] + '  ' + "IP %-16s".white % ["#{ip}"] + ' ' + "-->   CTR".light_blue : "%3s ".colorize(:color => :white, :background => :red) % "URL" + "%34s".colorize(:color => :white, :background => :red) % ["#{address}"] + "%2s".colorize(:color => :white, :background => :red) % '  ' + "IP %-16s".colorize(:color => :white, :background => :red) % ["#{ip}"] + "%2s".colorize(:color => :white, :background => :red) % ' ' + '-->   ip external to data centers'.colorize(:color => :white, :background => :red)
end.
