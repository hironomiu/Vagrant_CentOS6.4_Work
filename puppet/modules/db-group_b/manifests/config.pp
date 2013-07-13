class db-group_b::config {
    include db-root::config
    Class['db-root::config'] -> Class['db-group_b::config']
    exec { "db-create-group_b":
        unless => "/usr/bin/mysql -ugroup_b -pgroup_bpass -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -pvagrant -e \"create database group_b; grant all on group_b.* to group_b@localhost identified by 'group_bpass';\"",
    }
}
