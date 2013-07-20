class jenkins::install{
    include base::install
    Class['base::install'] -> Class['jenkins::install']
    yumrepo { 'jenkins':
        descr => 'jkenkis',
        baseurl => 'http://pkg.jenkins-ci.org/redhat',
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     => 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
    }

    package{
        [
        'jenkins',
        ]:
        ensure => installed,
        require => Yumrepo['jenkins'],
    }
}
