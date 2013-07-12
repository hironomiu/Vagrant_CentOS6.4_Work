class mysql::config {
    file { "/var/lib/mysql/my.cnf":
        owner => "mysql", group => "mysql",
        content => template('/vagrant/puppet/modules/mysql/templates/my.cnf');
    }

    file { "/etc/my.cnf":
        source => "/vagrant/puppet/modules/mysql/templates/my.cnf",
        require => File['/var/lib/mysql/my.cnf'],
    }
}
