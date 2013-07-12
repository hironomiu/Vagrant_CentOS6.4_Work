class demogroup{
    include demogroup::install
    include demogroup::config

       Class['demogroup::install']
    -> Class['demogroup::config']
}
