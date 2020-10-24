//
//  Tips.swift
//  mila
//
//  Created by Muhammad Nashrullah on 20/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct Tips: Identifiable {
    
    let id: UUID
    let month: Int
    let category: String
    let content: String

    
    static var getAll: [Tips] {
        [
            Tips(id: UUID(),
                      month: 2,
                      category: "Movement/Physical",
                      content: "1.Dapat mengangkat kepala dan mulai mendorong saat berbaring tengkurap 2.Membuat gerakan lebih halus dengan lengan dan kaki"),
            Tips(id: UUID(),
                      month: 4,
                      category: "Movement/Physical",
                      content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku")
        ]
    }
}
