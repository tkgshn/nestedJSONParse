//
//  ContentView.swift
//  JsonTest
//
//  Created by Shunsuke Takagi on 9/5/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

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
