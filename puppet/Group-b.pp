user { 'group-b':
ensure => present,
gid => 'demogroup',
comment => 'group-b',
home => '/home/group-b',
managehome => true,
shell => '/bin/bash',
}

file { '/home/group-b/.ssh':
ensure => directory,
owner => 'group-b',
group => 'demogroup',
mode => '0700',
require => User["group-b"]
}

exec { "passwd" :
  user => 'root',
  path => ['/bin/','/usr/bin'],
  command => 'echo "group-b" | passwd --stdin group-b',
  timeout => 999,
  require => File['/home/group-b/.ssh']
}

exec { "chmod" :
  user => 'root',
  path => ['/bin'],
  command => "chmod 755 /home/group-b",
  timeout => 999,
  require => Exec['passwd']
}
