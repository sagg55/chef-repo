#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'ntp' do
  action :install
end

#cookbook_file "/etc/ntp.conf" do
#  source "lx-ntp.conf"
#  mode "0644"
#end

template "/etc/ntp.conf" do
  source "ntp.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
     :server_list => node[:authorization][:sudo][:servers],
  })
end

 
 
service 'ntpd' do
  action [ :enable, :start ]
  end
