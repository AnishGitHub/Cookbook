#
# Cookbook:: config
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
 
cookbook_file '/var/chef/cache/config.xml' do
    source 'config.xml'
     owner 'root'
      group 'root'
     mode '0755'
    action :create
end
