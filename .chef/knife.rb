current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "anish95"
client_key               "#{current_dir}/anish95.pem"
chef_server_url          "https://api.chef.io/organizations/streetblues"
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:aws_access_key_id] = "AKIAIGVBZACHCPL6H2EA"
knife[:aws_secret_access_key] = "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"
knife[:editor] = "/usr/bin/vim"

