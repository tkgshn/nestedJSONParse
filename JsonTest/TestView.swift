import SwiftUI


// MARK: -  形の定義
//struct Project: Codable, Identifiable {
//    let id: Int
//    let name: String
//    let category: Category
//}
//
//struct Category: Codable {
//    let name: String
//    let slug: String
//}


// MARK: - Viewの呼び出し
struct TestView: View {
    
    //    var Test: Projec
    var ticker: Ticker
//    ここら辺は問題なく表示できる
    var body: some View {
        List {
            
            Text(ticker.autopayoutFrom)
            Text(ticker.lastPaymentAmount)

        }
    }
}

// MARK: - Previewの際にデコードする
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        //        let decoder = JSONDecoder()
        //        let project = try! decoder.decode([Project].self, from: jsonData)
        //        return ContentView(project: project)
        
        ContentView(ticker: testData[0])
        
    }
}


// MARK: - JSONの読み込み
//let jsonData = """
//[
//    {
//        "id": 1,
//        "name": "プロダクトのプロジェクトだよ",
//        "category": {
//            "name": "プロダクト",
//            "slug": "product"
//        }
//    },
//    {
//        "id": 2,
//        "name": "ファッションのプロジェクトだよ",
//        "category": {
//            "name": "ファッション",
//            "slug": "fashion"
//        }
//    }
//]
//""".data(using: .utf8)!
