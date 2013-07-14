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
php-mbstring php-mysql mysql mysql-server mysql-devel httpd
}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# サービスチェック
%w{
httpd mysqld sshd iptables
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
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 18001 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 18002 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 18003 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 18004 -j ACCEPT') }
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 18005 -j ACCEPT') }
end

# ユーザチェック（存在チェック、所属グループチェック）
%w{
demouser apache group-a group-b group-c group-d group-e
}.each do |user|
    describe user(user) do
        it { should exist }
        it { should belong_to_group 'demogroup' }
    end
end

# グループチェック（apacheのみ追加でチェック）
describe user('apache') do
    it { should belong_to_group 'apache' }
    it { should belong_to_group 'demogroup' }
end

# ホームディレクトリ,.sshディレクトリチェック
describe user('root') do
    it { should have_home_directory '/root' }
end
describe user('demouser') do
    it { should have_home_directory '/home/demouser' }
end
describe file('/home/demouser/.ssh') do
    it { should be_directory }
end
describe user('group-a') do
    it { should have_home_directory '/home/group-a' }
end
describe file('/home/group-a/.ssh') do
    it { should be_directory }
end
describe user('group-b') do
    it { should have_home_directory '/home/group-b' }
end
describe file('/home/group-b/.ssh') do
    it { should be_directory }
end
describe user('group-c') do
    it { should have_home_directory '/home/group-c' }
end
describe file('/home/group-c/.ssh') do
    it { should be_directory }
end
describe user('group-d') do
    it { should have_home_directory '/home/group-d' }
end
describe file('/home/group-d/.ssh') do
    it { should be_directory }
end
describe user('group-e') do
    it { should have_home_directory '/home/group-e' }
end
describe file('/home/group-e/.ssh') do
    it { should be_directory }
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

