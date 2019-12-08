# コマンド集

## ディレクトリ構成

| ディレクトリ | 用途 |
|-|-|
|app/ | モデル、ビュー、コントローラ、ヘルパーなどを含む主要なアプリケーションコード|
|app/assets | アプリケーションで使うCSS (Cascading Style Sheet)、JavaScriptファイル、画像などのアセット|
|bin/ | バイナリ実行可能ファイル|
|config/ | アプリケーションの設定|
|db/ | データベース関連のファイル|
|doc/ | マニュアルなど、アプリケーションのドキュメント|
|lib/ | ライブラリモジュール|
|lib/assets | ライブラリで使うCSS (Cascading Style Sheet)、JavaScriptファイル、画像などのアセット|
|log/ | アプリケーションのログファイル
|public/ | エラーページなど、一般(Webブラウザなど)に直接公開するデータ|
|bin/rails | コード生成、コンソールの起動、ローカルのWebサーバの立ち上げなどで使うRailsスクリプト|
|test/ | アプリケーションのテスト|
|tmp/ | 一時ファイル|
|vendor/ | サードパーティのプラグインやgemなど|
|vendor/assets | サードパーティのプラグインやgemで使うCSS (Cascading Style Sheet)、JavaScriptファイル、画像などのアセット|
|README.md | アプリケーションの簡単な説明|
|Rakefile | rakeコマンドで使えるタスク|
|Gemfile | このアプリケーションに必要なGemの定義ファイル|
|Gemfile.lock | アプリケーションで使われるgemのバージョンを確認するためのリスト|
|config.ru | [Rack](http://rack.github.io/)ミドルウェア用の設定ファイル|
|.gitignore | Gitに取り込みたくないファイルを指定するためのパターン|

## heroku

名前変更

```command
heroku rename rails-tutorial-hello
```

heroku create
git push heroku
heroku run rails db:migrate

heroku logs

## Bundler

bundle install --without production

bundle update

最新のものをインストール

``` ruby
gem 'uglifier', '>= 1.3.0'
```

4.0.0以上4.1以下のバージョンをインストール（マイナーバージョンのみ更新）

```ruby
gem 'coffee-rails', '~> 4.0.0'
```

## rails コマンド

### console

```command
rails console
rails console --sandbox
```

### new

```command
rails _5.1.6_ new hello_app
```

### generate scaffold

(id, update, createは自動)

```command
rails generate scaffold User name:string email:string
rails generate scaffold Micropost content:text user_id:integer
```

### generate controller

StaticPagesコントローラ、home,helpの2つのアクション

```command
rails generate controller StaticPages home help

# 取り消しのコマンド
rails destroy controller StaticPages home help
```

### generate model

```command
rails generate model User name:string email:string

# 取り消しのコマンド
rails destroy model User

# remember_digestカラム を usersテーブル にstring型で追加
rails generate migration add_remember_digest_to_users remember_digest:string
```

### generate integration

```command
rails generate integration_test site_layout
    invoke  test_unit
    create  test/integration/site_layout_test.rb
```

### generate migration

```command
rails generate migration add_index_to_users_email

rails generate migration add_password_digest_to_users password_digest:string
```

### migrate

マイグレート

```command
rails db:migrate

# (rails4以前)
bundle exec rake db:migrate
```

```command
# 1つ前に戻す
rails db:rollback

# 最初のバージョンに戻す
rails db:migrate VERSION=0

# リセット(dbを削除して再度作成)
rails db:migrate:reset

# seedsの内容を反映
$ rails db:seed
```

### test

```command
rails test:integration
rails test:models
```

## Route

applicationコントローラーのhelloアクションを実行

```ruby
Rails.application.routes.draw do
  # rootでルートのルーティングとなる(アクション指定は#)
  # これによりviewで root_url ヘルパーが使用できる
  # root_path -> '/'
  # root_url  -> 'http://www.example.com/'
  root 'application#hello'

  # 対象のルーティング参照
  resources :users
  resources :microposts

  # /static_pages/home StaticPagesコントローラのhomeアクション
  # (アクション指定は/)
  # static_pages_home_url ヘルパーが使用できる
  get 'static_pages/home'

  # /help URLにアクセスしたとき、static_pagesコントローラのhelpアクション
  # 下記ヘルパーを使える
  # help_path -> '/help'
  # help_url  -> 'http://www.example.com/help'
  get '/help', to: 'static_pages#help', as: 'helf'
end
```

resourcesは下記と一緒
[こちらも参照](https://qiita.com/Yaruki00/items/d677e0751c90500afc8c)

[対象のルーティングusers](https://railstutorial.jp/chapters/toy_app?version=5.1#table-demo_RESTful_users)

[対象のルーティングmicroposts](https://railstutorial.jp/chapters/toy_app?version=5.1#table-demo_RESTful_microposts)

```ruby
get    '/users',          to: 'users#index'   # ユーザ一覧ページ
get    '/users/:id',      to: 'users#show'    # 特定のユーザページ
get    '/users/new',      to: 'users#new'     # ユーザ登録ページ
post   '/users',          to: 'users#create'  # ユーザ作成
get    '/users/:id/edit', to: 'users#edit'    # 特定のユーザ編集ページ
patch  '/users/:id',      to: 'users#update'  # 特定のユーザ更新
delete '/users/:id',      to: 'users#destroy' # 特定のユーザ削除
```

## Contoroller

### Method

```ruby
def hello
  render html: "hello, world!"

  # byebug gemのメソッド
  # 動作を停止させてその時点の変数などを確認できる
  debugger
end
```

```ruby
def create
  # @user = User.new(params[:user])    # マスアサインメント　脆弱性あり
  @user = User.new(user_params)
end

private

  def user_params
    # require(:user) user属性を必須とする
    # permit() 指定された属性を許可する
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
```

## Model

```ruby
class Micropost < ApplicationRecord
  # contentカラムの最大文字数を140とする
  validates :content, length: { maximum: 140 }

  # 存在しているか
  validates :content, presence: true
end
```

```ruby
class Micropost < ApplicationRecord
  # 1つの user を所持する（属する）
  belongs_to :user

  # 複数の microposts を所持する
  has_many :microposts
end
```

```ruby
class User < ApplicationRecord
  # コールバック関数（before_save saveされるときその直前に実行される）
  before_save { self.email = email.downcase }

  validates :name, presence: true
  # validates (:name, presence: true) と同じ

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },  # フォーマットを正規表現で指定
            uniqueness: { case_sensitive: false } # case_sensitive falseで大文字小文字を区別しない

  # セキュアなパスワードの実装に必要
  # *セキュアにハッシュ化したパスワードを、DB内のpassword_digestという属性(DBにstring型で追加,bcrypt gemの２つが必要)に保存.
  # *2つのペアの仮想的な属性 (passwordとpassword_confirmation) が使用可能.また、存在性と値が一致するかどうかのバリデーションも追加.
  # *authenticateメソッドが使用可能(引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド) 。
  has_secure_password
end
```

### ActiveRecord

rails console --sandbox

オブジェクトの生成から保存

```ruby

# オブジェクトの作成
>> user = User.new(name: "Michael Hartl", email: "mhartl@example.com")
=> #<User id: nil, name: "Michael Hartl", email: "mhartl@example.com", created_at: nil, updated_at: nil>

# オブジェクトの有効性確認（DB内の存在問わず）
>> user.valid?
true

# オブジェクトをDBに保存（成功:true  失敗:false）
>> user.save
   (0.1ms)  SAVEPOINT active_record_1
  SQL (0.8ms)  INSERT INTO "users" ("name", "email", "created_at",
  "updated_at") VALUES (?, ?, ?, ?)  [["name", "Michael Hartl"],
  ["email", "mhartl@example.com"], ["created_at", 2016-05-23 19:05:58 UTC],
  ["updated_at", 2016-05-23 19:05:58 UTC]]
   (0.1ms)  RELEASE SAVEPOINT active_record_1
=> true

# id, created_at, updated_atに値が入る
>> user
=> #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com",
created_at: "2016-05-23 19:05:58", updated_at: "2016-05-23 19:05:58">

```

オブジェクトの生成と保存。モデルの削除。

```ruby

# モデルの生成と保存を同時に行う
>> foo = User.create(name: "Foo", email: "foo@bar.com")
#<User id: 3, name: "Foo", email: "foo@bar.com", created_at: "2016-05-23 19:19:06", updated_at: "2016-05-23 19:19:06">

# DBデータの削除（createの逆）
>> foo.destroy
   (0.1ms)  SAVEPOINT active_record_1
  SQL (0.2ms)  DELETE FROM "users" WHERE "users"."id" = ?  [["id", 3]]
   (0.1ms)  RELEASE SAVEPOINT active_record_1
=> #<User id: 3, name: "Foo", email: "foo@bar.com", created_at: "2016-05-23 19:19:06", updated_at: "2016-05-23 19:19:06">

# 削除してもメモリには残っている
>> foo
=> #<User id: 3, name: "Foo", email: "foo@bar.com", created_at: "2016-05-23 19:19:06", updated_at: "2016-05-23 19:19:06">

```

検索

```ruby

# idで検索 ない場合例外を返す
>> User.find(1)
=> #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com", created_at: "2016-05-23 19:05:58", updated_at: "2016-05-23 19:05:58">

# カラムを指定して検索 ない場合nilを返す
>> User.find_by(email: "mhartl@example.com")
=> #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com", created_at: "2016-05-23 19:05:58", updated_at: "2016-05-23 19:05:58">

# 最初のユーザーを取得
>> User.first
=> #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com", created_at: "2016-05-23 19:05:58", updated_at: "2016-05-23 19:05:58">

# 全部取得
>> User.all
=> #<ActiveRecord::Relation [#<User id: 1, name: "Michael Hartl", email: "mhartl@example.com", created_at: "2016-05-23 19:05:58", updated_at: "2016-05-23 19:05:58">, #<User id: 2, name: "A Nother", email: "another@example.org", created_at: "2016-05-23 19:18:46", updated_at: "2016-05-23 19:18:46">]>

# 別のカラム指定（name）検索
>> User.find_by_name("Michaek Hartl")

```

更新と保存

```ruby

# 更新と保存を同時に行う
>> user.update_attributes(name: "The Dude", email: "dude@abides.org")
=> true

# 更新と保存を同時に行う（検証回避）
>> user.update_attribute(:name, "El Duderino")
=> true
```

bcryptで追加されたauthenticateメソッド

```ruby
>> user.authenticate("foobar")
=> #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com",
created_at: "2016-05-23 20:36:46", updated_at: "2016-05-23 20:36:46",
password_digest: "$2a$10$xxucoRlMp06RLJSfWpZ8hO8Dt9AZXlGRi3usP3njQg3...">
```

## View(erb)

各Viewのファイル

```html
<!-- provide : viewからlayoutへ動的に値を渡したいとき -->
<% provide(:title, "Home") %>
<!DOCTYPE html>
<html>
  <head>
    <!-- yield() : provide内の値を使用したいとき -->
    <title><%= yield(:title) %> | Ruby on Rails Tutorial Sample App</title>
  </head>
  <body>
  </body>
</html>
```

Railsはnameの値を使って、初期化したハッシュを (params変数経由で) 構成します。

```html
<%= form_for(@user) do |f| %>
  <%= f.label :name %>
  <%= f.text_field :name %>
  <!-- labelとtext_fieldで下記のhtmlになる
    <label for="user_name">Name</label>
    <input id="user_name" name="user[name]" type="text" />
  -->
<% end %>
```

テンプレートファイル

```html
  <head>
    <title><%= yield(:title) %> | Ruby on Rails Tutorial Sample App</title>
    <!-- CSRFを防ぐためのメソッド -->
    <%= csrf_meta_tags %>

    <!-- スタイルシート -->
    <!-- stylesheet_link_tag(cssのパス, {メディアタイプ, turbolinksの指定}) -->
    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <!-- JavaScript -->
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>

    <!-- IEのHTML5サポート用 -->
    <!--[if lt IE 9]>
      <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/r29/html5.min.js">
      </script>
    <![endif]-->

    <!-- IE用のコードをパーシャルにする -->
    <!-- renderというRailsヘルパー呼び出しを使って,app/views/layouts/_shim.html.erbというファイルを探して結果をビューに挿入-->
    <%= render 'layouts/shim' %>
  </head>

  <body>
    <!-- "リンクテキスト", "URL", "リクエストの種類" -->
    <%= link_to "Home",   '#' %>
    <%= link_to "Log out", logout_path, method: :delete %>

    <!-- 画像表示 -->
    <%= image_tag("rails.png", alt: "Rails logo") %>

    <!-- デバッグ情報の表示 -->
    <%= debug(params) if Rails.env.development? %>
  </body>
```

## helper

app/helpers のファイルはviewで使用できる

```ruby
# 元々、moduleを使用する際はincludeメソッドでmoduleを読み込む必要がある
# module ApplicationHelper はmoduleを全viewで読み込むようにしてくれる
module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
```

## migrate

```ruby
# usersテーブルにstring型のpassword_digestカラムを追加
class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
  end
end
```

## test code

```ruby
# helperを使用できるようにする
require 'test_helper'

# 
class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # 各テスト実行直前に実行されるメソッド
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    # home ページへの正常な遷移
    get static_pages_home_url
    assert_response :success

    # <title></title>タグ内に「Home | Ruby on Rails Tutorial Sample App」の記述の有無
    assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
    assert_select "title", "Home | #{@base_title}"
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    # aタグのhref属性の個数をテスト
    # ?にroot_pathがエスケープされて入る
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    # testをeach文で繰り返せる
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      # 第2引数にエラーメッセージを追加できる
      # inspect オブジェクトを表現する文字列で返す
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # 重複するメールアドレスを拒否
  test "" do
    # dup 同じ属性のデータを複製するメソッド
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

end
```

|Code|マッチするHTML|
|-|-|
|assert_select "div" | ```<div>foobar</div>``` |
|assert_select "div", "foobar" | ```<div>foobar</div>``` |
|assert_select "div.nav" | ```<div class="nav">foobar</div>``` |
|assert_select "div#profile" | ```<div id="profile">foobar</div>``` |
|assert_select "div[name=yo]" | ```<div name="yo">hey</div>``` |
|assert_select "a[href=?]", ’/’, count: 1 | ```<a href="/">foo</a>``` |
|assert_select "a[href=?]", ’/’, text: "foo" | ```<a href="/">foo</a>``` |



Asset Pipeline

アセットは静的ファイルのこと。CSS, Javascript, image.

> 画像、javascript、css、htmlファイルを分解つしてコーディングして、最終的に1つのファイルにまとめる仕組み

[railsのアセットパイプラインについて解説する](https://qiita.com/hogehoge1234/items/9a94ebc93c5f937502cd)

[アセットパイプライン](https://qiita.com/krppppp/items/666d864e703a270fc8b6)

- アセットディレクトリ
  - app/assets, lib/assets, vendor/assets 各ディレクトリごとにCSS, javascript,image が格納されている。
- マニフェストファイル
  - 圧縮するCSSやJavaScriptを指定したり設定したりするファイル
- プリプロセッサエンジン
  - .erbや.scssなど、拡張子を読み取って、.htmlや.cssにコンパイルできるように加工してくれます。

partial(パーシャル)
renderを使って別ファイルからviewを呼び出す。