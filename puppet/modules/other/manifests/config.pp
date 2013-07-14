class other::config{
    include httpd::service
    Class['httpd::service'] ~> Class['other::config']
    file { '/etc/httpd/conf/httpd.conf':
        owner => 'root', group => 'root',
        content => template('other/httpd.conf'),
    }
}
