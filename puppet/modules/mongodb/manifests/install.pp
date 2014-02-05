class mongodb::install{
    yumrepo { 'mongodb-repo':
        descr => 'mongodb-repo',
        baseurl => 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/',
        enabled => 1,
        gpgcheck => 0,
    }

    package{
        [
        'mongo-10gen',
        'mongo-10gen-server',
        ]:
        ensure => installed,
        require => Yumrepo['mongodb-repo'],
    }
}
