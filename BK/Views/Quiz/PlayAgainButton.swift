//
//  PlayAgainButton.swift
//  mila
//
//  Created by Muhammad Nashrullah on 18/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct PlayAgainButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color("Color3"))
//            .background(Color(red: 0, green: 147.0 / 255.0, blue: 135.0 / 255.0))
            .foregroundColor(.white)
            .cornerRadius(8.0)
    }
}

struct PlayAgainButton: View {
    @Binding var isResultPresented: Bool
    
    var body: some View {
        Button("Start a new round") {
            self.isResultPresented = false
        }
        .modifier(PlayAgainButtonModifier())
    }
}
