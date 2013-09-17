#!/usr/bin/env ruby

# function
def all_Domain_Name(nsServer=@ns2.nwt01.corp.tripadvisor.com)
  val = "" # the value to be returned
  cmd = `dig NS corp.tripadvisor.com #{nsServer} +short | grep ^ns1 | sort -k2,2 | sed -e 's/\.$//' | cut -d. -f2-`
  cmd.each do |line|
    val << line << ","
  end 
  val = val[0...-1]
  val = val.gsub(/\n/,"")
  puts val # prints the final string to the terminal, this need to be changed to a return statment if another needs the result

end

# Calling the function
all_Domain_Name ARGV[0]
