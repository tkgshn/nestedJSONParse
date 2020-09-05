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
    var projects: Project
//    ここら辺は問題なく表示できる
    var body: some View {
        VStack {
            Text(projects.name)
            Text(projects.category.name)
        }
    }
}

// MARK: - Previewの際にデコードする
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        //        let decoder = JSONDecoder()
        //        let projects = try! decoder.decode([Project].self, from: jsonData)
        //        return ContentView(projects: projects)
        
        ContentView(projects: testData[0])
        
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
