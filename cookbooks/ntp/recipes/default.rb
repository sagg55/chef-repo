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

cookbook_file "/etc/ntp.conf" do
  source "lx-ntp.conf"
  mode "0644"
end

  
service 'ntpd' do
  action [ :enable, :start ]
  subscribes :restart, resources(:template, "/etc/ntp.conf"), :immediately
end
