#
# Cookbook:: buildsetup
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
nodes = search(:node, "role:build")
nodes.each do |node|
  Chef::Log.warn("#{node.name} has IP address #{node["cloud"]["public_ipv4"]} & belongs to environment #{node.chef_environment}")
end
