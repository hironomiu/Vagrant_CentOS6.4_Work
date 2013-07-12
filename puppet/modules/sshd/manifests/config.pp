class sshd::config{
    exec { "sshd_conf" :
        user => 'root',
        path => ['/bin/','/usr/bin'],
        command => 'echo AllowUsers vagrant demouser group-a group-b group-c group-d group-e >> /etc/ssh/sshd_config',
        timeout => 999,
    }
}
