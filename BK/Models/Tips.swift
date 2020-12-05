//
//  Tips.swift
//  mila
//
//  Created by Muhammad Nashrullah on 20/10/20.
//  Copyright © 2020 BK. All rights reserved.
//
//
//import SwiftUI
//
//struct TipsItem: Identifiable{
//    let id: UUID
//    let month: Int
//    let category: String
//    let item: String
//    static var getAll:[TipsItem]{
//
//        [
//            TipsItem(id: UUID(), month: 2, category: "Bahasa", item: "Mengulangi ucapan dari orang/anak sekitarnya"),
//            TipsItem(id: UUID(), month: 2, category: "Bahasa", item: "Menyuarakan suara"),
//            TipsItem(id: UUID(), month: 2, category: "Bahasa", item: "Mulai mengoceh"),
//            TipsItem(id: UUID(), month: 2, category: "Bahasa", item: "Mengoceh sambil menunjukkan ekspresi dan meniru suara yang ia dengar"),
//            TipsItem(id: UUID(), month: 2, category: "Bahasa", item: "Menangis untuk memberitahu ia lapar, sakit atau lelah"),
//            TipsItem(id: UUID(), month: 2, category: "Sosial", item: "Tersenyum, terutama ketika berhadapan dengan orang/anak lain"),
//            TipsItem(id: UUID(), month: 2, category: "Sosial", item: "Senang bermain dengan orang/anak lain dan bisa menangis jika berhenti bermain"),
//            TipsItem(id: UUID(), month: 2, category: "Sosial", item: "Meniru gerakan dan mimik wajah, ketika tersenyum ataupun cemberut"),
//            TipsItem(id: UUID(), month: 2, category: "Motorik", item: "Tidak perlu bantuan lagi untuk menegakkan kepalanya"),
//            TipsItem(id: UUID(), month: 2, category: "Motorik", item: "Mampu berguling kesamping"),
//            TipsItem(id: UUID(), month: 2, category: "Motorik", item: "Bisa memegang mainan dan mengguncangnya lalu memutar-mutarnya"),
//            TipsItem(id: UUID(), month: 2, category: "Motorik", item: "Memasukkan tangan kemulut"),
//            TipsItem(id: UUID(), month: 2, category: "Motorik", item: "Ketika berbaring telungkup, mengangkat badan dengan sikunya"),
//            TipsItem(id: UUID(), month: 2, category: "kognitif", item: "Menunjukkan perasaan senang ataupun sedih ke orang lain"),
//            TipsItem(id: UUID(), month: 2, category: "kognitif", item: "Merespon kasih sayang"),
//            TipsItem(id: UUID(), month: 2, category: "kognitif", item: "Meraih mainan dengan satu tangan"),
//            TipsItem(id: UUID(), month: 2, category: "kognitif", item: "Menggunakan mata dan tangan secara bersamaan, seperti melihat mainan dan meraihnya"),
//            TipsItem(id: UUID(), month: 2, category: "kognitif", item: "Mengikuti benda bergerak dengan matanya dari ujung ke ujung"),
//            TipsItem(id: UUID(), month: 2, category: "kognitif", item: "Memperhatikan wajah orang lain dengan cukup dekat"),
//            TipsItem(id: UUID(), month: 2, category: "kognitif", item: "Mengenali orang/anak atau benda yang familiar"),
//
//        ]
//    }
//}
//struct Tips: Identifiable {
//
//    let id: UUID
//    let month: Int
//    let monthName: String
//    let category: String
//    let content: String
//
//
//    static var getAll: [Tips] {
//        [
//            Tips(id: UUID(),
//                 month: 2,
//                 monthName: "0-2 Bulan",
//                 category: "Movement/Physical",
//                 content: "1.Dapat mengangkat kepala dan mulai mendorong saat berbaring tengkurap 2.Membuat gerakan lebih halus dengan lengan dan kaki"),
//            Tips(id: UUID(),
//                 month: 4,
//                 monthName: "2-4 Bulan",
//                 category: "Movement/Physical",
//                 content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
//            Tips(id: UUID(),
//                 month: 9,
//                 monthName: "4-9 Bulan",
//                 category: "Movement/Physical",
//                 content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
//            Tips(id: UUID(),
//                 month: 12,
//                 monthName: "9-12 Bulan",
//                 category: "Movement/Physical",
//                 content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
//            Tips(id: UUID(),
//                 month: 18,
//                 monthName: "12-18 Bulan",
//                 category: "Movement/Physical",
//                 content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
//            Tips(id: UUID(),
//                 month: 24,
//                 monthName: "18-24 Bulan",
//                 category: "Movement/Physical",
//                 content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
//            Tips(id: UUID(),
//                 month: 36,
//                 monthName: "24-36 Bulan",
//                 category: "Movement/Physical",
//                 content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
//            Tips(id: UUID(),
//                 month: 48,
//                 monthName: "36-48 Bulan",
//                 category: "Movement/Physical",
//                 content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
//            Tips(id: UUID(),
//                 month: 60,
//                 monthName: "48-60 Bulan",
//                 category: "Movement/Physical",
//                 content: "1.Pegang kepala dengan mantap, tidak didukung \n2.Menekan kaki saat kaki berada di permukaan yang keras \n3.Dapat berguling dari perut ke punggung \n4.Dapat memegang mainan dan menggoyangkannya serta mengayunkan mainan yang menggantung \n5.Membawa tangan ke mulut \n6.Saat berbaring tengkurap, dorong hingga siku"),
//
//        ]
//    }
//}
