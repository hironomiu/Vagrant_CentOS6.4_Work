class group-a::config{
    include demogroup::config
    Class['demogroup::config'] ~> Class['group-a::config']
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

    exec { "group-a passwd" :
        user => 'root',
        path => ['/bin/','/usr/bin'],
        command => 'echo "group-a" | passwd --stdin group-a',
        timeout => 999,
        require => File['/home/group-a/.ssh']
    }

    exec { "group-a chmod" :
        user => 'root',
        path => ['/bin'],
        command => "chmod 755 /home/group-a",
        timeout => 999,
        require => Exec['group-a passwd']
    }
}
