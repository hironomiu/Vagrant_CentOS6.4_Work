class testrunner::install{
    include pear::install
    Class['pear::install'] -> Class['testrunner::install']

    exec { "testrunner" :
        user => 'root',
        path => ['/usr/bin','/bin'],
        command => "pear channel-discover pear.piece-framework.com",
        unless => "pear list-channels | grep pear.piece-framework.com",
        timeout => 999,
    }

    exec { "testrunner 2" :
        user => 'root',
        path => ['/usr/bin'],
        command => "pear install piece/stagehand_testrunner",
        unless => "pear info piece/stagehand_testrunner",
        timeout => 999,
        require => Exec['testrunner'],
    }
}
