class group-b{
    include group-b::install
    include group-b::config

       Class['group-b::install']
    -> Class['group-b::config']
}
