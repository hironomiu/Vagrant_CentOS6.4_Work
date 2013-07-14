class iptables::config{
    file { "/etc/sysconfig/iptables":
        owner => "root", group => "root",
        content => template('iptables/iptables'),
        mode => 600,
        notify => Service['iptables'],
    }
}
