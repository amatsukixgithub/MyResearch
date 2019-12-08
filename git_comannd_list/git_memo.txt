ブランチ一覧
git barnch

ブランチ切って移動
git checkout -b 作成するブランチ名

リモートのを持ってきてローカルで作って移動
git checkout -b branch_name origin/branch_name


ブランチ削除
git branch -d ブランチ名

更新ファイルを確認
git status

ログの確認
git log --oneline --graph --decorate

git fetch
git log --oneline origin/master


差分を確認
git diff ~ファイル名~

git diff --color-words  # 差分を単語単位で色分けで表示する

ステージング
git add ~ファイル名~

詳細なコードを見てaddするコードを選択
git add -p ~ファイル名~
(sでそれぞれのコードを見るモードに
 nでaddしないコード
 yでaddするコードとして選択)

git commit -m 'コメント入力'

プッシュして完了
git push origin ブランチ名

直前のコミットを取消
git reset --soft HEAD^

addしたファイルの差分を見る
git diff --cached

addを取り消す
git reset ファイル名

pullするとき
git pull origin ブランチ名


変更を一時保存
git stash

変更リスト
git stash list

変更をもどす
git stash pop stash@{0}

変更リスト内のファイル名を表示
git stash show stash@{0}


ローカルの変更を元に戻す
git checkout <filename>

派生元
git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -1 | awk -F'[]~^[]' '{print $2}'


git branch -vv

コミット時に絵を使う
git commit -m ":lipstick:"

リビジョンAからBの差分
git diff --name-only A B

自作おしゃれコマンド
git log --graph --all --date=format:'%Y/%m/%d %H:%M:%S' --format="%x09%C(yellow)%h%Creset - %C(green)%ad %C(cyan bold)<%an>%Creset%C(red)%d%Creset %s"
おしゃこま　エイリアス
git config --global alias.lg "log --graph --all --date=format:'%Y/%m/%d %H:%M:%S' --format='%x09%C(yellow)%h%Creset - %C(green)%ad %C(cyan bold)<%an>%Creset%C(red)%d%Creset %s'"

エイリアスの修正
git config --global --edit
エイリアスの設定確認
git config --global --list | grep ^alias¥.
