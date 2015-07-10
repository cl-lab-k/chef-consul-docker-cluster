#
# Cookbook Name:: chef-consul-docker-cluster
# Recipe:: default
#
# Copyright (c) 2015 CREATIONLINE,INC. All Rights Reserved.
#

docker_service 'default' do
  action [ :create, :start ]
end

group 'root' do
  action :modify
  members 'vagrant'
  append true
end

gem_package 'chef-provisioning-docker' do
  gem_binary '/opt/chefdk/embedded/bin/gem'
  options '--no-user-install'
end

#
# [EOF]
#
