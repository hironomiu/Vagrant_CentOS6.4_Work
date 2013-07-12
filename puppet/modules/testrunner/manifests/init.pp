class testrunner{
    include testrunner::install
    include testrunner::config

       Class['testrunner::install']
    -> Class['testrunner::config']

}
