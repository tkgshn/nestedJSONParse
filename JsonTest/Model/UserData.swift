//
//  UserData.swift
//  JsonTest
//
//  Created by Shunsuke Takagi on 9/12/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = true
    @Published var audioContents = audioContentData
}
