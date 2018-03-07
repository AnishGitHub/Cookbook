#
# Cookbook:: dir_create
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
directory '/var/lib/jenkins' do
   owner 'root'
   group 'root'
   mode  '0777'
   action :create
end
