class sshd::config{
    file { '/etc/ssh/sshd_config':
        owner => 'root', group => 'root',
        content => template('sshd/sshd_config'),
    }
}
