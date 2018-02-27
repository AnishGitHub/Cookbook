#
# Cookbook:: my_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

template "/tmp/logrotate.conf" do
  source "logrotate.conf.erb"
  variables(
    how_often: "daily",
    keep: "31"
  )
end
