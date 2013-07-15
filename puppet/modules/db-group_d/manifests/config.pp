class db-group_d::config {
    include variables::init
    $passwd = $variables::init::passwd
    include db-root::config
    Class['db-root::config'] -> Class['db-group_d::config']
    exec { "db-create-group_d":
        unless => "/usr/bin/mysql -ugroup_d -pgroup_dpass -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -p$passwd -e \"create database group_d; grant all on group_d.* to group_d@localhost identified by 'group_dpass';\"",
    }
}
