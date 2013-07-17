class httpd-demouser::config{
    include httpd::service
    Class['httpd::service'] ~> Class['httpd-demouser::config']
    file { '/etc/httpd/conf/httpd.conf':
        owner => 'root', group => 'root',
        content => template('httpd-demouser/httpd.conf'),
    }
}
