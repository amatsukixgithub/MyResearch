# 信頼性設計

> フェイルオーバー
>> 障害が発生した際に用意しておいた別のシステムに切り替える機能

> マスタースレーブ構成
>> マスターとして扱うものと複製されたものとして扱う構成  
>> マスターを主として使用し、障害時にスレーブに移行するようなイメージ

> リードレプリカ
>> マスターから複製された(スレーブ)、参照専用のデータベースのこと。

> レプリケーション
>> DBを別のDBに複製して同期すること
