//
//  Page.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct Page: Identifiable {
    
    let id: UUID
    let image: String
    let heading: String
    let subSubheading: String
    
    static var getAll: [Page] {
        [
            Page(id: UUID(),
                 image: "onboarding1",
                 heading: "Milestone",
                 subSubheading: "Memantau tumbuh kembang anak anda bersama Mila"),
            Page(id: UUID(),
                 image: "onboarding2",
                 heading: "Skrining",
                 subSubheading: "Pastikan si buah hati selalu aman dengan uji skrining yang terpercaya"),
            Page(id: UUID(),
                image: "onboarding3",
                heading: "Mila",
                subSubheading: "Kenali aktivitas anak anda bersama Mila")
        ]
    }
}
