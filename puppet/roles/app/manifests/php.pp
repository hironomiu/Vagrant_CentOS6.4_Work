class app::php {
    include ::php::install
    include ::php::service
    include ::pecl

    Class['::php::install']
 -> Class['::pecl::install']
}
