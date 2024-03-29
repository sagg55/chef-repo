#
# Cookbook Name:: apache-tutorial-2
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package_name = 'apache2'
service_name = 'apache2'
document_root = '/var/www'

if platform_family? 'rhel'
  package_name = 'httpd'
  service_name = 'httpd'
  document_root = '/var/www/html/chef-tutorial'
end


package package_name do
  action :install
end

service service_name do
  action [ :enable, :start ]
end


cookbook_file "#{document_root}/index.html" do
  source 'index.html'
  mode '0644'
end
