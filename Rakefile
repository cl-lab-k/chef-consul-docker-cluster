#
# Rakefile Name:: vms
#
# Copyright (c) 2015 CREATIONLINE,INC. All Rights Reserved.
#

#
# berks
#
desc 'berks vendor'
task :vendor do
  sh 'berks vendor cookbooks'
end

#
# vagrant
#
desc 'vagrant up'
task :up do
  sh 'vagrant up'
end

#
# scp
#
desc 'scp'
task :scp do
  current_dir = File.dirname(__FILE__)
  sh "scp -i #{current_dir}/.vagrant/machines/default/virtualbox/private_key -P 2222 -r #{current_dir}/provisioning/docker vagrant@127.0.0.1:"
end

#
# destroy
#
desc 'vagrant destroy'
task :destroy do
  sh 'vagrant destroy -f'
end

task :default => [ :vendor, :up, :scp ]

#
# [EOF]
#
