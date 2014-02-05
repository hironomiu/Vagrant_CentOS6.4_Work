class mysql::config {
    file { "/etc/my.cnf":
        content => template('mysql/my.cnf'),
    }
}
