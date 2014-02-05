class app {
    include app::localtime
    include app::lang
    include app::base
    include app::mysql
    include app::mongodb
    include app::db-root
    include app::db-demouser
    include app::php
    include app::pecl
    include app::demogroup
    include app::demouser
    include app::httpd
    include app::sshd
    include app::iptables
}
