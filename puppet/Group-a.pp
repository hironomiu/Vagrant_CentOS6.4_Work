user { 'group-a':
ensure => present,
gid => 'demogroup',
comment => 'group-a',
home => '/home/group-a',
managehome => true,
shell => '/bin/bash',
}

file { '/home/group-a/.ssh':
ensure => directory,
owner => 'group-a',
group => 'demogroup',
mode => '0700',
require => User["group-a"]
}

exec { "passwd" :
  user => 'root',
  path => ['/bin/','/usr/bin'],
  command => 'echo "group-a" | passwd --stdin group-a',
  timeout => 999,
  require => File['/home/group-a/.ssh']
}

exec { "chmod" :
  user => 'root',
  path => ['/bin'],
  command => "chmod 755 /home/group-a",
  timeout => 999,
  require => Exec['passwd']
}
