class pecl::config{
    file { '/etc/php.ini':
        owner => 'root', group => 'root',
        ensure => file,
        content => template('pecl/php.ini'),
    }
}
