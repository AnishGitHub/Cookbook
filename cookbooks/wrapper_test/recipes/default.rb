#
# Cookbook:: wrapper_test
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'java'
include_recipe 'jenkins::master'
include_recipe 'maven'

#Install the plugins according to the versions
plugins = Hash.new( "plugins" )
plugins = {"maven-artifact-choicelistprovider" => "1.2.4", "maven-plugin" => "3.1", "artifactory" => "2.14.0", "git" => "3.7.0"}
plugins.each_with_index do |(plugin, ver), index|
jenkins_plugin "#{plugin}" do
   version "#{ver}"
   notifies :restart, 'service[jenkins]', :immediately
   end
end
