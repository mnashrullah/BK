//
//  UserData.swift
//  mila
//
//  Created by Muhammad Nashrullah on 16/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var miles = mileData
    @Published var month = 2
    @Published var isFirstTime = true
}
