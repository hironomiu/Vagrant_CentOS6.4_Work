class base{
    include base::install
    include base::config
    include base::service

       Class['base::install']
    -> Class['base::config']
    ~> Class['base::service']
}
