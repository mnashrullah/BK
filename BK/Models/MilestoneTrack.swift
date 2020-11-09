//
//  MilestoneTrack.swift
//  mila
//
//  Created by hilmy ghozy on 01/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI
import Foundation

struct MilestoneTrack: Identifiable, Hashable {
    
    var id: UUID
    var category: String
    var title: String
    var isComplete: Bool
    
    static var getAll: [MilestoneTrack] {
        [
            MilestoneTrack(id: UUID(),
                           category: "Motorik",
                           title: "Dapat mengayuh sepeda roda 3", isComplete: true),
            MilestoneTrack(id: UUID(),
                           category: "Bahasa",
                           title: "Menaiki dan menuruni tangga dengan setiap langkah 1 kaki", isComplete: false),
            MilestoneTrack(id: UUID(),
                           category: "Kognitif",
                           title: "Menaiki dan menuruni tangga dengan setiap langkah 1 kaki", isComplete: true),
            MilestoneTrack(id: UUID(),
                           category: "Sosial",
                           title: "Menaiki dan menuruni tangga dengan setiap langkah 1 kaki", isComplete: false),
            MilestoneTrack(id: UUID(),
                           category: "Sosial",
                           title: "Menaiki dan menuruni tangga dengan setiap langkah 1 kaki", isComplete: false)
        ]
    }
}

