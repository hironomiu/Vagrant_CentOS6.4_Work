class php::install{
    include mysql::service
    Class['mysql::service'] ~> Class['php::install']
    yumrepo { 'remi':
        descr => 'remi repo',
        mirrorlist => 'http://rpms.famillecollet.com/enterprise/6/remi/mirror',
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     => 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi',
    }

    package{
        [
        'php',
        'php-cli',
        'php-pecl-apc',
        'php-common',
        'php-devel',
        'php-gd',
        'php-pdo',
        'php-pear',
        'php-xml',
        'php-mbstring',
        'php-mysql',
        ]:
        provider => 'yum',
        ensure => installed,
        require => Yumrepo['remi'],
    }
}
