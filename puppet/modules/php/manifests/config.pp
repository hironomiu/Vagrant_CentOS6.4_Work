class php::config {
    file { '/etc/php.ini':
        owner => 'root', group => 'root',
        content => template('/vagrant/puppet/modules/php/templates/php.ini'),
    }
}
