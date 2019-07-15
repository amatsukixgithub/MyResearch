# VPCの概要

> 仮想ネットワーク
>>

> サブネット
>>

> ネットワークゲートウェイ
>>

> CIDR方式
>>Classless Inter-Domain Routing  
>> サブネットマスクの値を調節して有効なIPアドレスの範囲を調節する

> トラフィック許可
>>

> ネットワークアドレス
>>

> ブロードキャストアドレス
>>

> ネットワークセグメント
>>


> ベストエフォート回線
>> 記載された通信速度を最高とした回線。  
>> その通信速度を保証するものではない。

> リードタイム
>> 始まってから終了するまでの時間

> インターネットゲートウェイ
>> インターネットに接続するためにネットワーク間を中継してくれる機器のこと。  
>> [ゲートウェイ (gateway)とは｜「分かりそう」で「分からない」でも「分かった」気になれるIT用語辞典](https://wa3.i-3-i.info/word140.html)

> ルータ
>> IPアドレスによってデータの中継を行う機器。
>> ゲートウェイとルータの違いは役割の呼称と機器の名称。

> VPCエンドポイント
>> インターネットゲートウェイやNATゲートウェイ、NATインスタンスなどを介さずに他のAWSサービスとプライベートに接続できるサービス。  
>>
>> サービスの使用を削減できるため使用料を削減できる。  
>> インターネットを介さないためセキュアなアクセスが行える。  
>> NATのネットワーク負荷を軽減できる。

> VPC peering connection
>> VPC間でインターネットを経由せずに相互に接続するためのサービス。  
>> [VPCピアリングを作りながら学んでみた](https://dev.classmethod.jp/etc/handson-vpc-peering/)  
>> [VPC Peeringの設定 - Qiita](https://qiita.com/yuppi/items/fe540e4e05920294a41c)

> ネットワークACL
>> ステートレスなファイアウォール  
>> [AWS セキュリティグループとネットワークACLの違い - Qiita](https://qiita.com/TaigoKuriyama/items/d5b63bf7b169f4b8ffbd)  

> パブリックIPv4アドレス  
> グローバルアドレス
>> 全世界で一意となるIPアドレス

> カスタムTCPルール
>>

> エフェメラルポート
>> 用途の決まっていないポートのこと。  
>> [エフェメラルポート (ephemeral port)とは｜「分かりそう」で「分からない」でも「分かった」気になれるIT用語辞典](https://wa3.i-3-i.info/word15366.html)  

> VPC Flow Logs
>> CloudWatchと連携してVPCのトラフィックログを貯める

> Direct Connect
>> 内部ネットワークをAWSと接続するためのサービス
>> [AWS Direct Connect とは - AWS Direct Connect](https://docs.aws.amazon.com/ja_jp/directconnect/latest/UserGuide/Welcome.html)  