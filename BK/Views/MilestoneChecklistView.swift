//
//  MilestoneChecklistView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 24/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct MilestoneChecklistView: View {
   @Binding var isNavigationBarHidden: Bool
    
    
    var body: some View {
        VStack {
            Text("Under Construction")
        }
        .navigationBarTitle("Mile", displayMode: .inline)
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

struct MilestoneChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneChecklistView(isNavigationBarHidden: .constant(false))
    }
}
