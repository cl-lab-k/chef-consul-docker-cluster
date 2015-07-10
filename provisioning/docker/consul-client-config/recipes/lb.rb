#
# Cookbook Name:: consul-client-config
# Recipe:: lb
#
# Copyright (c) 2015 CREATIONLINE,INC. All Rights Reserved.
#

template '/etc/nginx/lb.ctmpl' do
  source 'lb.ctmpl.erb'
  owner 'root'
  group 'root'
  mode 0644
end

consul_template_config 'nginx_server' do
  templates [ {
    source: '/etc/nginx/lb.ctmpl',
    destination: '/etc/nginx/sites-available/default',
    command: '/usr/local/bin/supervisorctl nginx_server restart'
  } ]
end

supervisor_service 'consul_template' do
  action :enable
  autostart true
  command '/usr/local/bin/consul-template -config /etc/consul-template.d'
end

#
# [EOF]
#
