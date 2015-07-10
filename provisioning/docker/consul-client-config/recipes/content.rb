#
# Cookbook Name:: consul-client-config
# Recipe:: content
#
# Copyright (c) 2015 CREATIONLINE,INC. All Rights Reserved.
#

directory '/var/www/nginx-default' do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
end

template '/var/www/nginx-default/index.html' do
  source 'index.html.erb'
  owner 'root'
  group 'root'
  mode 0644
end

#
# [EOF]
#
