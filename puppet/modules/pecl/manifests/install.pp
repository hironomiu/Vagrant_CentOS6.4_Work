class pecl::install{
    include php::service
    Class['php::service'] -> Class['pecl::install']

    exec { "pecl" :
        user => 'root',
        cwd => '/',
        path => ['/usr/bin','/bin'],
        command => "pecl install mongo",
        onlyif => "pecl list  mongo | grep 'not installed'",
    }

}
