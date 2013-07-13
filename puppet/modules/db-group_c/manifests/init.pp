class db-group_c{
    include db-group_c::install
    include db-group_c::config

       Class['db-group_c::install']
    -> Class['db-group_c::config']
}
