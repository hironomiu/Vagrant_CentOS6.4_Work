class mongodb::service {
    service{ 'mongod':
        enable => true,
        ensure => running,
        hasrestart => true,
    }
}
