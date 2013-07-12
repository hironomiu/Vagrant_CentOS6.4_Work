class mysql::config {
    file { "/var/lib/mysql/my.cnf":
        owner => "mysql", group => "mysql",
        content => template('my.cnf'),
    }

    file { "/etc/my.cnf":
        content => template('my.cnf'),
        require => File['/var/lib/mysql/my.cnf'],
    }
}
