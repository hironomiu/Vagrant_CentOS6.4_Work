class group-d{
    include group-d::install
    include group-d::config

       Class['group-d::install']
    -> Class['group-d::config']
}
