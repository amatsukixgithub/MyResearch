# キャッシュの活用

## ElastiCache

メモリ+キャッシュのメモリ型データベース
データベースの選択肢の一つ
ディスクではなく、メモリを使用しているため高速化が目指せる

５つの設計原則のパフォーマンス効率で重要
- キャッシュの利用
- 最適なデータベース選択
  - Cloud Front
  - Elasti Cache
  - S3

キャッシュは１度アクセスしたデータを保存しておいて次回以降は保存したものを利用する仕組み
インメモリキャッシュはキャッシュをメモリに保存したもの

Redis
複雑な場合のエンジン、様々な機能を使用できる
- Luaスクリプト
- 位置情報クエリ
- pub/subモデルの利用

Memcached
シンプルな場合のエンジン、機能は制限される

## Cloud Front

CDN
WEBコンテンツ配信処理の高速化