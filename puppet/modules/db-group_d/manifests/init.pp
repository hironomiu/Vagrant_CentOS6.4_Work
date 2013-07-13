class db-group_d{
    include db-group_d::install
    include db-group_d::config

       Class['db-group_d::install']
    -> Class['db-group_d::config']
}
