class demouser{
    include demouser::install
    include demouser::config

       Class['demouser::install']
    -> Class['demouser::config']
}
