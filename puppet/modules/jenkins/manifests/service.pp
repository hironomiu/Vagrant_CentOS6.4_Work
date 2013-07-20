class jenkins::service {
    service{ 'jenkins':
        enable => true,
        ensure => running,
        hasrestart => true,
    }
}
