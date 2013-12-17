current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "nisheed_km"
client_key               "#{current_dir}/nisheed_km.pem"
validation_client_name   "exponent-validator"
validation_key           "#{current_dir}/exponent-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/exponent"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
