current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "anish95"
client_key               "#{current_dir}/anish95.pem"
chef_server_url          "https://api.chef.io/organizations/streetblues"
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:aws_access_key_id] = "AKIAJ2AY7YWAC5BX55OA"
knife[:aws_secret_access_key] = "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"
knife[:editor] = "/usr/bin/vim"

