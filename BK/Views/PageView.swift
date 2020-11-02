//
//  PageView.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct PageView: View {
    var page = Page.getAll.first!
    @State var height = UIScreen.main.bounds.height
    
    var body: some View {
        
        
        ZStack{
        
        Color("Color").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0){
//
//            Image("orange")
//            .resizable()
            
                ZStack(alignment: .leading) {
                VStack{
                    HStack{
                        Text(NSLocalizedString(page.heading, comment: "heading"))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                    }.padding(.top, 25)
                    HStack{
                        Text(NSLocalizedString(page.subSubheading, comment: "subheading"))
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                    }.padding(.top, 25)
                    
                    
                  
                    
                }
                .padding(.bottom, 40)
                .padding(.horizontal,20)
//                .background(CustomShape().fill(Constants.mColor.gradient))
//                .clipShape(Corners())
            }
            }
            
        }
//        VStack{
////            Spacer()
//            VStack{
//                Image(page.image)
//                Text(NSLocalizedString(page.heading, comment: "heading")).font(.largeTitle).bold().layoutPriority(1).multilineTextAlignment(.center)
//                    .foregroundColor(Color.black)
//                Text(NSLocalizedString(page.subSubheading, comment: "subheading")).multilineTextAlignment(.center)
//                    .foregroundColor(Color.black)
//
//            }
//
////                .padding(.top, -45)
//            Spacer()
//
//        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}

struct CustomShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
        }
    }
}

struct Corners : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
