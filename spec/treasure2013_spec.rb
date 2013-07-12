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
httpd mysqld iptables
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

# ユーザチェック 
%w{
demouser apache group-a group-b group-c group-d group-e
}.each do |user|
    describe user(user) do
        it { should exist }
    end
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

# グループチェック
describe user('apache') do
    it { should belong_to_group 'apache' }
    it { should belong_to_group 'demogroup' }
end
describe user('demouser') do
    it { should belong_to_group 'demogroup' }
end

