#
# Cookbook Name:: consul-client-config
# Recipe:: default
#
# Copyright (c) 2015 CREATIONLINE,INC. All Rights Reserved.
#

execute 'apt-get update'

include_recipe 'supervisor::default'
include_recipe 'consul::default'
include_recipe 'nginx::default'

supervisor_service 'consul_client' do
  action :enable
  autostart true
  command '/usr/local/bin/consul agent -config-dir /etc/consul.d'
end

supervisor_service 'nginx_server' do
  action :enable
  autostart true
  command '/usr/sbin/nginx -g "daemon off;"'
end

#
# [EOF]
#
