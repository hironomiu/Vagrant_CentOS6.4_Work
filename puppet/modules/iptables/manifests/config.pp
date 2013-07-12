class iptables::config{
    file { "/etc/sysconfig/iptables":
        owner => "root", group => "root",
        content => template('/vagrant/puppet/modules/iptables/templates/iptables'),
        mode => 600,
        notify => Service['iptables'],
    }
}
