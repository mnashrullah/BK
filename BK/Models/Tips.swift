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
    let monthName: String
    let category: String
    let content: String

    
    static var getAll: [Tips] {
        [
            Tips(id: UUID(),
                      month: 2,
                      monthName: "0-2 Bulan",
                      category: "Movement/Physical",
                      content: "1.Dapat mengangkat kepala dan mulai mendorong saat berbaring tengkurap 2.Membuat gerakan lebih halus dengan lengan dan kaki"),
            Tips(id: UUID(),
                      month: 4,
                      monthName: "2-4 Bulan",
                      category: "Movement/Physical",
                      content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
            Tips(id: UUID(),
            month: 9,
            monthName: "4-9 Bulan",
            category: "Movement/Physical",
            content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
            Tips(id: UUID(),
            month: 12,
            monthName: "9-12 Bulan",
            category: "Movement/Physical",
            content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
            Tips(id: UUID(),
            month: 18,
            monthName: "12-18 Bulan",
            category: "Movement/Physical",
            content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
            Tips(id: UUID(),
            month: 24,
            monthName: "18-24 Bulan",
            category: "Movement/Physical",
            content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
            Tips(id: UUID(),
            month: 36,
            monthName: "24-36 Bulan",
            category: "Movement/Physical",
            content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
            Tips(id: UUID(),
            month: 48,
            monthName: "36-48 Bulan",
            category: "Movement/Physical",
            content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
            Tips(id: UUID(),
            month: 60,
            monthName: "48-60 Bulan",
            category: "Movement/Physical",
            content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
            
        ]
    }
}
