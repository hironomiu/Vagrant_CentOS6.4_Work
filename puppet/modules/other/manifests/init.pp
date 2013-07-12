class other{
    include other::install
    include other::config
    include other::service

       Class['other::install']
    -> Class['other::config']
    ~> Class['other::service']
}
