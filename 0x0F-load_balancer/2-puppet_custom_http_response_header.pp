# custom HTTP header in a ngnix header
exec { 'update server':
  command  => 'apt-get update',
  user     => 'root',
  provider => 'shell',
}
->
# install nginx web server on server
package { 'nginx':
  ensure   => present,
  provider => 'apt'
}
->
# custom Nginx response header (X-Served-By: hostname)
file_line { 'add HTTP header':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'add_header X-Served-By $hostname;'
}
->
# start the service
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx']
}
