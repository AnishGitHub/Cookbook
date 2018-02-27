#
# Cookbook:: buildfile
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
remote_directory '/var/chef/cache/game-of-life' do
    source 'game-of-life'
     owner 'root'
     group 'root'
      mode '0755'
      action 'create'
end
