class httpd::install{
    yumrepo { 'remi':
        descr => 'remi repo',
        mirrorlist => 'http://rpms.famillecollet.com/enterprise/6/remi/mirror',
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     => 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi',
    }

    package{
        [
        'httpd',
        ]:
        ensure => installed,
        require => Yumrepo['remi'],
    }
}
