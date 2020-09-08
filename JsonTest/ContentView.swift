//
//  ContentView.swift
//  JsonTest
//
//  Created by Shunsuke Takagi on 9/5/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var ticker: Ticker
    
    var body: some View {
        Text(ticker.workers["10003"]!.lastSubmit)
    }
}


// MARK: - Previewの際にデコードする
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        return ContentView(ticker: tickerData[0])
        
    }
}
