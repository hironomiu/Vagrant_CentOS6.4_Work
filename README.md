Treasure2013用環境
===================================

## 環境構成
### 前提環境
VirtualBox  
Vagrant  
### 構成管理ツール（vagrant up時に組込み済）
Puppet

### 動作確認
macにて動作確認  
（winで動作実績あり）

## 構築
### 当リポジトリをgit clone後ホストターミナルから
    cd Vagrant   
    vagrant up  
上記でpuppetによるパッケージ、ユーザの作成まで完了する。

## ゲストOSへログイン方法
### vagrantを利用した方法
    vagrant ssh
### sshでdemouserにログイン
    ssh demouser@192.168.56.110

## 環境破棄
### 再構築したい場合は下記コマンドで破棄後構築が可能
    vagrant destroy  

## 環境説明
### VirtualBox
#### インスタンス名
treasure2013  
#### ネットワーク設定
##### アダプタ１
NAT,ssh用にポートフォワーディングの設定あり  
ホスト2222->ゲスト22
#### アダプタ２
192.168.56.110で設定
### ゲストOS
CentOS6.4
#### ユーザ
rootにはvagrantユーザから「sudo su -」で変更可能  
GroupWorkBase用にdemouserを作成済み(現在はrootから遷移のみ可能)
#### パッケージ   
##### mysql
自動起動
/var/lib/mysql/my.cnfに設定  
##### iptables
自動起動
port22,80をallow
##### httpd
自動起動
httpd.confは未設定

