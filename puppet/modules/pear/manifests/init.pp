class pear{
    include pear::install
    include pear::config

       Class['pear::install']
    -> Class['pear::config']
}
