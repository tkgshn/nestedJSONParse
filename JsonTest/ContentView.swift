//
//  ContentView.swift
//  JsonTest
//
//  Created by Shunsuke Takagi on 9/5/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShown: Bool = false
    var ticker: Ticker
    
    var body: some View {
//        とりあえず問題のviewに遷移させてみる
        Text("ここをクリックで別画面")
        .buttonStyle(PlainButtonStyle())
        .padding(.bottom, 10.0)
        .frame(width: nil)
        .font(.system(size: 55.0, weight: .thin))
        .foregroundColor(.gray)
        .onTapGesture {
            self.isShown = true
        }
            .sheet(isPresented: self.$isShown) {
                //モーダル遷移した後に表示するビュー
                TestView(ticker: testData[0])
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(ticker: testData[0])
    }
}
