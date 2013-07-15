class db-group_b::config {
    include variables::init
    $passwd = $variables::init::passwd
    include db-root::config
    Class['db-root::config'] -> Class['db-group_b::config']
    exec { "db-create-group_b":
        unless => "/usr/bin/mysql -ugroup_b -pgroup_bpass -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -p$passwd -e \"create database group_b; grant all on group_b.* to group_b@localhost identified by 'group_bpass';\"",
    }
}
