#
# Cookbook:: job_create
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
cookbook_file 'var/chef/cache/build_config.xml' do
      source 'build_config.xml'
      owner 'root'
      group 'root'
      mode '0755'
      action :create
end

xml = File.join(Chef::Config[:file_cache_path], 'build_config.xml')
jenkins_job 'sample' do
  action :build
end
