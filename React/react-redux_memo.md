# React memo

ReactはWebアプリケーションを実装するためのJavascriptフレームワーク。  
2013年に公開され、2017年にライセンスがMITに変更され、オープンソースコミュニティに受け入れられるようになった。  
Facebookが開発。  

Qiita, NetFlix, AirBNBとかで使われている。

DOMの変更箇所がどこなのか気にしなくてよくなる。

## Create React App

以前のReactでは様々なパッケージを自分でインストールする必要があり、面倒だった。  
解消するためのツールが create-react-app。

[Qiita - create-react-app が裏で何をやっているか理解する](https://qiita.com/naohikowatanabe/items/71a8bf477216ef56a5b7)

### Node.jsのインストール

[https://nodejs.org/ja/](https://nodejs.org/ja/)

LTS:安定板
Current:最新版

### yarnのインストール

npmより信頼性の高いパッケージ管理ツール

```console
$ npm install --global yarn
$ yarn --version
```

### yarn で creat-react-appのインストール

```console
$ yarn global add create-react-app
```

### アプリケーションの作成

```console
$ create-react-app Directory_Path
```

作成されるファイル,ディレクトリ

```
.gitignore
README.md
package.json
public/
src/
yarn.lock
```

### アプリの起動

起動後はファイルを書き換え、保存するだけで更新される。  
エラーがあった場合も教えてくれる。

```console
yarn run start
```

### App.jsがclassからfunctionに変わった

classで定義されていたものがfunctionに変わっている。  
classは再利用性が悪いため、functionに移り変わっている傾向があるらしい。

[stackoverflow-How to create React.js app without a function in App.js](https://stackoverflow.com/questions/55887544/how-to-create-react-js-app-without-a-function-in-app-js/58848051#58848051)

## Reactの基礎

### JSX

JavaScript XML。  
HTMLに似た記法のことで可読性が高い。

JSXを使用する際は `import React` のコードが必要

`src/App.js`

JSXの例
```js
import React from 'react';

class App extends Component {
  render() {
    return <div>Hello,World</div>;
  }
}
```

#### babelによるトランスパイル

JSXはjavascriptのコードに置き換えられる。  
置き換えないとjavascriptとして実行できない。

babelというライブラリが自動的に変換(トランスパイル)してくれる。

[babelをWEBで試す](https://babeljs.io/repl#?browsers=&build=&builtIns=false&spec=false&loose=false&code_lz=Q&debug=false&forceAllTransforms=false&shippedProposals=false&circleciRepo=&evaluate=false&fileSize=false&timeTravel=false&sourceType=module&lineWrap=true&presets=es2015%2Creact%2Cstage-2&prettier=false&targets=&version=7.7.4&externalPlugins=)

javascriptの例
```js
class App extends Component {
  render() {
    return React.createElement(
      "div",
      null,
      "Hello,World"
    );
  }
}
```

#### JSXは変数に格納できる

```js
class App extends Component {
  render() {
    const greeting = "Hi!!";
    const dom = <div>{greeting} Hello,World</div>;
    return dom;
  }
}
```

#### タグ内の属性名は特殊な名前,キャメルケースになる

class属性はjsの予約語と被ってしまうため、`className` となる  
for属性も `htmlFor` に変わる

```js
class App extends Component {
  render() {
    return (
      <div>
        <div className="foo">Hello World</dev>
        <label htmlFor="bar">bar</label>
      </div>
    );
  }
}
```

onClick  : クリックしたとき
onChange : 変化したとき（入力したとき）

```js
class App extends Component {
  render() {
    return <input type="text" onClick={() => {console.log("I am clicked.")}} />;
  }
}
```

#### returnするタグは1つでないとシンタックスエラーとなる

- 複数のタグを返したい場合は`<div>`等で囲う
- タグを1つにまとめて返したくない場合、`<React.Fragment>` で囲う

### webpack

モジュールバンドラと呼ばれ、ソースコードを１つにまとめてくれるもの。  
複数のjsファイルがあった場合、bundle.jsにまとめられる。

htmlで複数のscriptタグを指定しなくてよくなり、１つの定義で完了する。

### Component

- ファンクショナルコンポーネント

関数の定義によって作成する

```js
import React from 'react';

const App = () => {
  return (
    <div>
      <Cat />
      <Cat />
      <Cat />
    </div>
  )
}

const Cat = () => {
  return <div>Meow!!</div>
}
```

- クラスコンポーネント

クラス定義によって作成する

```js
import React, { Component } from 'react';

class App extends Component {
  render() {
    return (
      <div>helloo</div>
    )
  }
}
```

### props

propertiesの略で、コンポーネントの属性。  
あるデータの属性に対して参照できるもの。

`{}`で渡し、`{}`内で使用する。

#### 使用例

`App`コンポーネントで`User`コンポーネントに対して  
`name` propsと`age` propsを渡している。

コンポーネントは再利用可能なため、  
複数使用することもできる。

```js
const App = () => {
  return (
    <div>
      <User name={"Taro"} age={10} />
      <User name={"Hanako"} age={1} />
    </div>
  )
}

const User = (props) => {
  return <div>Hi, I am {props.name}!, and {props.age} years old.</div>
}
```

#### 表示情報をまとめる

`profiles`にユーザー情報をまとめ、map関数で回す。

`key`によってDOMを管理しているため、DOMの変更点を把握させるために`key`が必要。  
使用していない場合、下記のような警告が表示される。

```
Warning: Each child in a list should have a unique "key" prop.
```

今回はmapのindexでkeyを指定。

```diff
const App = () => {
  const profiles = [
    { name: "Taro", age: 10},
    { name: "Hanako", age: 5}
  ]
  return (
    <div>
      {
+        profiles.map((profiles, index) => {
+          return <User name={profiles.name} age={profiles.age} key={index} />
        })
      }
    </div>
  )
}

const User = (props) => {
  return <div>Hi, I am {props.name}!, and {props.age} years old.</div>
}
```

#### default props

propsがない属性の初期値を設定することができる

```diff
const App = () => {
  const profiles = [
    { name: "Taro", age: 10},
    { name: "Hanako", age: 5},
+    { name: "NoName"}
  ]
  return (
    <div>
      {
        profiles.map((profiles, index) => {
          return <User name={profiles.name} age={profiles.age} key={index} />
        })
      }
    </div>
  )
}

const User = (props) => {
  return <div>Hi, I am {props.name}!, and {props.age} years old.</div>
}

+User.defaultProps = {
+  age: 1
+}
```

#### prop-types

propに対する型チェック。  
バリデーションのようなもの。

`prop-types`は型チェックするためのパッケージで、  
`import PropTypes from 'prop-types';`で定義

今回はわざと警告の出る`profiles`を用意。

```diff
+ import PropTypes from 'prop-types';

const App = () => {
+   const profiles = [
+     { name: 1, age: '10'},
+     { name: "NoName"}
+   ]
  return (
    <div>
      {
        profiles.map((profiles, index) => {
          return <User name={profiles.name} age={profiles.age} key={index} />
        })
      }
    </div>
  )
}

const User = (props) => {
  return <div>Hi, I am {props.name}!, and {props.age} years old.</div>
}

+ User.propTypes = {
+   name: PropTypes.string, //nameは文字列
+   age: PropTypes.number.isRequired, // numberは数値で存在が必須
+ }
```

下記は`prop-types`に引っかかった際の警告。

```js
// nameは文字列じゃないとダメだよ
Warning: Failed prop type: Invalid prop `name` of type `number` supplied to `User`, expected `string`.

// ageは数値じゃないとダメだよ
Warning: Failed prop type: Invalid prop `age` of type `string` supplied to `User`, expected `number`.

// ageは存在してないとダメだよ
Warning: Failed prop type: The prop `age` is marked as required in `User`, but its value is `undefined`.
```

### State

コンポーネント内に状態を保持させることができ、Stateと呼ぶ。  
クラスコンポーネントでのみ使用可能。

`props`は親から渡されるものに対して、`State`はコンポーネント内部でのみ使用される。  
`props`は変更不可で、`State`は変更可能。

```js
import React, { Component } from 'react'; // classを利用するため、{ Component } 必須

const App = () => (<Counter></Counter>)

class Counter extends Component{
  constructor(props){
    super(props) //親クラスで初期化処理
    this.state = { count: 0 } //Stateにcountを定義
  }

  render(){
    return(<div>count: { this.state.count }</div>) //this.state でStateにアクセス
  }
}
```

#### setState

状態を変化させる際は、`setState`を使用しなければならない。

`setState`で状態を更新させた場合は、再度`render`が実行され、  
状態に関連するDOMを更新してくれる。  

関連するDOM(今回は`<div>count: { this.state.count }</div>`のところ)が  
勝手に変わってくれて、変更箇所を気にする必要がない。  
(Reactすごい！)

```js
import React, { Component } from 'react';

const App = () => (<Counter></Counter>)

class Counter extends Component{
  constructor(props){
    super(props) //親クラスで初期化処理
    this.state = { count: 0 } //Stateにcountを定義
  }

  handlePlusButton = () => {
    // this.state.count + 1 とかはしてはいけない。
    // 必ずsetStateを使用する。
    this.setState( {count: this.state.count + 1} )
  }

  handleMinusButton = () => {
    this.setState( {count: this.state.count - 1} )
  }

  render(){
    return (
      <React.Fragment>
        <div>count: { this.state.count }</div>
        <button onClick={this.handlePlusButton}>+1</button>
        <button onClick={this.handleMinusButton}>-1</button>
      </React.Fragment>
    )
  }
}
```

## Redux

Fluxアーキテクチャ

コンポーネントの改装が大きくなったときに容易に状態を共有する手段を提供する。

[Qiita - 結局FluxやらReduxやらって何なのか個人的なまとめ](https://qiita.com/syossan27/items/7e1b2e07ac68b96bdaa7)

[Qiita - Fluxとはなんなのか](https://qiita.com/knhr__/items/5fec7571dab80e2dcd92)

[Qiita - Redux入門【ダイジェスト版】10分で理解するReduxの基礎](https://qiita.com/kitagawamac/items/49a1f03445b19cf407b7)

### 必要なパッケージのインストール

```console
$ yarn add redux react-redux
```

### Action

アプリケーションで何が起きたかを表すデータ。  
`type`と`typeに対応するユニークな値`で保存される.

#### Action Creator

Actionを返す関数。

アクションを定義してアクションを返す関数つまりアクションクリエイターを定義。

アクションクリエイターをエクスポートしてviewを担当するコンポーネント側でインポートして  
あるイベントを掴んだ時に当該のアクションクリエイターをインポートして  
適切な状態遷移を実行させるための仕組み

今回の場合は`+1するインクリメントのオブジェクト`と`-1するデクリメントのオブジェクト`の  
アクションクリエイターを定義。

`src/actions/index.js`

```js
// reducer側でも使用する
export const INCREMENT = 'INCREMENT'
export const DECREMENT = 'DECREMENT'

//↓アクションクリエイター
export const increment = () => ({
  type: INCREMENT
})

export const decrement = () => ({
  type: DECREMENT
})
```

### Reducer

Actionが発生した際に、typeに応じて
状態をどう変化させるか定義しているもの。

状態とはコード上の`State`のこと。

`src/reducers/index.js`は複数のReducerを結合する。  

```js
// Reducerを結合するための関数
import { combineReducers } from 'redux'
// count reducerをインポート
import count from './count'

// count reducerを結合する
export default combineReducers({ count })

// 複数Reducerがある場合、Reducerを列挙する。
// export default combineReducers({ foo, bar, bazz  })
```

counterの値の状態をもつReduserを定義するため、ファイル名は`src/reducers/count.js`

```js
// actionのtypeを定義
import { INCREMENT, DECREMENT } from '../actions'

// Stateの初期状態
// state ではcountの値を保持させる
const initialState = { value: 0 }

// 状態とアクションを引数にもつ
export default (state = initialState, action) => {
  // actionのtypeは action.type で取得
  switch (action.type) {
    case INCREMENT:
      return { value: state.value + 1 }
    case DECREMENT:
      return { value: state.value - 1 }
    default:
      return state
  }
}
```

### Store

Stateを集約させたもの。  
Stateを全階層のコンポーネントで使用可能にできる。

詳細は下記のコード。

```diff
import React from 'react';
import ReactDOM from 'react-dom';

+ // Storeを定義するための関数
+ import { createStore } from 'redux'
+ // 作成したStoreを全コンポーネントに渡すための機能
+ import { Provider } from 'react-redux'

import './index.css';

+ // 作成したReducerを定義
+ import reducer from './reducers'

+ // componentsとしてまとめておくとわかりやすい。
+ import App from './components/App';
import * as serviceWorker from './serviceWorker';

+ // アプリケーション唯一のStore
+ // アプリケーション内の全てのStateはこのStoreに集約される
+ const store = createStore(reducer);

+ // 既存のコンポーネントをProviderコンポーネントでラップし、
+ // store属性に作成したstoreを渡す。
+ // =>アプリケーション内の全階層のコンポーネントでStoreが利用可能になる。
+ ReactDOM.render(
+   <Provider store={store}>
+     <App />
+   </Provider>,
+   document.getElementById('root')
+ );

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
```

### connect

stateとactionをcomponentに関連付ける関数。  
actionには`dispatch`を渡す。  
`dispatch`: Actionが発生した際にReducerにtypeに応じた状態遷移を実行させるための関数

incrementをキーにincrement関数を引数にもつdispatcを定義

`src/components/App.js`

```js
import React, { Component } from 'react';
// connect関数を定義
import { connect } from 'react-redux'

import { increment, decrement } from '../actions'

class App extends Component{
  render(){
    const props = this.props
    return (
      <React.Fragment>
        <div>value: { props.value }</div>
        <button onClick={props.increment}>+1</button>
        <button onClick={props.decrement}>-1</button>
      </React.Fragment>
    )
  }
}

const mapStateToProps = state => ({ value: state.count.value })
// dispatch: Actionが発生した際にReducerにtypeに応じた状態遷移を実行させるための関数
// incrementをキーにincrement関数を引数にもつdispatchを定義
const mapDispatchToProps = dispatch => ({
  increment: () => dispatch(increment()),
  decrement: () => dispatch(decrement())
})

//stateとactionをコンポーネントに関連付ける
export default connect(mapStateToProps, mapDispatchToProps)(App)

```

mapDispatchToProps の処理は短くもかける。

```js
const mapDispatchToProps = ({ increment, decrement })
```