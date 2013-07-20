class app {
    include app::base
    include app::mysql
    include app::jenkins
    include app::db-root
    include app::db-demouser
    include app::db-group_a
    include app::db-group_b
    include app::db-group_c
    include app::db-group_d
    include app::db-group_e
    include app::php
    include app::pear
    include app::testrunner
    include app::demogroup
    include app::demouser
    include app::group-a
    include app::group-b
    include app::group-c
    include app::group-d
    include app::group-e
    include app::httpd
    include app::sshd
    include app::iptables
    include app::httpd-demouser
}
