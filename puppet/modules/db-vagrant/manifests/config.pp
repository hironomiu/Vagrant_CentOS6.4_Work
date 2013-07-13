class db-vagrant::config {
    include db-root::config
    Class['db-root::config'] -> Class['db-demouser::config']
    exec { "db-vagrant-drop-user":
        onlyif => "/usr/bin/mysql -uroot -p$passwd -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -p$passwd -e \"SET PASSWORD FOR root@'localhost'PASSWORD('vagrant');drop user 'root'@'127.0.0.1','root'@'::1',''@'localhost',''@'treasure2013.local','root'@'treasure2013.local';\"",
    }
}
