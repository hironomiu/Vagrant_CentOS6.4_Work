class other::config{
    include httpd::service
    Class['httpd::service'] ~> Class['other::config']
    file { '/etc/httpd/conf/httpd.conf':
        owner => 'root', group => 'root',
        source => '/vagrant/puppet/modules/other/templates/httpd.conf',
    }
}
