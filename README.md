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
### 前半戦用ユーザにsshでログイン（ユーザ、パス共にdemouser）
    ssh demouser@192.168.56.110
ここまで問題無ければ構築完了です。
### 停止方法
    vagrant halt
    もしくはVirtualBoxのコンソール画面から停止でも問題ありません。（起動も同様に問題なし）
### vagrantコマンドの確認方法
    vagrant -h

## 環境破棄
### 再構築したい場合は下記コマンドで破棄後構築が可能
    vagrant destroy  
## makeコマンド
以下はmakeコマンドが実行可能な環境のみ利用可能
### install
    vagrant upと同じ
### destroy
    vagrant destroyと同じ
### add-demouser
    ゲストOSにdemouser用のドキュメントルートの設定、リライトルールの追加
### test
    ゲストOSの設定テスト
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

| OS user | pass | 続DB | 接続Port |  DB user |  DB pass | 用途 |
|:-----------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|
| root | vagrant | - | 3306 |  root | vagrant | root |
| vagrant | vagrant | - | - | - | - | vagrant用ユーザ |
| demouser | demouser | groupwork | 3306 | demouser | demopass | 前半戦開発用ユーザ |
| group-a | group-a | group_a | 3306 | group_a | group_a | 後半戦開発用ユーザ |
| group-b | group-b | group_b | 3306 | group_b | group_b | 後半戦開発用ユーザ |
| group-c | group-c | group_c | 3306 | group_c | group_c | 後半戦開発用ユーザ |
| group-d | group-d | group_d | 3306 | group_d | group_d | 後半戦開発用ユーザ |
| group-e | group-e | group_e | 3306 | group_e | group_e | 後半戦開発用ユーザ |

#### パッケージ   
##### mysql
自動起動
/var/lib/mysql/my.cnfに設定  
##### iptables
自動起動
port22,80をallowにて設定
##### httpd
自動起動
httpd.confはGroupWorkBaseに合わせて設定

