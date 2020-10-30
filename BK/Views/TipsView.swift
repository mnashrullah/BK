//
//  TipsView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 24/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct TipsView: View {
    var months = ["2 Bulan", "4 Bulan", "9 Bulan", "12 Bulan", "18 Bulan", "2 Tahun", "3 Tahun", "4 Tahun", "5 Tahun" ]
    @State var isActive: Int = 1
    @State private var selectedMonths = 0
    private let columns = 2
    
    var body: some View {
        makeGrid()
    }
    
    private func makeGrid() -> some View {
        let count = months.count
        let rows = count / columns + (count % columns == 0 ? 0 : 1)
        return
            NavigationView{
                VStack(alignment: .leading) {
                    ForEach(0..<rows) { row in
                        HStack(alignment: .firstTextBaseline) {
                            ForEach(0..<self.columns) { column -> cardTipsView in
                                let index = row * self.columns + column
                                if index < count {
                                    return cardTipsView(description: "\(self.months[index])", isActive: self.isActive, index: index)
                                    
                                } else {
                                    return cardTipsView(description: "", isActive: self.isActive, index: index)
                                    
                                }
                            }
                        }
                    }
                }.navigationBarTitle(Text("Tips"))
                Spacer()
        }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}


struct cardTipsView: View{
    var activeColor = Color.red
    var notActiveColor = Color.blue
    var activeText = Color.white
    var notActiveText = Color.black
    var activeOpacity = 1
    var notActiveOpacity = 0.2
    var description: String
    var image = Image("baby")
    var isActive: Int
    var index: Int
    
    var body: some View{
        VStack(alignment: .leading) {
            if description.isEmpty{
                HStack {
                    VStack(alignment: .leading) {
                        Text("")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(100)
                    Spacer()
                }
                .padding([.top,.horizontal])
                
            }else{
                NavigationLink(destination: TipsDetailView()){
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(description)
                                .font(.body)
                                .foregroundColor(self.isActive == self.index ? activeText : notActiveText)
                                .padding(10)
                        }
                            .background(self.isActive == self.index ? activeColor.frame(width:500): notActiveColor.frame(width:500)).offset(y:35)
                            
                            .layoutPriority(100)
                        Spacer()
                    }
                        .background(image.resizable().scaledToFill())
                        
                        .frame(height:Constants.mSize.height/8)
                        
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(self.isActive == self.index ? activeColor : Color(.sRGB, red: 255/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 2)
                            )
                    .padding([.top,.horizontal])
                }.buttonStyle(PlainButtonStyle())
                
            }
            
        }
    }
}


