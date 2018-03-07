#
# Cookbook:: job_test
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'java'
include_recipe 'jenkins::master'

#Install the plugins according to the versions
plugins = Hash.new( "plugins" )
plugins = {"ant" => "1.8", "apache-httpcomponents-client-4-api" => "4.5.3-2.1", "bouncycastle-api" => " 2.16.2", "config-file-provider" => "2.17", "credentials" => "2.1.16", "display-url-api" => "2.2.0", "maven-plugin" => "3.1","maven-artifact-choicelistprovider" => "1.2.4", "extensible-choice-parameter" => "1.4.2", "external-monitor-job" => "1.7", "artifactory" => "2.14.0", "git" => "3.8.0", "git-client" => "2.7.1", "gradle" => "1.28", "ivy" => "1.28", "javadoc" => "1.4", "ace-editor" => "1.1", "jquery-detached" => "1.2.1", "jsch" => "0.1.54.2", "junit" => "1.24", "ldap" => "1.20", "mailer" => "1.20", "matrix-auth" => "2.2", "matrix-project" => "1.12", "nodelabelparameter" => "1.7.2", "antisamy-markup-formatter" => "1.5", "pam-auth" => "1.3", "workflow-api" => "2.26", "workflow-cps" => "2.45", "workflow-job" => "2.12.2", "workflow-scm-step" => "2.6", "workflow-step-api" => "2.14", "workflow-support" => "2.18", "scm-api" => "2.2.6", "script-security" => "1.41", "ssh-agent" => "1.15", "ssh-credentials" => "1.13", "ssh" => "2.5", "ssh-slaves" => "1.26", "ssh2easy" => "1.4", "structs" => "1.14", "token-macro" => "2.3", "windows-slaves" => "1.3.1"}
plugins.each_with_index do |(plugin, ver), index|
jenkins_plugin "#{plugin}" do
   version "#{ver}"
   notifies :restart, 'service[jenkins]', :immediately
   end
end

# Create private key credentials
jenkins_private_key_credentials 'ubuntu' do
  id          'abc-key'
  description 'Usage of abc'
  private_key "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAqSZ2nicccqhmxZAlY4uUi42Deo/9JDOtVp+DM/U1hoHyK6wV5YWShLysiuwC
HXuN67F23MKZxTyp2qWK/ujo/VhN9Y7kGiv4wwVqH46vh1B2ysDG11c9Pw8w8NUuvpLsPjhpvl2q
Zg+VT3GL8pGnQESdyoi9GMNtezZkEqrNvUbNv1HqVYhl25Tn52wD7GxftdogoI8bjNHw84xUTRVd
nMKEM/rcEaRyNlgZBz9Vmym2U+a8Ve4DH83QzQlcrSPinoOZxKov5gVw+dc8VhF2p7EUmokijxZB
QnzvsxdM9YF83S54AKdpcZAyfNfXqRwfQUMPicTfOlyIU8sQAwvKrwIDAQABAoIBADjel67gk23x
NGxj5E4tlYm90GCanI9ZWIPxKVmErbRFaDhKqSn72KEMFi623pcu/S4rAj2Cp9Rqauj6E1tUz1Cu
KbfPjN1Hv2FCJsXpYRZrdSUB31hzGkJjRx8RbZ/hIdBhgxvfvfSGdLq7AERTuBmheDOp+Xmj6uEs
DkVAa9+grCyurGNFZzeBk7EEq8K7qg+SACHQqdYVJntur7xVnVjjAdw6dPLDSKoFt9C9BUgtOeNm
m0DeOKcXohzIjKAlzH7t/OJNEMJ0DnD/x6XYx8M/aXcTOr90KmyrFRdigSAp6dHRU4IcB3utFUIN
qD9rafk8REDfy6Oj5euXRV+e3bECgYEA374gBSyrKofhmprxijuuPB7BfzSOr6NqBRnmNVsCdU2h
YNrd1BGjz++UTWCD6L5m2rsZ+tqCujyRCgBpzQmkMwBuT2eCtzNSGRPLFINZHPpLWSSGyalyi0Fm
mvsUSiKNfGRPdhPAReZ3Nw+r8h+wOgadxu3/s3liYHhuLlNgH70CgYEAwYlyG/nV1jaHarudq4pQ
0uXMcMQhMIKAed3pMSbCX1J+omSE3Oef1gJ3pn2GBtyvgDL+W9myaw3B6NYelJR7nLG8Y3rCK3zZ
89oT9KMCjMxJ6NY5iWhWAioy6j4F7tUmB+k7JjpVVSJW5bu5eZzODgZ/2uTrS+uNaZmK1TKbdNsC
gYEApmlal36psHBwM/WaQR4ycTTO5jXJComYiULCHl0abvTWWptu8hRMqpOe0g4/DhTPm1Ad+p4b
LTlvBulXx9Cr9+MSKKzsZCYfodc+7HrlBNCEykCIn+UP9NMn5Y1pgdpBMYvKLiBymYrYkHNviB5Z
jE7ves35qRtXODlaeco5bGECgYBueyvs1H5Bvvcm8ttbJaZl/lDqvsvDiXwWFZwdNucWy10HDyLZ
iFAyN05eeKGeITT+lh2mCWxUuJHNfQ4P+4NlPAEzOMzHToqNLhzeNoAqKCS5CjHmQu12ZuiR175D
TOJc+cOOWxaDdwrsMnH6/oySbRtnte6sdFdRxRkAA9fCqQKBgFChRPGVP5SraTnLbrP1W/qdih+z
h8e4XIng2CFvjO9w94w/wh2FGinrPT0oeL028vQfcaGvHI4Bn7a44RToNNXu3PuQ0tVZHqPv93x2
+QstDit/LEqf8wKxuS1LmLCo6ewM1IkEkS4GMG9vR3a7N6cekjZCyE7Esxe4iwhe9uHl
-----END RSA PRIVATE KEY-----"
end

#jenkins slave via SSH
jenkins_ssh_slave  'test' do
    description    'test element for slave'
    remote_fs      '/var/lib/jenkins'
    labels         ['test']
#SSH specific attributes 
host               '54.234.10.124'
user               'ubuntu'
credentials        'abc-key'
launch_timeout     30
ssh_retries        5
ssh_wait_retries   60
end

jenkins_ssh_slave 'test' do
   action :online
    notifies :restart, 'service[jenkins]', :immediately
end
