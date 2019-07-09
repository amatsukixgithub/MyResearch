# GAS構文

## 基本構文

### if文
``` js
if(条件式) {
　// 条件式がtrueだったときの処理
}
```

``` js
if(!sheet.getRange(i, 2).getValue()){
  Logger.log(sheet.getRange(i, 1).getValue());
}
```

### 比較演算子

|比較演算子|意味|
|:-|:-|
|===|等しい|
|!==|等しくない|
|<|小さい|
|<=|以下|
|>=|以上|
|>|大きい|

### for文

``` js
for(初期化式; 条件式; 増減式) {
　// 繰り返す処理
}
```

``` js
for(var i = 2; i <= 195; i++) {
　//処理
}
```

### ループを抜ける
``` js
break;
```

### while文
``` js
while(条件式) {
　//繰り返したい処理
}
```

## ログ
``` js
Logger.log('hogehoge');
```

## SpreadsheetApp → スプレッドシート → シート名でシートオブジェクトの取得
``` js
var ss = SpreadsheetApp.getActiveSpreadsheet();
var sheet = ss.getSheetByName('シート1');
```

## シートオブジェクト → シート名の取得
``` js
Sheetオブジェクト.getName()
```

## SpreadsheetApp → アクティブなシートオブジェクトを取得
複数のシートがスプレッドシートに含まれている場合は、どのシートが「アクティブ」なのかをコントロールするのが難しいので、シート名などで取得したほうが安全。
``` js
SpreadsheetApp.getActiveSheet()
```

## セル範囲の取得 値の出力
getRangeメソッドを使用する

### アドレスを指定してセルを取得する
``` js
Sheetオブジェクト.getRange(アドレス)
```

``` js
sheet.getRange('A3').getValue();
```

### 行番号、列番号を指定してセル範囲を取得する
Rangeオブジェクトがセル範囲の場合にgetValueメソッドを使うと、セル範囲の一番左上のセルの値のみを取得してしまう
``` js
sheet.getRange('A3:C4').getValue();
```

getValuesメソッドを使用することで全ての値を取得できる
``` js
sheet.getRange('A3:C4').getValues()
```

### 行数列数を指定してセル範囲を指定
``` js
Sheetオブジェクト.getRange(行番号, 列番号, 行数, 列数)
```

``` js
sheet.getRange(2, 1, lastRow, 1)
```

## 最終行を求める
``` js
Sheetオブジェクト.getLastRow()
```

``` js
var sheet = SpreadsheetApp.getActiveSheet();
var lastRow = sheet.getLastRow();
```

## セルに値を挿入する
``` js
Rangeオブジェクト.setValue(値)
```

``` js
sheet.getRange(i, 2).setValue(true);
```

## セル範囲のアドレスを取得
``` js
Rangeオブジェクト.getA1Notation()
```

``` js
sheet.getRange(2, 1, lastRow, 1).getA1Notation()
```

## セル範囲をクリア

### 全クリア
.clearメソッドは値や書式など**全て**をクリアする
``` js
Rangeオブジェクト.clear()
```

### コンテンツクリア
.clearContentメソッドは値のみをクリアする
``` js
Rangeオブジェクト.clearContent()
```

### 書式をクリア
clearFormatメソッド

### データの入力規則をクリア
clearDataValidationsメソッド

### コメントをクリア
clearNoteメソッド