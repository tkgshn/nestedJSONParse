# nestedJSONParse
this article shows **How to parse nested JSON on SwiftUI MVVM model.** 
if you can not read Japanese, you should use a translater. I've published Code on GitHub. check this out. 
if you have any question, you can keep in touch with me from my [Twitter (tkgshn)](https://twitter.com/tkgshn)
<a href="https://github.com/tkgshn/nestedJSONParse"><img src="https://github-link-card.s3.ap-northeast-1.amazonaws.com/tkgshn/nestedJSONParse.png" width="460px"></a>

## はじめに


SwiftUIを使って、入れ子構造になっているJSONファイルをパース（分解）し、表示させるところまでを解説した記事です。
なぜこの記事を書いたのかというと、**「入れ子構造になっているJSONファイルのパース」**と**「SwiftUIでの解説」**が見つからなかったからです。2週間前の自分と同じ実装で悩んでいる人に向けて書いています。

この記事では、[Appleが公開しているSwiftUIのチュートリアル](https://developer.apple.com/tutorials/swiftui)にそった**MVVMモデルで、入れ子構造になったJSONをパース（分解）して、実際にViewに表示させる**ところまでを紹介します。


### 作るもの
![5d9a68e694de4c3cdb5af28bea23435d.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/224347/fed0f9c5-66d2-8c35-3cc8-cd2f44ce1522.gif)
今回作るのは、

- **「英語学習の際のトピック」を親の情報**として、
- **『単語（日本語・英語）』を子供と見立て**、情報を同時に表示することです。

これは、入れ子構造（「ネストした」などとも言う）のJSONを分解して、親の情報と子の情報を同時に表示しています。

>なお、**今回のコードはこちらのGitHubから見ることが出来るので、コードだけ見たい人はどうぞ。**
><a href="https://github.com/tkgshn/nestedJSONParse"><img src="https://github-link-card.s3.ap-northeast-1.amazonaws.com/tkgshn/nestedJSONParse.png" width="460px"></a>

SwiftUIを始める方は、こちらの [Appleが公開しているSwiftUIのチュートリアル](https://developer.apple.com/tutorials/swiftui) を最後まで完走していることをオススメします。

簡単に、データの構造を示してみるとこんな感じです。
なお、この図はGitHubある、[drow.io](https://github.com/tkgshn/nestedJSONParse/blob/master/NestedJSONParse.drawio) から見ることができます。

#### 今回扱うデータの構造
<img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/224347/a9c13c71-65ff-bded-a9ac-c37b04555793.png" width="500" height=500px >

```audioContentData.json
[
{
    "id": 0,
    "name": "人称",
    "description": "留学に行く際に空港で聞かれる内容をまとめた内容です",
    "phrases":{
        "1": {"japanese": "Aゲートはどこですか？", "english": "Where is the Gate A ?"},
        "2": {"japanese": "私は日本へ行きます", "english": "I'll go to Japan"}
    }
},
{
    "id": 2,
    "name": "国と言語",
    "description": "国と言語を説明する際に使う英語をまとめました",
    "phrases": {
        "1": {"japanese": "私は日本出身です。", "english": "I'm from Japan"},
        "2": {"japanese": "日本語は世界の言葉に比べて難しいです", "english": "Japanese is difficult than other languages"}
    }
}
]

```

JSONが入れ子構造になっていることがわかると思います。今回はこちらを説明していきます。
次に、SwiftUIのチュートリアルで使われたJSONを紹介していきます。
#### SwiftUI チュートリアルで行っている方法
<img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/224347/dc60551d-69e2-349f-fa4c-6bc2c7e32f95.png" width="500" height=500px >

```test.json
[
    {
        "name": "Turtle Rock",
        "category": "Rivers",
        "city": "Twentynine Palms",
        "state": "California",
        "id": 1001,
        "isFeatured": true,
        "isFavorite": true,
        "park": "Joshua Tree National Park",
        "coordinates": {
            "longitude": -116.166868,
            "latitude": 34.011286
        },
        "imageName": "turtlerock"
    },
    {
        "name": "Silver Salmon Creek",
        "category": "Lakes",
        "city": "Port Alsworth",
        "state": "Alaska",
        "id": 1002,
        "isFeatured": false,
        "isFavorite": false,
        "park": "Lake Clark National Park and Preserve",
        "coordinates": {
            "longitude": -152.665167,
            "latitude": 59.980167
        },
        "imageName": "silversalmoncreek"
    }
]
```
こちらがSwiftUI チュートリアルで使用されているJSONのファイルの一部抜粋です。一見入れ子構造になっている気がする、こちらの `coordinates` の要素ですが、
>"coordinates": {
            "longitude": -116.166868,
            "latitude": 34.011286
        },

コードを読み進めてみると、位置情報の取得に使われているだけで、入れ子構造で処理したい人が参考になるようなコードではありません。なので、**無視してもらって大丈夫です。**

### 対象読者

- 「SwiftUIからiOSでのアプリ開発を始めた」
- 「JSONなどのデータの取り扱いは初めて」
- 「とりあえずなんとか動いてほしい」
- 「ちょっと複雑なデータを持つアプリを作りたい」

という、2週間前の筆者の状況の方へ向けた記事です。

この記事では、**ある程度「SwiftUIがどう動くか？」というのは分かってきたけど、自分のほしいものは微妙に作れない。**という状態の人へオススメです。 

そのため、初歩的なSwiftUIの表示などの説明はしていません。

かわりに、なるべく参考記事へのリンクやキーワードを載せました。まったくわからない人は、適宜キーワードを検索しつつ手を動かしてみてください！

では、やっていきましょう〜！ 🦄

## 前提
SwiftUIの導入・基本はこちらの記事が参考になります。

- [Introducing SwiftUI - Apple](https://developer.apple.com/tutorials/swiftui)
- [【Xcode】超初心者のためのSwiftUIチュートリアル1](https://note.com/nyakko/n/n7096926a5c95) 
- [公式チュートリアルで学ぶ SwiftUI](https://qiita.com/koogawa/items/b91f83e0075dd5a4ce5f)




## データを作る

続いて、今回の目標は**「データを表示させること」**なので、表示させるものがなければ始まりません。
正直、表示するものはなんでもいいのですが今回は「英語学習アプリ」を想定して、以下のようなJSONを作ってみました。

```audioContentData.json
[
{
    "id": 0,
    "name": "人称",
    "description": "留学に行く際に空港で聞かれる内容をまとめた内容です",
    "phrases":{
        "1": {"japanese": "Aゲートはどこですか？", "english": "Where is the Gate A ?"},
        "2": {"japanese": "私は日本へ行きます", "english": "I'll go to Japan"}
    }
},
{
    "id": 2,
    "name": "国と言語",
    "description": "国と言語を説明する際に使う英語をまとめました",
    "phrases": {
        "1": {"japanese": "私は日本出身です。", "english": "I'm from Japan"},
        "2": {"japanese": "日本語は世界の言葉に比べて難しいです", "english": "Japanese is difficult than other languages"}
    }
}
]

```

`名前（name）`や`概要（description）`の下に、単語（phrases）があり、英語・日本語の文字列を持っている状態ですね。

>- id
- name
- description
    - japanese
    - english 

このサンプルデータはなんでもいいのですが、今回はこんな形で行こうと思います。

## データ（JSON）を受け取るモデルを作成

この章では、「Model」という名前でまとめられたグループの説明をしていきます。


### 1. チュートリアルのコードを見てみよう 
チュートリアルでは、こんな感じのファイルがありましたね。
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/224347/21efd8e0-5c05-733b-2ae7-e539d204996f.png)
こんなファイル構造になっていることがわかると思います。

```Model_SwitUI_tutorial.group
- Landmark.swift
- UserData.swift
- Data.swift
- Hike.swift
```
---

### 2. 今回のModelの構成
**今回は、このような「Model」のファイル構成にしてみました**、少し無駄なファイルを減らしたので、少なくなっています。
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/224347/7468db44-666e-15f1-9df9-b008bb90e73b.png)

```Model_nestedJSONParse.group
- AudioContent.swift
- Data.swift
- UserData.swift
```
まずは、一番上の`Landmark.swift`と `AudioContent.swift` の詳細から見ていきましょう。（ファイル名は違いますが、どちらも同じような働きをします）



<details><summary>クリックして`Landmark.swift`を見る</summary><div>

```Landmark.swift
/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    var featureImage: Image? {
        guard isFeatured else { return nil }
        
        return Image(
            ImageStore.loadImage(name: "\(imageName)_feature"),
            scale: 2,
            label: Text(name))
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
```

</div></details>

しかし、今回は複雑なコードになってしまう原因である **fileprivate** や **enum** などは使わないことにします。

```AudioContent.swift
import SwiftUI

// MARK: - AudioContent
struct AudioContent: Codable, Identifiable {
    //    コンテンツのid
    var id: Int
    //    コンテンツのタイトル
    var name: String
    //    コンテンツの概要
    var description: String
    // フレーズの入れ子を作る
    var phrases: [String: Phrase]
    
}


// MARK: - Phrase
struct Phrase: Codable {
    var japanese: String
    var english: String
}
```

その結果、こんな感じになります。

この時のモデルのコード生成とかは、[https://app.quicktype.io/](https://app.quicktype.io/) を使えば、**自動で生成できるので頑張らなくて大丈夫です。**　


>使い方に関しては、以下の記事などを参考にしてください。
- [JSON から各言語のコードを生成する quicktype の Haskell 出力を実装した](https://app.quicktype.io/) 
- [圧倒的捗り！！JSONデータからモデルを自動生成してくれるquicktypeが便利すぎるので紹介してみる](https://dev.classmethod.jp/articles/quicktype/)



なお、注意としてはサンプルよりも複雑なJSONを扱おうとすると、`Landmark.swift`で出てきたような **fileprivate** や **enum** を使うをやむ得なくなると思います。

そうなった場合は、quicktype では処理出来ない（文字列からでは画像を取り扱いのかはわからない）ので、他のサンプルコードを参考にやってみてください。

---

### 3. 「Model」に入っていたその他のファイル
その他のファイルで、説明していない `Data.swift` と `UserData.swift` があったと思います。



<details><summary>クリックして`Data.swift `を見る</summary><div>

```Data.swift
import Foundation
import CoreLocation
import SwiftUI

let landmarkData: [Landmark] = load("landmarkData.json")
let features = landmarkData.filter { $0.isFeatured }
let hikeData: [Hike] = load("hikeData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}


```

</div></details>

<details><summary>クリックして`UserData.swift `を見る</summary><div>

```UserData.swift
import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}

```

</div></details>

正直難しいので、初心者の方が理解をするのは時間がかかるとは思いますが、簡単に説明すると

 1. JSONファイルを読み取るところ
 2. アプリ操作する人（User）のデータを処理するところ

という認識で問題ないです。 

>詳しい紹介はこちらの記事を参考にしてください
[SwiftUI Tutorialsを読み解く](https://qiita.com/chino_tweet/items/9565dc4b5e7378fea2ef)

## 表示する

実装をしていきます。
ほとんど内部の処理は分離させていないので、もうちょっときれいに書けるはずです。

```ContentView.swift
import SwiftUI

struct ContentView: View {

    @EnvironmentObject var userData: UserData
    var audioContent: AudioContent
    
    var body: some View {
        NavigationView {
            List {
                ForEach(audioContentData) { audioContent in
                    NavigationLink(
                        destination:
                        VStack{
                            Text(audioContent.name)
                                .font(.largeTitle)
                                .padding(.top)
                            Text(audioContent.description)
                                .padding([.top, .leading, .trailing])
                            Divider()
                                .padding(.top)
                            //                下に書いている
                            PhraseRow(audioContent: audioContent)
                                .padding(.top)
                            })
                    {
                        Text(audioContent.name)
                    }
                }
            }
            .navigationBarTitle("all List!")
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ContentView(audioContent: userData.audioContents[0])
            .environmentObject(UserData())
        
    }
}




// MARK: - 単語を表示する部分
struct PhraseRow: View {
    var audioContent: AudioContent
    var body: some View {
        //        Phraseが持っている個数分より多い数、ループを回すとクラッシュしてしまう
        ForEach(1..<3) { num in
            //                日本語を取得
            VStack(alignment: .leading) {
                Text(self.audioContent.phrases[String(num)]!.japanese)
                    .padding(.bottom)
                //                英語を取得
                Text(self.audioContent.phrases[String(num)]!.english)
            }
            Divider()
        }
    }
}
```

最初のListは名前だけを取得するようにしました
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/224347/30a48c76-c6de-61bc-8c78-3afd53a7aa99.png)

タップして遷移すると、こちらのコードのおかげで

```PhraseRow.swift
// MARK: - 単語を表示する部分
struct PhraseRow: View {
    var audioContent: AudioContent
    var body: some View {
        //        Phraseが持っている個数分より多い数、ループを回すとクラッシュしてしまう
        ForEach(1..<3) { num in
            //                日本語を取得
            VStack(alignment: .leading) {
                Text(self.audioContent.phrases[String(num)]!.japanese)
                    .padding(.bottom)
                //                英語を取得
                Text(self.audioContent.phrases[String(num)]!.english)
            }
            Divider()
        }
    }
}
```


1. **親が持っている情報**
    -  `audioContent.name`
    -  `audioContent.description`
2.  **子が持っている情報**
    - `audioContent.phrases[String(num)]!.japanese` 
    - `audioContent.phrases[String(num)]!.english`

が表示されています。

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/224347/68cd35bf-3b3a-6eb7-7670-8e2c542b053d.png)



## 参考サイト

**I wish to say big thanks for the Indian on stackover flow.**

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/224347/17860fd5-6ec8-ed14-a795-6f51b4496b8d.png)
 

- [Parsing nested JSON arrays in Swift](https://stackoverflow.com/questions/54821142/parsing-nested-json-arrays-in-swift)
- [How to parse nested json? Swift](https://stackoverflow.com/questions/54109809/how-to-parse-nested-json-swift)
- [Building Breather (Part 4): Nested JSON Parsing with Decodable, CodingKeys and RxMoya’s filter and map](https://medium.com/@alexandrosbaramilis/building-breather-part-4-nested-json-parsing-with-decodable-codingkeys-and-rxmoyas-filter-and-515eef3265a5)
- [Access nested JSON object - Swift](https://developer.apple.com/forums/thread/114123)

