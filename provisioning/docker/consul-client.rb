# CHEF_DRIVER=docker chef-client -z consul-client.rb

require 'chef/provisioning'

consul_client_config = JSON.parse(
  File.read(
    File.join(
      File.dirname(__FILE__),
      'atlas.json'
    )
  )
)

consul_client_config[ 'consul' ][ 'service_mode' ] = 'client'

#
# base
#
machine_image 'consul-client' do
  recipe 'consul-client-config::default'
  attributes consul_client_config

  machine_options :docker_options => {
    :base_image => {
      :name       => 'ubuntu',
      :repository => 'ubuntu',
      :tag        => '14.04'
    }
  }
end

#
# consul (web)
#
( '111' .. '113' ).each do |i|
  machine "consul#{i}" do
    from_image 'consul-client'

    recipe 'consul-client-config::web'
    recipe 'consul-client-config::content'

    machine_options :docker_options => {
      :command => '/usr/local/bin/supervisord --nodaemon'
    }
  end
end

#
# consul (lb)
#
machine "consul119" do
  from_image 'consul-client'

  recipe 'supervisor::default'
  recipe 'consul-template::default'
  recipe 'consul-client-config::lb'

  machine_options :docker_options => {
    :command => '/usr/local/bin/supervisord --nodaemon'
  }
end

#
# [EOF]
#
