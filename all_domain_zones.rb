module Puppet::Parser::Functions

  newfunction(:all_Domain_Name, :type => :rvalue) do |args|
    val = ""
    if args[0] == nil
      cmd = `dig NS corp.tripadvisor.com @ns2.nwt01.corp.tripadvisor.com +short | grep ^ns1 | sort -k2,2 | sed -e 's/\.$//' | cut -d. -f2-`
      cmd.each do |line|
        val << line << ","
      end
    else
      cmd = `dig NS corp.tripadvisor.com #{args[0]} +short | grep ^ns1 | sort -k2,2 | sed -e 's/\.$//' | cut -d. -f2-`
      cmd.each do |line|
        val << line << "," 
      end
    end
    val = val[0...-1]
    val = val.gsub(/\n/,"")
    return val
  end

end
