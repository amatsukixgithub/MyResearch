# C++

## 基本構造

- 関数の集合で構成
- 関数は呼び出し元からデータを受け取り、定められた処理を実行して結果を返す
- システムが最初に呼び出す関数は**main関数**と呼ばれる

## main関数

```c++
// 戻り値の型が`int`型で名前がmainである関数、main関数
int main(){

  /* 処理 */
　// 処理

　// プログラムが正常終了したことを示す時は0、異常終了した時はそれ以外の値を返す
  return 0;
}
```

- `return`で値を返す
- `//`, `/* */` はコメント

## 標準出力

```c++
printf("出力する文字");
```

`printf`は関数のため`stdio.h`の定義が必要

```c++
#include<stdio.h>

int main(){
  printf("Accepted!\n");
  return 0;
}
```

`cout`, `endl`も関数のため、`iostream`の定義が必要  
基本的に`endl`を使用する

```c++
#include<iostream>
using namespace std;

int main(){
    cout << "Hello World" << endl;
    return 0;
}
```

## if文

```c++
if ( 条件Ａ ) {
  処理A
} else if ( 条件Ｂ ) {
  処理B
} else if ( 条件Ｃ ) {
  処理C
} else {
  その他の処理
}
```

## 比較演算子

```c++
a == b  /* a と b が等しいとき */
a != b  /* a と b の値が等しくないとき */
a <  b  /* a が b より小さいとき */
a <= b  /* a が b 以下とき */
a >  b  /* a が b より大きいとき */
a >= b  /* a が b 以下とき */
```

## 論理演算子

```c++
a && b  /* a かつ b のとき */
a || b  /* a または b のとき */
```

## 繰り返し処理

### while

```c++
while ( 条件式 ){
    処理
}
```

```c++
while ( 条件式 ) 文;
```

### for

```c++
for ( 初期化処理; 条件式; 反復処理 ){
    処理
}

// 例
for ( i = 0; i < 10; i++ ){
    //処理

    // break文 繰り返しの処理を抜けられる
    break;
}
```

```c++
for ( 初期化処理; 条件式; 反復処理 ) 文;
```

