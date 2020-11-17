//
//  BarView.swift
//  mila
//
//  Created by hilmy ghozy on 03/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct BarView: View{

    var value: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {
        VStack {

            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: 200).foregroundColor(Color("Color3"))
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 30, height: value).foregroundColor(Color("Color5"))
                
            }
            .padding(.bottom, 8)
            Text("D")
        }
        
    }
}

