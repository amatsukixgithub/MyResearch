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

## 混合演算

異なる型同士の演算のこと  
混合演算における型変換は**精度の高い方**へ変換が行われる

```c++
int x = 3;
int y = 2;
double f1, f2;
f1 = 3 / 2;        /* 整数どうしの計算は小数点以下が切り捨てられる */
f2 = 1.0 * 3 / 2;  /* 精度の高い実数へ変換される */
```

## 表示桁数の指定

`a`の小数点以下8桁まで表示

```c++
printf("%.8lf\n", a);
```

## doubleの入力と出力

`scanf`か`cin`で入力

```c++
double r;
scanf("%lf", &r);
```

```c++
double r;
cin >> r;
```

浮動小数点数は`cout`で出力すると下記のようになってしまう。

```c++
printf("%f\n", r);
//-> 3141592.653589

cout << r << endl;
//-> 3.14159e+06
```

## 関数の定義と呼び出し方

[C/C++ 関数の作り方と呼び出し方](https://bi.biopapyrus.jp/cpp/syntax/func.html)

`add`関数は使用する前に定義する必要がある。  
`int add(int, int);`と記載するか、  
定義自体を上に書いてしまうかしないといけない。

※ 変数名と関数名は同じにしてはいけない  
[teratail - c言語でのエラー](https://teratail.com/questions/61413)

```c++
#include <stdio.h>

int add(int, int);

int main() {
    int a = 10;
    int b = 20;

    int s = add(a, b);

    printf("%d", s);
    return 0;
}

int add(int x, int y) {
    int s = x + y;
    return s;
}
```

## フォーマット指定子

[フォーマット指定子一覧](https://www.k-cube.co.jp/wakaba/server/format.html)

入力フォーマット指定子

|指定子|	対応する型|	説明|
|-|-|-|
|%c|	char|	１文字を入力する|
|%s|	char *|	文字列を入力する|
|%d|	int|	整数を10進数として入力する|
|%u|	unsigned int|	符号なし整数を10進数として入力する|
|%o|	int, short, unsigned int|	整数を8進数として入力する|
|%x|	int, unsigned int|	整数を16進数として入力する|
|%f|	float|	実数を入力する|
|%hd|	short|	単精度整数を10進数として入力する|
|%ld|	long|	倍精度整数を10進数として入力する|
|%hu|	unsigned short|	符号なし単精度整数を10進数として入力する|
|%lu|	unsigned long|	符号なし倍精度整数を10進数として入力する|
|%lo|	long, unsigned long|	倍精度整数を8進数として入力する|
|%lx| long, unsigned long|	倍精度整数を16進数として入力する|
|%lf| double|	倍精度実数を入力する|

<!-- TODO: 追記　出力フォーマット -->
