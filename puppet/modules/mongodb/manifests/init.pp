class mongodb{
    include mongodb::install
    include mongodb::config
    include mongodb::service

       Class['mongodb::install']
    -> Class['mongodb::config']
    ~> Class['mongodb::service']
}
