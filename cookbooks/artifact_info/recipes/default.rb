#
# Cookbook:: artifact_info
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
nodes = search(:node, "role:artifact")
nodes.each do |node|
  Chef::Log.warn("#{node.name} has IP address #{node["cloud"]["public_hostname"]} & belongs to environment #{node.chef_environment}")
end
