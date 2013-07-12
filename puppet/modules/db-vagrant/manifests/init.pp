class db-vagrant{
    include db-vagrant::install
    include db-vagrant::config

       Class['db-vagrant::install']
    -> Class['db-vagrant::config']
}
