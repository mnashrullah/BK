//
//  ScreeningView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 24/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct ScreeningView: View {
    @Binding var isNavigationBarHidden: Bool
    
    var body: some View {
        QuizView()
//        VStack{
//            Text("Under Construction")
//        }
//        .navigationBarTitle("Skrining Disleksia", displayMode: .inline)
//
//        .onAppear {
//            self.isNavigationBarHidden = false
//        }

        
        
    }
}

struct ScreeningView_Previews: PreviewProvider {
    static var previews: some View {
        ScreeningView(isNavigationBarHidden: .constant(false))
    }
}
