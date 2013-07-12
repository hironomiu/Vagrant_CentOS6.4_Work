class iptables{
    include iptables::install
    include iptables::config
    include iptables::service

       Class['iptables::install']
    -> Class['iptables::config']
    ~> Class['iptables::service']
}
