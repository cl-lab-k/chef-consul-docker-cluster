# CHEF_DRIVER=docker chef-client -z consul-server.rb

require 'chef/provisioning'

consul_server_config = JSON.parse(
  File.read(
    File.join(
      File.dirname(__FILE__),
      'atlas.json'
    )
  )
)

consul_server_config[ 'consul' ][ 'service_mode'     ] = 'cluster'
consul_server_config[ 'consul' ][ 'bootstrap_expect' ] = 3
consul_server_config[ 'consul' ][ 'serve_ui'         ] = true
consul_server_config[ 'consul' ][ 'client_address'   ] = '0.0.0.0'

#
# base
#
machine_image 'consul-server' do
  recipe 'consul::default'
  recipe 'consul::ui'
  attributes consul_server_config

  machine_options :docker_options => {
    :base_image => {
      :name       => 'ubuntu',
      :repository => 'ubuntu',
      :tag        => '14.04'
    }
  }
end

#
# consul
#
( '101' .. '103' ).each do |i|
  machine "consul#{i}" do
    from_image 'consul-server'

    machine_options :docker_options => {
      :command => '/usr/local/bin/consul agent -config-dir /etc/consul.d'
    }
  end
end

#
# [EOF]
#
