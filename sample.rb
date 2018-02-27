nodes = search(:node, "*:*")
nodes.each do |node|
  Chef::Log.warn("#{node.name} has IP address #{node["ipaddress"]}")
end
