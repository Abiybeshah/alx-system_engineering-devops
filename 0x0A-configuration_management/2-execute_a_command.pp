#execute a commad with puppet

exec { 'pkill -f killmenow':
  path  => '/usr/bin/:/usr/local/bin/:/bin/',
}
