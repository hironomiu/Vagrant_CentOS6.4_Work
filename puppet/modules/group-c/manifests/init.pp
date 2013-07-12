class group-c{
    include group-c::install
    include group-c::config

       Class['group-c::install']
    -> Class['group-c::config']
}
