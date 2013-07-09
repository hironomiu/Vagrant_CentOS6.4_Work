user { 'group-d':
ensure => present,
gid => 'demogroup',
comment => 'group-d',
home => '/home/group-d',
managehome => true,
shell => '/bin/bash',
}

file { '/home/group-d/.ssh':
ensure => directory,
owner => 'group-d',
group => 'demogroup',
mode => '0700',
require => User["group-d"]
}

exec { "passwd" :
  user => 'root',
  path => ['/bin/','/usr/bin'],
  command => 'echo "group-d" | passwd --stdin group-d',
  timeout => 999,
  require => File['/home/group-d/.ssh']
}

exec { "chmod" :
  user => 'root',
  path => ['/bin'],
  command => "chmod 755 /home/group-d",
  timeout => 999,
  require => Exec['passwd']
}
