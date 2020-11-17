//
//  Constant.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct Constants {
    struct TabBarImageName {
        static let tabBar0 = "heart.fill"
        static let tabBar1 = "book.fill"
    }
    struct TabBarText {
        static let tabBar0 = "Anak"
        static let tabBar1 = "Ringkasan"
    }
    struct str {
        static let lorem = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    }
    struct mColor {
        static let gradient =
            LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
        static let gray4 = LinearGradient(gradient: Gradient(colors: [Color("Gray"), Color("Gray")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    struct mSize{
        static let width = UIScreen.main.bounds.width
        static let height = UIScreen.main.bounds.height
    }
}
