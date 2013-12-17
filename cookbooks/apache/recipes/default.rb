#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do 
  action :install
end

service "httpd" do
  action [:start, :enable]
end

node['apache']['sites'].each do |site_name, site_data|
  document_root = "/srv/apache/#{site_name}"
  
  template "/etc/httpd/conf.d/#{site_name}.conf" do
    source "custom.erb"
    mode "0644"
    variables(
      :document_root  => document_root,
      :port           => site_data['port']
    )
    notifies :restart, "service[httpd]"
  end

  directory document_root do
    mode "0755"
    recursive true
  end

  template "#{document_root}/index.html" do
    source "index.html.erb"
    variables(
      :site_name  => site_name,
      :port       => site_data['port']
    )
    mode "0644"
  end
end
