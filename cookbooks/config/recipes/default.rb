#
# Cookbook:: config
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
 
cookbook_file '/var/lib/jenkins/config.xml' do
    source 'config.xml'
     owner 'root'
      group 'root'
     mode '0755'
    action :create
end

cookbook_file 'var/lib/jenkins/hudson.tasks.Maven.xml' do
     source 'hudson.tasks.Maven.xml'
     owner 'root'
     group 'root'
     mode '0755'
     action :create
end

cookbook_file 'var/lib/jenkins/org.jfrog.hudson.ArtifactoryBuilder.xml' do 
    source 'org.jfrog.hudson.ArtifactoryBuilder.xml'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end
