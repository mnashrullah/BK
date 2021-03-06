//
//  SettingView.swift
//  mila
//
//  Created by hilmy ghozy on 31/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

class UserSetting: ObservableObject, Codable{
    enum CodingKeys: CodingKey {
        case type, mNotification
    }

    static let types = ["Bahasa Indonesia", "English"]

    @Published var type = 0
    @Published var mNotification = false

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(mNotification, forKey: .mNotification)
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(Int.self, forKey: .type)
        mNotification = try container.decode(Bool.self, forKey: .mNotification)

    }
    init() { }

}


struct SettingView: View {
    @ObservedObject var userSetting = UserSetting()
    func loadData(){
        
    }
    var body: some View {
        NavigationView{
            Form{
                Toggle(isOn: $userSetting.mNotification.animation()) {
                    Text("Notifikasi")
                }
                Picker("Bahasa", selection: $userSetting.type) {
                    ForEach(0..<UserSetting.types.count) {
                        Text(UserSetting.types[$0])
                    }
                }
            }.navigationBarTitle("Pengaturan")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
