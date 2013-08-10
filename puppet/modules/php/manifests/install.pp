class php::install{
    yumrepo { 'php-remi':
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
        require => Yumrepo['php-remi'],
    }

    yumrepo { 'php-epel':
        descr => 'epel repo',
        mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch',
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     => 'https://fedoraproject.org/static/0608B895.txt',
    }

    package{
        [
        'php-mcrypt',
        ]:
        provider => 'yum',
        ensure => installed,
        require => Yumrepo['php-epel'],
    }
}
