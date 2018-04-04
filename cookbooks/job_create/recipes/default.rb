#
# Cookbook:: job_create
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
nodes = search(:node, "role:artifact")
nodes.each do |node|
  Chef::Log.warn("#{node.name} has IP address #{node["cloud"]["public_hostname"]} & belongs to environment #{node.chef_environment}")
ART = "#{node["cloud"]["public_hostname"]}"
end

template '/var/chef/cache/build_config.xml' do
      source 'build_config.xml.erb'
      owner 'root'
      group 'root'
      mode '0777'
      action :create
      variables(
      artifactoryUrl: "http://#{ART}:8081/artifactory"
)
end

nodes = search(:node, "role:test")
nodes.each do |node|
  Chef::Log.warn("#{node.name} has IP address #{node["cloud"]["public_ipv4"]} & belongs to environment #{node.chef_environment}")
TOM = "#{node["cloud"]["public_hostname"]}"
end

template '/var/chef/cache/build_config.xml' do
     source 'build_config.xml.erb'
     owner 'root'
     group 'root'
     mode '0777'
     action :create
     variables(
     url: "http://#{TOM}:8080")
end

xml = File.join(Chef::Config[:file_cache_path], 'build_config.xml')
jenkins_job 'sample' do
  config xml
  action :build
end
