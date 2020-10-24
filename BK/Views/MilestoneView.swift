//
//  MilestoneView.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct MilestoneView: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = 0

    var body: some View {
        VStack{
            Text("Hallo")
        }
//        VStack {
//            Form{
//           Picker(selection: $selectedColor, label: Text("Please choose a color")) {
//              ForEach(0 ..< colors.count) {
//                 Text(self.colors[$0])
//              }
//           }
//        }
//        }
        
    }
}

struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneView()
    }
}
