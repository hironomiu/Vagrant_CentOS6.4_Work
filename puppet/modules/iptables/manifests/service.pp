class iptables::service {
    service{ 'iptables':
        enable => true,
        ensure => running,
        hasrestart => true,
        require => File['/etc/sysconfig/iptables'],
        subscribe => File['/etc/sysconfig/iptables'],
    }
}
