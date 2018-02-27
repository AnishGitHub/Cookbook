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
plugins = {"ant" => "1.8", "apache-httpcomponents-client-4-api" => "4.5.3-2.1", "bouncycastle-api" => " 2.16.2", "config-file-provider" => "2.17", "credentials" => "2.1.16", "display-url-api" => "2.2.0", "maven-plugin" => "3.1","maven-artifact-choicelistprovider" => "1.2.4", "extensible-choice-parameter" => "1.4.2", "artifactory" => "2.14.0", "git" => "3.8.0", "git-client" => "2.7.1", "gradle" => "1.28", "ivy" => "1.28", "javadoc" => "1.4", "ace-editor" => "1.1", "jquery-detached" => "1.2.1", "jsch" => "0.1.54.2", "junit" => "1.24", "mailer" => "1.20", "matrix-project" => "1.12", "workflow-api" => "2.26", "workflow-cps" => "2.45", "workflow-job" => "2.12.2", "workflow-scm-step" => "2.6", "workflow-step-api" => "2.14", "workflow-support" => "2.18", "scm-api" => "2.2.6", "script-security" => "1.41", "ssh-credentials" => "1.13", "structs" => "1.14", "token-macro" => "2.3"}
plugins.each_with_index do |(plugin, ver), index|
jenkins_plugin "#{plugin}" do
   version "#{ver}"
   notifies :restart, 'service[jenkins]', :immediately
   end
end
