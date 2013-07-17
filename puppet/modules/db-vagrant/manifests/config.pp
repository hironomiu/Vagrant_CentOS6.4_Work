class db-vagrant::config {
    include variables::init
    $passwd = $variables::init::passwd
    exec { "db-vagrant-drop-user":
        onlyif => "/usr/bin/mysql -uroot -p$passwd -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -p$passwd -e \"drop user 'root'@'127.0.0.1','root'@'::1',''@'localhost',''@'treasure2013.local','root'@'treasure2013.local';\"",
    }
}
