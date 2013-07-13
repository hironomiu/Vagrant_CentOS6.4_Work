class db-group_e{
    include db-group_e::install
    include db-group_e::config

       Class['db-group_e::install']
    -> Class['db-group_e::config']
}
