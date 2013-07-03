yumrepo { 'remi':
descr => 'remi repo',
mirrorlist => 'http://rpms.famillecollet.com/enterprise/6/remi/mirror',
  enabled    => 1,
  gpgcheck   => 1,
  gpgkey     => 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi',
}

package{
[
'openssh-clients',
'wget',
'screen',
'unzip',
'make',
'git',
'php',
'php-cli',
'php-pecl-apc',
'php-common',
'php-devel',
'php-gd',
'php-pdo',
'php-pear',
'php-xml',
'php-mbstring',
'php-mysql',
'mysql',
'mysql-server',
'mysql-devel',
'httpd',
]:
provider => 'yum',
ensure => installed,
require => Yumrepo['remi'],
}


file { "/etc/httpd/conf/httpd.conf":
owner => "root", group => "root",
source => "/vagrant/puppet/httpd.conf",
notify => Service["httpd"],
require => Package["httpd"],
}


file { "/etc/php.ini":
owner => "root", group => "root",
source => "/vagrant/puppet/php.ini",
notify => Service["httpd"],
require => File["/etc/httpd/conf/httpd.conf"],
}

service{ 'httpd':
enable => true,
ensure => running,
hasrestart => true,
require => File['/etc/php.ini']
}

file { "/var/lib/mysql/my.cnf":
owner => "mysql", group => "mysql",
source => "/vagrant/puppet/my.cnf",
notify => Service["mysqld"],
require => Package["mysql-server"],
}

file { "/etc/my.cnf":
ensure => "/var/lib/mysql/my.cnf",
require => File["/var/lib/mysql/my.cnf"],
}

service{ 'mysqld':
enable => true,
ensure => running,
hasrestart => true,
require => File['/etc/my.cnf']
}

exec { "create-demo-db":
unless => "/usr/bin/mysql -uroot -e \"create database groupwork; grant all on groupwork.* to demouser@localhost identified by 'demopass';\"",
command => "/usr/bin/mysql -uroot -e \"create database groupwork; grant all on groupwork.* to demouser@localhost identified by 'demopass';\"",
require => Service["mysqld"],
}

exec { "drop-user-db1":
unless => "/usr/bin/mysql -uroot -e \"drop user 'root'@'127.0.0.1';\"",
command => "/usr/bin/mysql -uroot -e \"drop user 'root'@'127.0.0.1';\"",
require => Exec["create-demo-db"],
}

exec { "drop-user-db2":
unless => "/usr/bin/mysql -uroot -e \"drop user 'root'@'::1';\"",
command => "/usr/bin/mysql -uroot -e \"drop user 'root'@'::1';\"",
require => Exec["drop-user-db1"],
}

exec { "drop-user-db3":
unless => "/usr/bin/mysql -uroot -e \"drop user ''@'localhost';\"",
command => "/usr/bin/mysql -uroot -e \"drop user ''@'localhost';\"",
require => Exec["drop-user-db2"],
}

exec { "drop-user-db4":
unless => "/usr/bin/mysql -uroot -e \"drop user ''@'treasure2013.local';\"",
command => "/usr/bin/mysql -uroot -e \"drop user ''@'treasure2013.local';\"",
require => Exec["drop-user-db3"],
}

exec { "drop-user-db5":
unless => "/usr/bin/mysql -uroot -e \"drop user 'root'@'treasure2013.local';\"",
command => "/usr/bin/mysql -uroot -e \"drop user 'root'@'treasure2013.local';\"",
require => Exec["drop-user-db4"],
}

exec { "pear" :
  user => 'root',
  cwd => '/',
  path => ['/usr/bin'],
  command => "pear channel-discover pear.phpunit.de",
  require => [Package[
'php',
'php-cli',
'php-pecl-apc',
'php-common',
'php-devel',
'php-gd',
'php-pdo',
'php-pear',
'php-xml',
'php-mbstring',
'php-mysql']],
}
exec { "pear 2" :
  user => 'root',
  cwd => '/',
  path => ['/usr/bin'],
  command => "pear channel-discover components.ez.no",
  require => Exec['pear']
}
exec { "pear 3" :
  user => 'root',
  cwd => '/',
  path => ['/usr/bin'],
  command => "pear channel-discover pear.symfony-project.com",
  require => Exec['pear 2']
}
exec { "pear 4" :
  user => 'root',
  cwd => '/',
  path => ['/usr/bin'],
  command => "pear channel-discover pear.symfony.com",
  require => Exec['pear 3']
}

exec { "pear 5" :
  user => 'root',
  cwd => '/',
  path => ['/usr/bin'],
  command => "pear install channel://pear.symfony.com/Yaml",
  require => Exec['pear 4']
}

exec {"pear install phpunit":
  user => 'root',
  cwd => '/',
  path => ['/usr/bin'],
  command => "/usr/bin/pear install phpunit/PHPUnit",
  timeout => 999,
  require => Exec['pear 5'],
}


exec { "testrunner" :
  user => 'root',
  path => ['/usr/bin'],
  command => "pear channel-discover pear.piece-framework.com",
  timeout => 999,
  require => Exec['pear install phpunit'],
}

exec { "testrunner 2" :
  user => 'root',
  path => ['/usr/bin'],
  command => "pear install piece/stagehand_testrunner",
  timeout => 999,
  require => [Exec['testrunner']],
}


group { 'demogroup':
ensure => present,
gid => 505,
require => [Exec['testrunner 2']],
}

user { 'demouser':
ensure => present,
gid => 'demogroup',
comment => 'demouser',
home => '/home/demouser',
managehome => true,
shell => '/bin/bash',
require => Group["demogroup"]
}

file { '/home/demouser/.ssh':
ensure => directory,
owner => 'demouser',
group => 'demogroup',
mode => '0700',
require => User["demouser"]
}

exec { "passwd" :
  user => 'root',
  path => ['/bin/','/usr/bin'],
  command => 'echo "demouser" | passwd --stdin demouser',
  timeout => 999,
  require => File['/home/demouser/.ssh']
}

exec { "sshd_conf" :
  user => 'root',
  path => ['/bin/','/usr/bin'],
  command => 'echo AllowUsers vagrant demouser >> /etc/ssh/sshd_config',
  timeout => 999,
  require => Exec['passwd']
}

service{ 'sshd':
enable => true,
ensure => running,
hasrestart => true,
require => Exec['sshd_conf']
}

exec { "chmod" :
  user => 'root',
  path => ['/bin'],
  command => "chmod 755 /home/demouser",
  timeout => 999,
  require => Service['sshd']
}

exec { "usermod apache" :
  user => 'root',
  path => ['/usr/sbin'],
  command => "usermod -G demogroup apache",
  timeout => 999,
  require => Exec['chmod']
}

file { "/etc/sysconfig/iptables":
owner => "root", group => "root",
source => "/vagrant/puppet/iptables",
mode => 600,
notify => Service['iptables'],
require => Exec['usermod apache']
}

service{ 'iptables':
enable => true,
ensure => running,
hasrestart => true,
require => File['/etc/sysconfig/iptables'],
subscribe => File['/etc/sysconfig/iptables'],
}
