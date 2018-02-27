#
# Cookbook:: node_info
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
 
nodes = search(:node, "*:*")
nodes.each do |node|
  Chef::Log.warn("#{node.name} has IP address #{node["ipaddress"]} & belongs to environment #{node.chef_environment}")
end

