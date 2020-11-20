//
//  AnswerButton.swift
//  mila
//
//  Created by Muhammad Nashrullah on 18/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct AnswerButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 350, height: 60, alignment: .center)
            .background(Color("primary")).opacity(0.8)
//            .background(Color(red: 12.0 / 255.0, green: 121.0 / 255.0, blue: 150.0 / 255.0))
            .cornerRadius(10)
    }
}

struct AnswerButton: View {
    @Binding var textColor: Color
    var answer: String
    var onTap: () -> Void
    
    var body: some View {
        Button(action: {
            self.onTap()
        }) {
            Text(answer)
                .modifier(AnswerButtonModifier())
                .foregroundColor(textColor)
        }
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(textColor: .constant(.white), answer: "Hello", onTap: {})
    }
}
