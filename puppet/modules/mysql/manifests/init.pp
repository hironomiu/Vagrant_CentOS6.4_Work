class mysql{
    include mysql::install
    include mysql::config
    include mysql::service
    include mysql::user

       Class['mysql::install']
    -> Class['mysql::config']
    ~> Class['mysql::service']
    ~> Class['mysql::user']
}
