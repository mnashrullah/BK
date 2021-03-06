//
//  PageViewContainer.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct PageViewContainer<Page: View>  : View {
    
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    @State var buttonText = "Next"
    var presentSignupView: (()->()) = {}
    
    
    
    var body: some View {
        
        return VStack {

            PageViewController(controllers: viewControllers, currentPage: self.$currentPage)
            
//            PageIndicator(currentIndex: self.currentPage)

            VStack {
                
                Button(action: {
                    if self.currentPage < self.viewControllers.count - 1{
                        self.currentPage += 1
                    } else {
                        self.presentSignupView()
                    }
                }) {
                    HStack {

                        Text(currentPage == viewControllers.count - 1 ? "Mulai" : "Selanjutnya" )
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .accentColor(Color("text"))
                            .background(Color("primary"))
                            .cornerRadius(5)
                    }.padding()
                }
            }.padding(.vertical)
        }
//        .background(Constants.mColor.gradient)
        .background(Color("bg"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct PageViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        PageViewContainer( viewControllers: Page.getAll.map({  UIHostingController(rootView: PageView(page: $0) )  }))
    }
}
