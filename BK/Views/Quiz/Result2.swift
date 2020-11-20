//
//  Result.swift
//  mila
//
//  Created by Muhammad Nashrullah on 18/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct Result2: View {
    @Binding var isPresented: Bool
    
    var score: Int
    
    var body: some View {
        ZStack {
//            Color(red: 8.0 / 255.0, green: 43.0 / 255.0, blue: 62.0 / 255.0)
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text("Way to go, you have")
                        .foregroundColor(Color("text"))
                    Text("\(score)/4")
                        .foregroundColor(Color("text"))
                    Text("correct")
                        .foregroundColor(Color("text"))
                }
                .modifier(ResultTextModifier())
                
                PlayAgainButton(isResultPresented: $isPresented)
            }
            .padding()
        }
    }
}

struct Result2_Previews: PreviewProvider {
    static var previews: some View {
        Result2(isPresented: .constant(true), score: 0)
    }
}
