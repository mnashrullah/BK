//
//  Mile.swift
//  mila
//
//  Created by Muhammad Nashrullah on 16/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

//
//import SwiftUI
//import CoreLocation
//
//struct Mile: Hashable, Codable, Identifiable {
//
//    var id: Int
//    var month: Int
////    var category: Category
//
////    enum Category: String, CaseIterable, Codable, Hashable {
////        case motorik = "Motorik"
////        case sosial = "Sosial"
////        case bahasa = "Bahasa"
////        case kognitif = "Kognitif"
////    }
//}



import SwiftUI
import CoreLocation

struct Mile: Hashable, Codable, Identifiable {
    var id: Int
    var month: Int
    var monthName: String
    var tips: [mileTips]
    var milestone: [mileCategory]
}

struct mileTips: Hashable, Codable, Identifiable {
    var id: Int
    var month: Int
    var name: String
    var category: Category
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case motorik = "Motorik"
        case sosial = "Sosial"
        case bahasa = "Bahasa"
        case kognitif = "Kognitif"
    }
    
}
struct mileCategory: Hashable, Codable, Identifiable{
    var id: Int
    var month: Int
    var name: String
    var category: Category
    var isComplete: Bool
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case motorik = "Motorik"
        case sosial = "Sosial"
        case bahasa = "Bahasa"
        case kognitif = "Kognitif"
    }
}
