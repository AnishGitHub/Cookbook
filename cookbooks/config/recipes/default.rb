#
# Cookbook:: config
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
nodes = search(:node, "role:artifact")
nodes.each do |node|
  Chef::Log.warn("#{node.name} has IP address #{node["cloud"]["public_hostname"]} & belongs to environment #{node.chef_environment}")
ART = "#{node["cloud"]["public_hostname"]}"
end
 
template '/var/lib/jenkins/config.xml' do
    source 'config.xml.erb'
     owner 'root'
      group 'root'
     mode '0777'
    action :create
end

template '/var/lib/jenkins/hudson.tasks.Maven.xml' do
     source 'hudson.tasks.Maven.xml.erb'
     owner 'root'
     group 'root'
     mode '0777'
     action :create
end

template '/var/lib/jenkins/org.jfrog.hudson.ArtifactoryBuilder.xml' do 
    source 'org.jfrog.hudson.ArtifactoryBuilder.xml.erb'
    owner 'root'
    group 'root'
    mode '0777'
    action :create
    variables(
     url: "http://#{ART}:8081/artifactory"
)
end
