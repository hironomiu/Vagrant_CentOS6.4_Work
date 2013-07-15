class db-group_a::config {
    include variables::init
    $passwd = $variables::init::passwd
    include db-root::config
    Class['db-root::config'] -> Class['db-group_a::config']
    exec { "db-create-group_a":
        unless => "/usr/bin/mysql -ugroup_a -pgroup_apass -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -p$passwd -e \"create database group_a; grant all on group_a.* to group_a@localhost identified by 'group_apass';\"",
    }
}
