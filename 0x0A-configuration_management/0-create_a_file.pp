#creating a file in /tmp puppet
file {'school stuff':
  path     => 'tmp/school',
  mode     => '0744',
  owner    => 'www-data',
  group    => 'www-data',
  content  => 'I love Puppet',
}
