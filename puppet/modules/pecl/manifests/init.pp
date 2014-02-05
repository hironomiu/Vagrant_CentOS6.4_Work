class pecl{
    include pecl::install
    include pecl::config

       Class['pecl::install']
    -> Class['pecl::config']
}
