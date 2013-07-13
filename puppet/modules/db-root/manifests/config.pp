class db-root::config {
    $passwd = 'vagrant'
    include mysql::service
    Class['mysql::service'] -> Class['db-root::config']
    exec { "db-set-root-pass":
        onlyif => "/usr/bin/mysql -uroot -e \"show databases;\"",
        command => "/usr/bin/mysql -uroot -e \"SET PASSWORD FOR root@\"localhost\"= PASSWORD(\'$passwd\');\"",
    }
}
