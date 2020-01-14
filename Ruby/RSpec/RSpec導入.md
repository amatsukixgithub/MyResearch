group :development, :test do
  gem 'rspec-rails', '~> 3.6.0' ⬅️追加
  # Rails で元から追加されている gem は省略
 end

$ bundle

$ bin/rails generate rspec:install

下記ができる

      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb

.rspecに下記をついきしてドキュメント形式にする
--format documentation


テストスイートの起動時間を速くする
group :development do
# 元から書かれている gem は省略 ... 
gem 'spring-commands-rspec'　⬅️追加
end


実行するとかきのようになる
$ rspec
No examples found.

Finished in 0.00119 seconds (files took 0.19401 seconds to load)
0 examples, 0 failures


rails gの時に自動生成


    # RSpec用設定
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end