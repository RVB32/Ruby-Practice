module Puppet::Parser::Functions

  newfunction(:vlan_hosts_lookup, :type => :rvalue) do |args|
    domain = args[0]
    vlan = args[1]
    val = ""
    cmd = `host -l #{domain} ns1.nwt01.corp.tripadvisor.com`
    cmd.each do |line|
      if vlan != nil
        if line.match(/\d*\.\d*\.#{vlan}\.\d*/) 
          val << line.split(" ")[0] << "," 
        end
      else
        if line.match(/\d*\.\d*\.\d*\.\d*/)·
          val << line.split(" ")[0] << ","·
        end
      end
    end
    val = val[0...-1]
    return val
  end
end
