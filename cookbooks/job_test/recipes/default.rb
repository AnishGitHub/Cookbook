#
# Cookbook:: job_test
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'java'
include_recipe 'jenkins::master'

#Install the plugins according to the versions
plugins = Hash.new( "plugins" )
plugins = {"ant" => "1.8", "apache-httpcomponents-client-4-api" => "4.5.3-2.1", "bouncycastle-api" => " 2.16.2", "config-file-provider" => "2.18", "credentials" => "2.1.16", "display-url-api" => "2.2.0", "maven-plugin" => "3.1.2","maven-artifact-choicelistprovider" => "1.2.4", "extensible-choice-parameter" => "1.5.0", "external-monitor-job" => "1.7", "artifactory" => "2.15.1","deploy" => "1.13", "artifactdeployer" => "1.2", "git" => "3.8.0", "git-client" => "2.7.1", "gradle" => "1.28", "ivy" => "1.28", "javadoc" => "1.4", "ace-editor" => "1.1", "jquery-detached" => "1.2.1", "jsch" => "0.1.54.2", "junit" => "1.24", "ldap" => "1.20", "mailer" => "1.21", "matrix-auth" => "2.2", "matrix-project" => "1.12", "nodelabelparameter" => "1.7.2", "antisamy-markup-formatter" => "1.5", "pam-auth" => "1.3", "workflow-api" => "2.26", "workflow-cps" => "2.45", "workflow-job" => "2.12.2", "workflow-scm-step" => "2.6", "workflow-step-api" => "2.14", "workflow-support" => "2.18", "scm-api" => "2.2.6", "script-security" => "1.43", "ssh-agent" => "1.15", "ssh-credentials" => "1.13", "ssh" => "2.5", "ssh-slaves" => "1.26", "ssh2easy" => "1.4", "structs" => "1.14", "token-macro" => "2.4", "windows-slaves" => "1.3.1"}
plugins.each_with_index do |(plugin, ver), index|
jenkins_plugin "#{plugin}" do
   version "#{ver}"
   notifies :restart, 'service[jenkins]', :immediately
   end
end
#Fetching slave public ip
nodes = search(:node, "role:build")
nodes.each do |node|
  Chef::Log.warn("#{node.name} has IP address #{node["cloud"]["public_ipv4"]} & belongs to environment #{node.chef_environment}")
Ip = "#{node["cloud"]["public_ipv4"]}"
end

# Create private key credentials
jenkins_private_key_credentials 'ubuntu' do
  id          'ani-key'
  description 'Usage of ani'
  private_key "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAwfvEbRBT+J//7rYWz6jTT6qQ31LsfJM/EMJexe21UVeaH76SBkGfB5crS7UK
54yygYCl7MW++VGzUiBN6Fcl9m35w3zKJBqeMFso+N6WP9XSzMjoS5ghfmyTvaEVydwLaTuM8aH5
NoDyOp1bdqwTAkCuixsJJsTa+UQqGuvxJi9gVBSZ+ta6b501C7TRjhDmnytkcXeVH7Ek+n45+gIu
7VTKM1WqffUho3vmhKAJSZEGNdDE3bWKVotNy+FUeT1qlMuYIep07qLlgjgGsBiEkRpXjQWQIwOS
xZn/LimNuMnh6e7ClhuOVtEX7pJCOVBc4PDxn5OW5bfxncNQmAmMqQIDAQABAoIBAGpbvYZDBpdy
OqRKqFUxbrLmhUo9MDbZkSGCQO5q+BhiXLn9BhlyD1zdELsQx6rPZOxGejNI9P3EQvrLhYvXhJQK
FoCNwlNrWMKQqPVTLbRQa6Umnt8byXmE1LiLQuQLxyHqqcuukHLG3oku0ABQNpfsmQbiSvE7zAgR
zLg4F19kc/XrQG6Nd7FclckKhpquuwg2BsXMfXimvf4KUoe5EBemIxTpDXyR8vk4UggmUC0MZsWO
+d/WvmS9jlB6XMG5imOaEDx3f0YKmKLgbAtWujQcEB0ol285bXeGRpJwIbxzz/tVPo68t7VvIfJI
26n89HAg2kWYd21uC8jDHGQFc1ECgYEA50dq8GX6RPt70xsgTDOiTk6eysDQwkVPbRNcU8q72Ofe
GwkMaAIj11lsu84S8mZIlfvGgeT0eiO5ywagcDG+XcSoBHRQmm3ytialKKsMLkJspcErHUzI8Qfi
/nS2fsav0AUVzNoeUghe5CZQbvz/HJJnF7Ar/h6BCJcl77nzyn0CgYEA1rfRLcaMGBqulFVGF1vN
/DaGAqs8OhWMT3YNWwRTJ3G7JOxucjLBB0wxyElcTng2vFC2LTyPO9iYgiLeuS0c1Snf00Q4HbtF
2VPbiyTEe+dfi7NiGXhUsBUwkLXBBrhTj3s2fUo0NDvCj/1xI3FgEvAuZmkKeVbNhJZ8K60QNp0C
gYB7Cbpxc78FzcgdEbRH9bwl7pt5f8RPZbIQdBlNFnCCvy+gsFqiRmks2o0HCGV6AUIiUFRVrCkH
hVQFF1xo832zwrgjzoFG9rEFiF+a2Axd28aTE8XNC5lm6OwwtISVwzuq7dmgJnW07HEW7O8jbIKH
f7dKmdV9llrM6CQteX6hvQKBgQDBdiPSE8fcXAYafm7F0yDYc6PxOantR8cBPYOxE0d9Dbsp/KFS
4aoMUjm0lWzHAweGS06pmZwQtwpKjvKQdDY7VhxmdVv+ZeL8etMgHsOuQ/1RmRH1kvbzJFR6vliq
HmCjsceZwcchnQqjxB4xahC/X4rfGRun0m8gXJqKm8c0/QKBgGQN2trH1ekq8BTKNWWMPB2hiEwn
7DbeDwc5fnQzm4H0p1oyZhgOHmDFvIZhz/igS26pT4GIOyeTw/lz0Gc7WnVwqQj9Q5OjzBv1w5xJ
q3wKgvK8lx80wHw/xV6eu1Nwrop7tnBk5+JFVdsgASRlsCW625blwV4yF6cauh57Karm
-----END RSA PRIVATE KEY-----"
end

#jenkins slave via SSH
jenkins_ssh_slave  'test' do
    description    'test element for slave'
    remote_fs      '/var/lib/jenkins'
    labels         ['test']
#SSH specific attributes 
host                Ip
user               'ubuntu'
credentials        'ani-key'
launch_timeout     30
ssh_retries        5
ssh_wait_retries   60
end

jenkins_ssh_slave 'test' do
   action :online
    notifies :restart, 'service[jenkins]', :immediately
end
