class db-vagrant::config {
    include mysql::service
    Class['mysql::service'] -> Class['db-vagrant::config']
    exec { "create-demo-db":
        unless => "/usr/bin/mysql -udemouser -pdemopass -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -e \"create database groupwork; grant all on groupwork.* to demouser@localhost identified by 'demopass';drop user 'root'@'127.0.0.1','root'@'::1',''@'localhost',''@'treasure2013.local','root'@'treasure2013.local';\"",
    }
}
