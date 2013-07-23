# -*- coding: utf-8 -*-
require 'spec_helper'

# リポジトリチェック
describe yumrepo('remi') do
  it { should exist }
end

# パッケージチェック（puppetで導入したpkgを記載）
%w{
openssh-clients wget screen unzip make git php php-cli
php-pecl-apc php-common php-devel php-gd php-pdo php-pear php-xml
php-mbstring php-mysql mysql mysql-server mysql-devel httpd jenkins java-1.7.0-openjdk java-1.7.0-openjdk-devel
}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# サービスチェック
%w{
httpd mysqld sshd iptables jenkins
}.each do |service|
  describe service(service) do
    it { should be_enabled   }
    it { should be_running   }
  end
end

# ソケットチェック（mysql）
describe file('/var/lib/mysql/mysql.sock') do
  it { should be_socket }
end

# ホストチェック
describe host('treasure2013.local') do
    it { should be_resolvable.by('hosts') }
end

# ポートチェック
describe port(80) do
    it { should be_listening }
end

# iptablesチェック
describe iptables do
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 8080 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 18001 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 18002 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 18003 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 18004 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 18005 -j ACCEPT') }
end

# mysqlチェック
describe user('mysql') do
    it { should exist }
    it { should belong_to_group 'mysql' }
    it { should have_home_directory '/var/lib/mysql' }
end
describe file('/var/lib/mysql/my.cnf') do
    it { should be_file }
end

# apacheチェック
describe user('apache') do
    it { should exist }
    it { should belong_to_group 'apache' }
    it { should belong_to_group 'demogroup' }
end

# jenkinsチェック
describe user('jenkins') do
    it { should exist }
    it { should belong_to_group 'jenkins' }
    it { should have_home_directory '/var/lib/jenkins' }
end
describe file('/var/lib/jenkins/.ssh') do
    it { should be_directory }
end
# アプリケーションユーザチェック（存在チェック、所属グループチェック）
# ホームディレクトリ,.sshディレクトリチェック
users = [
    {
        :user => 'demouser',
        :home_dir => '/home/demouser',
        :ssh_dir => '/home/demouser/.ssh',
    },
    {
        :user => 'group-a',
        :home_dir => '/home/group-a',
        :ssh_dir => '/home/group-a/.ssh',
    },
    {
        :user => 'group-b',
        :home_dir => '/home/group-b',
        :ssh_dir => '/home/group-b/.ssh',
    },
    {
        :user => 'group-c',
        :home_dir => '/home/group-c',
        :ssh_dir => '/home/group-c/.ssh',
    },
    {
        :user => 'group-d',
        :home_dir => '/home/group-d',
        :ssh_dir => '/home/group-d/.ssh',
    },
    {
        :user => 'group-e',
        :home_dir => '/home/group-e',
        :ssh_dir => '/home/group-e/.ssh',
    },
]
users.each do |user|
    describe user(user[:user]) do
        it { should exist }
        it { should belong_to_group 'demogroup' }
        it { should have_home_directory user[:home_dir] }
    end
    describe file(user[:ssh_dir]) do
        it { should be_directory }
    end
end
describe user('root') do
    it { should have_home_directory '/root' }
end

# mysql作成DBチェック
cmds = [
    {
        :cmd => 'mysql -ugroup_a -pgroup_apass -e "use group_a;"'
    },
    {
        :cmd => 'mysql -ugroup_b -pgroup_bpass -e "use group_b;"'
    },
    {
        :cmd => 'mysql -ugroup_c -pgroup_cpass -e "use group_c;"'
    },
    {
        :cmd => 'mysql -ugroup_d -pgroup_dpass -e "use group_d;"'
    },
    {
        :cmd => 'mysql -ugroup_e -pgroup_epass -e "use group_e;"'
    },
    {
        :cmd => 'mysql -udemouser -pdemopass -e "use groupwork;"'
    },
]
cmds.each do |mysql_db|
    describe command(mysql_db[:cmd]) do
        it { should return_exit_status 0 }
    end
end

