# -*- coding: utf-8 -*-
require 'spec_helper'

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

# ポートチェック
describe port(80) do
  it { should be_listening }
end


