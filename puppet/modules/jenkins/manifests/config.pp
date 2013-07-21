class jenkins::config {
    file { '/var/lib/jenkins/.ssh':
        ensure => directory,
        owner => 'jenkins',
        group => 'jenkins',
        mode => '0700',
    }
}
