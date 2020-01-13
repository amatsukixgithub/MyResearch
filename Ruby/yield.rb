# yieldはメソッド内で受け取ったブロックを実行する。
# ブロックはメソッドで１つしか受け取れないため、
# 引数とか明示せずにyieldでいいよねって考え。
# yieldについてわかりやすい解説↓
# https://qiita.com/kidach1/items/15cfee9ec66804c3afd2

# ---yieldでメソッドでブロックを受け取ることができる---
def languages
  puts 'ruby'

  # block_given? でblockが渡されているか検証
  # ブロックが渡されていない場合のyieldはエラー
  # (no block given (yield) (LocalJumpError))
  yield if block_given?

  puts 'php'
end

# ブロックなしでメソッド呼び出し
languages
#=>ruby
#  php

# ブロックありでメソッド呼び出し
languages do
  puts 'java'
end
#=>ruby
#  java
#  php

# ブロックの別の書き方
languages { puts 'java' }
#=>ruby
#  java
#  php


# --- yieldに引数を渡し、戻り値を受け取る ---
def languages2
  puts 'ruby'
  l = yield 'java'
  puts l
  puts 'php'
end

# メソッドで引数を受け取る
languages2 do |l|
  l * 3
end
#=>ruby
#  javajavajava
#  php

# 引数を受け取れなかった変数(aとb)はnilになる
languages2 do |l, a, b|
  p "a: #{a.inspect}"
  p "b: #{b.inspect}"
  l * 3
end
#=>ruby
#  "a: nil"
#  "b: nil"
#  javajavajava
#  php

# --- ブロックをメソッドの引数として明示的に受け取る ---
# メソッドの引数名に&をつけることでブロックを受け取ることを示す
# .callで受け取ったブロックを実行する
def languages3(&lang)
  puts 'ruby'
  unless lang.nil?
    lang = lang.call('java')
    puts lang
  end
  puts 'php'
end

languages3 do |lang|
  lang * 5
end
#=>ruby
#  javajavajavajavajava
#  php
