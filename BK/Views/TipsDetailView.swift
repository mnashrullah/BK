//
//  TipsDetailView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 30/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct TipsDetailView: View {
    var item: Tips
    var body: some View {
        VStack{
            Image("baby").scaledToFit().frame(height: Constants.mSize.width/4 )
//            Text(item.monthName)
            Spacer()
        }.onAppear(){
            print(self.item)
        }
        
    }
}
//
//struct TipsDetailView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        TipsDetailView(item: tips[0])
//    }
//}
