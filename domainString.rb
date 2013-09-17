#!/usr/bin/env ruby

# This function finds all hosts on a specific vlan at a specific zone
def FQDN (domain, vlan)
  val = "" # the value to be returned
  cmd = `host -l #{domain} ns1.nwt01.corp.tripadvisor.com`
  cmd.each do |line|
  if line.match(/\d*\.\d*\.#{vlan}\.\d*/) # regx to find the specific command
    val << line.split(" ")[0] << ","
  end
  end
  val = val[0...-1]
  puts val # prints the final string to the terminal, this need to be changed to a return statment if another needs the result
end

# calling the function
FQDN ARGV[0], ARGV[1]
