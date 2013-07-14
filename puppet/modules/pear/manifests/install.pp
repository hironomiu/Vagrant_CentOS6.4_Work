class pear::install{
    include php::service
    Class['php::service'] -> Class['pear::install']

    exec { "pear" :
        user => 'root',
        cwd => '/',
        path => ['/usr/bin'],
        command => "pear channel-discover pear.phpunit.de",
    }

    exec { "pear 2" :
        user => 'root',
        cwd => '/',
        path => ['/usr/bin'],
        command => "pear channel-discover components.ez.no",
        require => Exec['pear']
    }

    exec { "pear 3" :
        user => 'root',
        cwd => '/',
        path => ['/usr/bin'],
        command => "pear channel-discover pear.symfony-project.com",
        require => Exec['pear 2']
    }

    exec { "pear 4" :
        user => 'root',
        cwd => '/',
        path => ['/usr/bin'],
        command => "pear channel-discover pear.symfony.com",
        require => Exec['pear 3']
    }

    exec { "pear 5" :
        user => 'root',
        cwd => '/',
        path => ['/usr/bin'],
        command => "pear install channel://pear.symfony.com/Yaml",
        timeout => 999,
        require => Exec['pear 4']
    }

    exec {"pear install phpunit":
        user => 'root',
        cwd => '/',
        path => ['/usr/bin'],
        command => "/usr/bin/pear install phpunit/PHPUnit",
        timeout => 999,
        require => Exec['pear 5'],
    }
}
