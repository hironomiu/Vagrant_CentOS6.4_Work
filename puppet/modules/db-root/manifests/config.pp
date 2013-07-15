class db-root::config {
    include variables::init
    $passwd = $variables::init::passwd
    include mysql::service
    Class['mysql::service'] -> Class['db-root::config']
    exec { "db-set-root-pass":
        onlyif => "/usr/bin/mysql -uroot -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -e \"SET PASSWORD FOR root@\"localhost\"= PASSWORD(\'$passwd\');\"",
    }
}
