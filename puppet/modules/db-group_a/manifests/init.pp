class db-group_a{
    include db-group_a::install
    include db-group_a::config

       Class['db-group_a::install']
    -> Class['db-group_a::config']
}
