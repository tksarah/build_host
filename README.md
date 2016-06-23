# ハンズオン環境一撃プレイブック
**１プレイ**で環境を作るPlaybook概要

## 対象
物理マシンまたは既存VM、OpenStack or DigitalOcean or AWS 上のインスタンス、これををハンズオンホストマシンとして建てる

## 使い方
Step1. 対象にアクセスするための秘密鍵を keys/ に入れ 0600 にセット

Step2. hostsのセット（対象に合わせる）
```
;; Sample 

[ops]
192.168.100.10 ansible_ssh_private_key_file=/root/.ssh/id_rsa

[cloud]
localhost ansible_connection=local

[bare]
example.co.jp ansible_ssh_private_key_file=/root/.ssh/id_rsa
```
Step3. 対象に合わせたDNS情報がある場合 group_vars 以下のファイルに記述 

Step4. 実行
```
target・・・イベントリに記載したターゲット
vtype ・・・ハンズオン環境を作るマシンが起動するインフラ（OpenStack | DC | AWS | Bare）
hname ・・・ハンズオン環境を作るマシン名（クラウドのみ）
lesson・・・ハンズオンのレッスン番号（1 | 2）

# ansible-playbook -i hosts -e "target=ops hname=demo-machine vtype=OpenStack lesson=1" main.yml

# ansible-playbook -i hosts -e "target=bare vtype=Bare handson=ansible" main.yml
```
以降はハンズオン毎に個別の準備

- [Lesson for Ansible](https://github.com/tksarah/ansible_lesson)

## Playbook がヤルこと 
- 対象にインフラストラクチャ上にVMを起動
- 起動したVMに対して各種必要パッケージや必要設定を実施
- 指定したレッスンツールを /root へダウンロード


## 事前準備（物理マシンや既存VMの場合）
- CentOS 7 以上のマシン用意しとく
- Ansibleを実行するホストからノンパスで入れるようにSSH公開鍵を登録しとく ( root )
- Ansible がリモートログインするユーザを一般ユーザとする時、sudo をパスワード無しで入れるようにしておく

## 事前準備（OpenStackの場合）
- OpenStackのコントローラノードにSSHが通るようにPlayを実行する公開鍵を登録しとく
- SSHキーペアを作成し、 OpenStackのVMを作るときに指定する公開鍵をOpenStackに登録しておく ( keys/hoge.pub )
- Ansible がリモートアクセスするユーザを一般ユーザとする時、sudo をパスワード無しで入れるようにしておく

### OpenStack 関連パラメータ確認と指定 : openstack role
- コントローラノードにアクセスして操作する認証情報 ( auth_url , username , password , project_name )
- どのOpenStackのフレーバ（スペック）を使うか ( flavor id )
- どのOpenStackのイメージを使うか ( image id )
- どのOpenStackのネットワークを使うか ( network id )
- どのキーペアを使うか ( keypair )

## 事前準備（DigitalOceanの場合）
- APIv2 のトークンを取得し、登録しておく
- rootログイン用のSSH公開鍵を予め作って登録しておく
- 秘密鍵は手元に用意、Playbook実行時に利用する keys/hoge.key

### DigitalOcean 関連パラメータ確認と指定 : dc role
- イメージ、リージョン、ホスト名、サイズ（スペック）、を確認して指定しておく

## 事前準備（AWSの場合）
### AWS 関連パラメータ確認と指定

## 事前準備（vSphereの場合）
### vSphere 関連パラメータ確認と指定

