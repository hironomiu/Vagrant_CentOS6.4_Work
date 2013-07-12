class demouser::config{
    include demogroup::config
    Class['demogroup::config'] ~> Class['demouser::config']

    user { 'demouser':
        ensure => present,
        gid => 'demogroup',
        comment => 'demouser',
        home => '/home/demouser',
        managehome => true,
        shell => '/bin/bash',
    }

    file { '/home/demouser/.ssh':
        ensure => directory,
        owner => 'demouser',
        group => 'demogroup',
        mode => '0700',
        require => User["demouser"]
    }

    exec { "passwd" :
        user => 'root',
        path => ['/bin/','/usr/bin'],
        command => 'echo "demouser" | passwd --stdin demouser',
        timeout => 999,
        require => File['/home/demouser/.ssh']
    }

    exec { "chmod" :
        user => 'root',
        path => ['/bin'],
        command => "chmod 755 /home/demouser",
        timeout => 999,
        require => Exec['passwd']
    }

    exec { "usermod apache" :
        user => 'root',
        path => ['/usr/sbin'],
        command => "usermod -G demogroup apache",
        timeout => 999,
        require => Exec['chmod']
    }
}
