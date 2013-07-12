class httpd{
    include httpd::install
    include httpd::config
    include httpd::service

       Class['httpd::install']
    -> Class['httpd::config']
    ~> Class['httpd::service']
}
