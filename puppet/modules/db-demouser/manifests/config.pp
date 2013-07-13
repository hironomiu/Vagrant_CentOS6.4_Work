class db-demouser::config {
    include db-root::config
    Class['db-root::config'] -> Class['db-demouser::config']
    exec { "db-create-demouser":
        unless => "/usr/bin/mysql -udemouser -pdemopass -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -pvagrant -e \"create database groupwork; grant all on groupwork.* to demouser@localhost identified by 'demopass';\"",
    }
}
