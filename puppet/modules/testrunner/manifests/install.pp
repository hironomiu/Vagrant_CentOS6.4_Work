class testrunner::install{
    include php::service
    Class['php::service'] ~> Class['testrunner::install']

    exec { "testrunner" :
        user => 'root',
        path => ['/usr/bin'],
        command => "pear channel-discover pear.piece-framework.com",
        timeout => 999,
    }

    exec { "testrunner 2" :
        user => 'root',
        path => ['/usr/bin'],
        command => "pear install piece/stagehand_testrunner",
        timeout => 999,
        require => [Exec['testrunner']],
    }
}
