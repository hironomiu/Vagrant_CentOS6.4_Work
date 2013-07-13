class db-group_b{
    include db-group_b::install
    include db-group_b::config

       Class['db-group_b::install']
    -> Class['db-group_b::config']
}
