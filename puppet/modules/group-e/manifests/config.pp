class group-e::config{
    include demogroup::config
    Class['demogroup::config'] ~> Class['group-e::config']
    user { 'group-e':
        ensure => present,
        gid => 'demogroup',
        comment => 'group-e',
        home => '/home/group-e',
        managehome => true,
        shell => '/bin/bash',
    }

    file { '/home/group-e/.ssh':
        ensure => directory,
        owner => 'group-e',
        group => 'demogroup',
        mode => '0700',
        require => User["group-e"]
    }

    exec { "group-e passwd" :
        user => 'root',
        path => ['/bin/','/usr/bin'],
        command => 'echo "group-e" | passwd --stdin group-e',
        timeout => 999,
        require => File['/home/group-e/.ssh']
    }

    exec { "group-e chmod" :
        user => 'root',
        path => ['/bin'],
        command => "chmod 755 /home/group-e",
        timeout => 999,
        require => Exec['group-e passwd']
    }
}
