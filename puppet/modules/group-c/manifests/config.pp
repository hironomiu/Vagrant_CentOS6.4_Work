class group-c::config{
    include demogroup::config
    Class['demogroup::config'] ~> Class['group-c::config']
    user { 'group-c':
        ensure => present,
        gid => 'demogroup',
        comment => 'group-c',
        home => '/home/group-c',
        managehome => true,
        shell => '/bin/bash',
    }

    file { '/home/group-c/.ssh':
        ensure => directory,
        owner => 'group-c',
        group => 'demogroup',
        mode => '0700',
        require => User["group-c"]
    }

    exec { "group-c passwd" :
        user => 'root',
        path => ['/bin/','/usr/bin'],
        command => 'echo "group-c" | passwd --stdin group-c',
        timeout => 999,
        require => File['/home/group-c/.ssh']
    }

    exec { "group-c chmod" :
        user => 'root',
        path => ['/bin'],
        command => "chmod 755 /home/group-c",
        timeout => 999,
        require => Exec['group-c passwd']
    }
}
