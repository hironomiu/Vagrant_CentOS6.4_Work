class httpd-demouser{
    include httpd-demouser::install
    include httpd-demouser::config
    include httpd-demouser::service

       Class['httpd-demouser::install']
    -> Class['httpd-demouser::config']
    ~> Class['httpd-demouser::service']
}
