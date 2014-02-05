CentOS6.4環境
===================================

## 環境構成

### 構成管理ツール（vagrant up時に組込み済）
Puppet

## 構築
以下については一般ユーザでの構築を想定して記載。
### 当リポジトリをgit clone後ホストターミナルから
    $ cd CentOS6.4_Work   
    $ vagrant up  
上記でpuppetによるパッケージ、アプリユーザ（demouser）の作成まで完了。
## ゲストOSへログイン方法
### vagrantを利用した方法
    $ vagrant ssh
### アプリユーザにsshでログイン（ユーザ、パス共にdemouser）
    $ ssh demouser@192.168.56.10
ここまで問題無ければ構築完了です。
### 停止方法
    $ vagrant halt
### vagrantコマンドの確認方法
    $ vagrant -h

## 環境破棄
### 再構築したい場合は下記コマンドで破棄後構築が可能
    $ vagrant destroy  
## makeコマンド
以下はmakeコマンドが実行可能な環境のみ利用可能
### install
    vagrant upと同じ
### destroy
    vagrant destroyと同じ
### test
    ゲストOSの設定テスト
#### ユーザ

| OS user | pass | 続DB | 接続Port |  DB user |  DB pass | 用途 |
|:-----------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|
| root | vagrant | - | 3306 |  root | vagrant | root |
| vagrant | vagrant | - | - | - | - | vagrant用ユーザ |
| demouser | demouser | groupwork | 3306 | demouser | demopass | 開発ユーザ |

#### パッケージ   
##### mysql
自動起動
/var/lib/mysql/my.cnfに設定  
##### sshd
vagrant demouserのみ許可
##### iptables
自動起動
port22,80をallowにて設定
##### httpd
自動起動
httpd.confは初期設定
##### mongodb
自動起動

