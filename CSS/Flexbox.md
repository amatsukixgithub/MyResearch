# Flexbox

floatで作成したデザインを簡易的に実装できるようにしたもの.

## 横並びにする

親要素に `display:flex` を指定する.

index.html

```html
<ul class="flex-list">
  <li class="li1">item1</li>
  <li class="li2">item2</li>
  <li class="li3">item3</li>
  <li class="li4">item4</li>
</ul>
```

style.css

```css
.flex-list{
  display:flex;
}
```

## 横並びにする&横幅一杯

さらに横幅一杯に広げたい場合は広げたい要素に `flex:auto` を指定する.

style.css

```diff
.flex-list{
  display:flex;
}

+ .flex-list li{
+   flex:auto;
+ }
```

## 横並びにする&折り返す

親要素に `flex-wrap:wrap` を指定し,  
折り返したい子要素の `width` を決める.

* width:50% のときは2列
* width:33% のときは3列
* width:51% のときは1列

style.css

```diff
  .flex-list {
    display: flex;
+   /* flex-wrapを指定 */
+   flex-wrap:wrap;
  }
  .flex-list li {
    flex: auto;
+   /* widthを50％に指定 */
+   width:50%;
  }
```

## 縦並びにする&中央揃え

中央揃えしたい要素の親要素に `flex-direction:column` を指定する.
そして中央揃えしたい要素に `margin: 0 auto` を指定する.

style.css

```css
.flex-list{
  flex-direction:column;
}

.flex-list li{
  margin: 0 auto;
}
```