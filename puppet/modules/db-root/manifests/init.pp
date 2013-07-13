class db-root{
    include db-root::install
    include db-root::config

       Class['db-root::install']
    -> Class['db-root::config']
}
