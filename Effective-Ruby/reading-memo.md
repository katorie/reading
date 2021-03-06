# Effective Ruby
## 第2章

### 項目9 Rubyの最悪に紛らわしい構文に注意しよう
- メソッド名の末尾に`=`をつけると、そのメソッドはセッターメソッドになる。
  （インスタンス変数に外部からアクセスすることを許すために、セッターメソッドを用意する。）
- ゲッターとセッターの実装を、Rubyでは[attr_accessor](http://ref.xaio.jp/ruby/classes/module/attr_accessor)というヘルパーメソッドが担っている。
- 変数を作るのではなく、セッターメソッドを呼び出したいときはレシーバselfが必要。レシーバがないと、ただの変数になってしまう。

### 項目10 構造化データの表現にはHashではなくStructを使おう
- サンプルコードのように、データをHashで管理してしまうと、どのキーがCSVのどの欄に対応しているのかを調べなければならなくなってしまう。そこでStruct
- Struct.newの戻り値を定数に代入する

### 項目11 モジュールにコードをネストして名前空間を作ろう
- 複数のライブラリが同じ名前のクラスを定義したいときは、名前空間を使う。
- モジュール内に定義をネストして、衝突を避ける。
```ruby
module Notebooks
  class Binding
    def initialize (style, options={})
      @style = style
      @options = options
    end
  end
end
```
```ruby
style = Notebooks::Binding.new
```
- プロジェクトのディレクトリ構造に名前空間をあわせる。 `notebooks/binding.rb`
- レキシカルスコープを意識しないとうまく呼び出せないので注意する。

### 項目12 さまざまな等値の違いを理解しよう
- `equal?`は同じオブジェクトidを持つかどうか
- `eql?`はハッシュの内部で同じキーかどうか
- `==`はオブジェクトの内容が同じかどうか
- `===`はcase文でwhenに与えられたオブジェクトと比較するのに使ったり`/正規表現/ === "文字列"`とか

### 項目13 "<=>"とComparableモジュールで比較を実装しよう
- [Conparableモジュール](http://docs.ruby-lang.org/ja/2.2.0/class/Comparable.html)
- 憶えておくべきこと？？

> クラスのために"<=>"を実装した場合、特にインスタンスをハッシュキーとして使うつもりなら、eql?を"="の別名にすることを検討しよう。別名にする場合には、hashメソッドもオーバーライドしなければならない。

### 項目14 protectedメソッドを使ってプライベートな状態を共有しよう
- [カプセル化](http://www.minituku.net/courses/566428009/lessons/902584744/texts/943220687?locale=ja)
- [protectedメソッド](http://ref.xaio.jp/ruby/classes/module/protected)

### 項目15 クラス変数よりもクラスインスタンス変数を使うようにしよう
- [リファレンスマニュアル](http://docs.ruby-lang.org/ja/2.1.0/doc/spec=2fvariables.html#instance)
- [クラス変数とクラスインスタンス変数の違い](http://simanman.hatenablog.com/entry/2013/03/11/210756)


## 第3章 コレクション

### 項目16 コレクションを書き換える前に引数として渡すコレクションのコピーを作っておこう
- メソッド引数は値渡しではなく参照渡しである。
- `clone`より`dup`をつかったほうがいい。

### 項目17 nil、スカラーオブジェクトを配列に変換するには、Arrayメソッドを使おう
- `*`
- Arrayの引数ハッシュを渡すと、ネストされた配列になってしまう
- [スカラーオブジェクト？？？](http://docs.ruby-lang.org/ja/2.2.0/class/Psych=3a=3aNodes=3a=3aScalar.html)


### 項目18 要素が含まれているかどうかの処理を効率よく行うために集合を使うことを検討しよう
- 要素が含まれているかどうかの高速チェックには`Set`
- 67ページ何を言っているのかわからない


### 項目19 reduceを使ってコレクションを畳み込む方法を身に付けよう
