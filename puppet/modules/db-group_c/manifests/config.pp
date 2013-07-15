class db-group_c::config {
    include variables::init
    $passwd = $variables::init::passwd
    include db-root::config
    Class['db-root::config'] -> Class['db-group_c::config']
    exec { "db-create-group_c":
        unless => "/usr/bin/mysql -ugroup_c -pgroup_cpass -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -p$passwd -e \"create database group_c; grant all on group_c.* to group_c@localhost identified by 'group_cpass';\"",
    }
}
