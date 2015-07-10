name             'consul-client-config'
maintainer       'CREATIONLINE,INC.'
maintainer_email 'd-higuchi@creationline.com'
license          'All rights reserved'
description      'Installs/Configures consul-client-config'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'supervisor'
depends 'nginx'
depends 'consul'
depends 'consul-template'
