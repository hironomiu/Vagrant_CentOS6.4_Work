class group-d::config{
    include demogroup::config
    Class['demogroup::config'] ~> Class['group-d::config']
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

    exec { "group-d passwd" :
        user => 'root',
        path => ['/bin/','/usr/bin'],
        command => 'echo "group-d" | passwd --stdin group-d',
        timeout => 999,
        require => File['/home/group-d/.ssh']
    }

    exec { "group-d chmod" :
        user => 'root',
        path => ['/bin'],
        command => "chmod 755 /home/group-d",
        timeout => 999,
        require => Exec['group-d passwd']
    }
}
