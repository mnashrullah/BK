//
//  SummaryView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 24/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
     @Binding var isNavigationBarHidden: Bool
       
       
       var body: some View {
           VStack {
               Text("Tidak ada data")
           }
           .navigationBarTitle("Hasil", displayMode: .inline)
           .onAppear {
               self.isNavigationBarHidden = false
           }
       }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(isNavigationBarHidden: .constant(false))
    }
}
