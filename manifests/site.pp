node default {

  class { 'nginx': } ->

  class { 'postgresql::server': } ->

  deploy::file { 'jdk-7u65-linux-x64.tar.gz':
    target  => '/opt/java',
    url     => 'http://localhost',
    strip   => true,
    require => Class['nginx::service'],
  } ->

  class { 'stash':
    downloadURL => 'http://localhost/',
    javahome    => '/opt/java',
    proxy          => {
      scheme       => 'http',
      proxyName    => '192.168.33.10',
      proxyPort    => '80',
    },
  }

  nginx::resource::vhost { 'all':
    server_name      => [ 'localhost', '127.0.0.1' ],
    www_root         => '/vagrant/files',
  }

  nginx::resource::upstream { 'stash':
    ensure  => present,
    members => [ 'localhost:7990' ],
  }

  nginx::resource::vhost { '192.168.33.10':
    ensure               => present,
    server_name          => [ 'stash', 'stash.home', 'stash.example.com', '192.168.33.10' ],
    listen_port          => '80',
    proxy                => 'http://stash',
    proxy_read_timeout   => '300',
    location_cfg_prepend => {
      'proxy_set_header X-Forwarded-Host'   => '$host',
      'proxy_set_header X-Forwarded-Server' => '$host',
      'proxy_set_header X-Forwarded-For'    => '$proxy_add_x_forwarded_for',
      'proxy_set_header Host'               => '$host',
      'proxy_redirect'                      => 'off',
    }
  }

  postgresql::server::db { 'stash':
    user     => 'stash',
    password => postgresql_password('stash', 'password'),
  }

}
