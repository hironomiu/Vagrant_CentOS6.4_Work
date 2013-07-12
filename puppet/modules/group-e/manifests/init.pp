class group-e{
    include group-e::install
    include group-e::config

       Class['group-e::install']
    -> Class['group-e::config']
}
