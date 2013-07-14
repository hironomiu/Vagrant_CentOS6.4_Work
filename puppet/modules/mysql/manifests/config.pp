class mysql::config {
    file { "/var/lib/mysql/my.cnf":
        owner => "mysql", group => "mysql",
        content => template('mysql/my.cnf'),
    }

    file { "/etc/my.cnf":
        content => template('mysql/my.cnf'),
        require => File['/var/lib/mysql/my.cnf'],
    }
}
