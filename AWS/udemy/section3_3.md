# AWSの全体像

## AWSサービス

### <font color="Crimson">アプリケーション統合</font>

アプリケーション同士の連携する機能、システム構成を疎結合化できる

#### <font color="Crimson">Simple Queue Service(SQS)</font>

メッセージキュー

#### <font color="Crimson">Simple Notification Service(SNS)</font>

プッシュして機能を動かす

### <font color="Crimson">データベース</font>

様々なデータベースのサービス

#### <font color="Crimson">RDS</font>

SQLサーバー、Oracleサーバーなどが提供されているサービス  
基本のDB

#### <font color="Crimson">DynamoDB</font>

NoSQLを使用して高速な処理をしたいときのサービス

#### <font color="Crimson">ElasticCashe</font>

キャッシュデータを蓄える専用のDB

#### <font color="DeepSkyBlue">Aurora</font>

高性能でマネージドでリレーショナルデータベースを提供するサービス

#### <font color="DeepSkyBlue">Redshift</font>

データウェアハウス

### <font color="Crimson">コンピューティング</font>

サーバーを使った機能

#### <font color="Crimson">EC2</font>

クラウド内で仮装サーバーを構築
インスタンス１つで１つのサーバー

#### <font color="Crimson">Auto Scaing</font>

EC2をスケーリングし、高可用性をを確保

#### <font color="Crimson">Lamdba</font>

サーバレスの機能
コストを抑え、疎結合に

#### <font color="Crimson">Elastic Load Balancing</font>

ロードバランサーの機能でトラフィック減少、停止サーバーから動作しているサーバーに変更など

#### <font color="DeepSkyBlue">Elastic Conteiner Service</font>

Dockerを使ってCICDを実現する時のサービス

#### <font color="DeepSkyBlue">Elastic Beanstalk</font>

サーバー構築の一部を自動化し管理するサービス

### <font color="DeepSkyBlue">開発者用ツール</font>

Cloud9とか

#### <font color="DeepSkyBlue">CodeCommit</font>

開発したデータを保存する

#### <font color="DeepSkyBlue">CodeBuild</font>

ビルドとテスト

#### <font color="DeepSkyBlue">CodeDeploy</font>

デプロイを自動化できる  
CodeCommit→CodeBuild→CodeDeployの順で行っていく

#### <font color="DeepSkyBlue">CodePipeline</font>

上記のCodeシリーズを並べて連携させる

#### <font color="DeepSkyBlue">コマンドラインインターフェース(CLI)</font>

AWSを操作するときの手法  
マネジメントコンソールではなくコマンドで操作したいとき

### <font color="Crimson">マネジメントとガバナンス</font>

AWSを使う時の管理、情報収集、運用管理に使う機能

#### <font color="Crimson">CloudWatch</font>

リソースとアプリケーションのモニタリング

#### <font color="Crimson">マネジメントコンソール</font>

ウェブ上のインターフェース

#### <font color="Crimson">Auto Scaling</font>

全体のオートスケーリング。EC2のときと機能は一緒

#### <font color="DeepSkyBlue">CloudTrail</font>

ユーザーがどういう行動をしたかのログを管理

#### <font color="DeepSkyBlue">Well-Architected Tool</font>

設計原則を守るためにどうすればいいか支援してくれるツール

#### <font color="DeepSkyBlue">Config</font>

リソースの実行状況、変更状況を記録してくれる

#### <font color="DeepSkyBlue">CloudFormation</font>

テンプレートを使ってリソースの管理と作成を行う。

#### <font color="DeepSkyBlue">OpsWorks</font>

ChefやPuppetを使って運用を自動化する

#### <font color="DeepSkyBlue">Trusted Advisor</font>

パフォーマンスやセキュリティを最適化。助言とかしてくれる。

### <font color="Crimson">ネットワーキングとコンテンツ配信</font>

VPCなどネットワークに関連するサービス

#### <font color="Crimson">VPC</font>

Amazon上で仮想ネットワークを構築してサーバーを置いたりして使う

#### <font color="Crimson">Route 53</font>

DNSを提供するサービス

#### <font color="DeepSkyBlue">Cloud Front</font>

コンテンツ配信をしたい際に処理を軽くする

#### <font color="DeepSkyBlue">Direct Connect</font>

オンプレにあるサーバーと接続したいときのサービス

#### <font color="DeepSkyBlue">API Gateway</font>

APIを構築してデプロイしたいときのサービス

### <font color="Crimson">セキュリティ、アイデンティティ、コンプライアンス</font>

セキュリティを担保するかのサービス

#### <font color="Crimson">Identity &amp; Access Management(IAM)</font>

ユーザーアクセス権限の管理

#### <font color="DeepSkyBlue">GuardDuty</font>

マネージド型脅威検出サービス  
ログ等を使用して機械学習でセキュリティ上の懸念点をアドバイスしてくれる。

#### <font color="DeepSkyBlue">Inspector</font>

セキュリティの分析ツール

#### <font color="DeepSkyBlue">Cloud HSM</font>

世界のセキュリティの基準に準拠するためのレポーティング機能

#### <font color="DeepSkyBlue">Detectory Service</font>

管理権限を設定する機能

#### <font color="DeepSkyBlue">Key Management Service(KMS)</font>

データベースのデータ暗号化

#### <font color="DeepSkyBlue">Artifact</font>

コンプライアンス上の課題があるかレポーティング

### <font color="Crimson">ストレージ</font>

データを蓄積するS3のようなサービス

#### <font color="Crimson">Simple Storage Service(S3)</font>

スケーラブルなクラウドストレージ

#### <font color="Crimson">Elartic Block Store(EBS)</font>

EC2を立ち上げるとはじめに立ち上がる？

#### <font color="Crimson">Glacier</font>

S3より低コストであまり使用しないデータを大量に保存できる

#### <font color="DeepSkyBlue">Storage Gateway</font>

ストレージを全体で管理するゲートウェイ機能

#### <font color="DeepSkyBlue">Elastic File System(EFS)</font>

ファイルをデータとして蓄積したいときのサービス
