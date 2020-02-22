# Bashシェルスクリプトによるコマンド設定

## Bash

> Bash
>> Linuxの一般的なシェル

> シェル
>> カーネルとのインターフェース  
>> シェルがあることでコマンドを受け付け、カーネルと対話できるようになる  
>> Linuxの一般的なシェルがBash

> シェルスクリプト
>> コマンドがまとめられたドキュメント  
>> 記載された内容をまとめて実行することができる。  
>> シェルに実行してもらうためのドキュメント。

## EC2

```
AMac:~ amatsuki$ mv ~/Downloads/privatekey.pem ~/.ssh/
AMac:~ amatsuki$ chmod 400 ~/.ssh/privatekey.pem
AMac:~ amatsuki$ ssh -i ~/.ssh/privatekey.pem ec2-user@18.224.4.151
```

> ボリュームのでタッチ