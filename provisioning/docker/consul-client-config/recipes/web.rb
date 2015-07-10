#
# Cookbook Name:: consul-client-config
# Recipe:: web
#
# Copyright (c) 2015 CREATIONLINE,INC. All Rights Reserved.
#

cookbook_file '/etc/consul.d/web.json' do
  source 'web.json'
  owner 'root'
  group 'root'
  mode 0644
end

#
# [EOF]
#
