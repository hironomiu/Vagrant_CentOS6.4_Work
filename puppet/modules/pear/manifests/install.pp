class pear::install{
    include php::service
    Class['php::service'] -> Class['pear::install']

    exec { "pear" :
        user => 'root',
        cwd => '/',
        path => ['/usr/bin','/bin'],
        command => "pear config-set auto_discover 1 system",
        unless => "pear config-get auto_discover system | grep 1",
    }

    exec {"pear-phpunit":
        user => 'root',
        cwd => '/',
        path => ['/usr/bin'],
        command => "pear install --alldeps pear.phpunit.de/PHPUnit",
        unless => "pear info pear.phpunit.de/PHPUnit",
        timeout => 999,
        require => Exec['pear'],
    }

    exec {"pear-phing":
        user => 'root',
        cwd => '/',
        path => ['/usr/bin'],
        command => "pear install pear.phing.info/phing",
        unless => "pear info pear.phing.info/phing",
        timeout => 999,
        require => Exec['pear-phpunit'],
    }
}
