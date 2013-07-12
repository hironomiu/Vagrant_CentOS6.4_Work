class demogroup::config{
    group { 'demogroup':
        ensure => present,
        gid => 505,
    }
}
