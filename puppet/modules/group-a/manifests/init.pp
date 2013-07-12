class group-a{
    include group-a::install
    include group-a::config

       Class['group-a::install']
    -> Class['group-a::config']
}
