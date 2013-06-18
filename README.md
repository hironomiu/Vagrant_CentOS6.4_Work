Treasure2013用環境
===================================

## 環境構成
VirtualBox
Vagrant
Puppet

macにて動作確認

## 構築
### git clone後ホストターミナルから
    cd Vagrant   
    vagrant up  
### ゲストOSへログイン
    vagrant ssh  
    cd /vagrant/puppet  
    sudo puppet apply Treasure2013.pp  


## 環境破棄
### 再構築したい場合は下記コマンドで破棄後構築が可能
    vagrant destroy  

## 環境説明
IPは192.168.56.110で固定で設定  
rootにはvagrantユーザから「sudo su -」で変更可能  
アプリケーションユーザはdemouserを作成済み(現在はrootから遷移のみ可能)   
mysqlはmy.cnfを自動起動＆設定済み  
iptablesでport80は自動起動＆解放済み   
httpdは自動起動は実施、httpd.confは未設定

