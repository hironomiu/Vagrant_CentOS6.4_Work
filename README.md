Treasure2013用環境
===================================

## 環境構成
### 前提環境（mac、winともに）
VirtualBox（4.2.12）  
Vagrant（1.2.2）
### 前提環境（mac）
git（git version 1.7.12.4 (Apple Git-37)）  
特に上記である必要は無い
### 前提環境（win）
git for windows（Git-1.8.3-preview2013601.exe）  
Open sshを選択しインストール
Git Bashにて鍵の作成し、作成した公開鍵をgithubに登録  

### 構成管理ツール（vagrant up時に組込み済）
Puppet

### 動作確認
上記バージョンにてmac、winにて動作確認  
（make、serverspecはmacのみ）

## 構築
### 当リポジトリをgit clone後ホストターミナルから
    cd Vagrant   
    vagrant up  
上記でpuppetによるパッケージ、講義用ユーザ（demouser）の作成まで完了する。
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
##### 管理ユーザ（root）
rootにはvagrantユーザから「sudo su -」で変更可能
##### 講義用ユーザ（demouser）  
GroupWorkBase用にdemouserを作成済み
#### パッケージ   
##### mysql
自動起動
/var/lib/mysql/my.cnfに設定  
##### iptables
自動起動
port22,80をallowにて設定
##### httpd
自動起動
httpd.confはGroupWorkBaseに合わせて設定済

