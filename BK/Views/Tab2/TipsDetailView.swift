//
//  TipsDetailView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 30/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct TipsDetailView: View {
    //    var item: Tips
    var tips: [Tips]
    var index: Int
    var tipsItem: [TipsItem]
    
    init(){
        tips = Tips.getAll
        index = UserDefaults.standard.integer(forKey:"month")
        tipsItem = TipsItem.getAll
        
    }
    @State private var selectedSegmented = 0
    @State private var selectedSegmentedText = 0
    
    var segmentedValue = ["Bahasa", "kognitif", "Motorik", "Sosial"]
    let cars = ["Subaru WRX", "Tesla Model 3", "Porsche 911", "Renault Zoe", "DeLorean"]
      @State private var searchText : String = ""

    
    var body: some View {
        ScrollView(.vertical){
            Image("baby")
                .scaledToFit().frame(width: Constants.mSize.width,height: Constants.mSize.height/4 )
                .padding(.bottom)
            
            VStack(alignment:.leading){
                Text("Milestone")
                
                Text("Anak usia \(tips[index].monthName)")
                    .font(.title)
                    .bold()
//                MARK: Segmented control
                Picker(selection: $selectedSegmented, label: Text("What is your favorite color?")) {
                    ForEach(0..<segmentedValue.count) { index in
                        Text(self.segmentedValue[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
//                MARK: Filter content based on segmented

                ForEach(tipsItem.filter{$0.category.localizedStandardContains(segmentedValue[self.selectedSegmented])}){item in
                    cardSimple(description: item.item)
                }
                
            }.padding()
         Spacer()
        }
    }
}

struct TipsDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        TipsDetailView()
    }
}


struct cardSimple: View{
    var description: String
    
    
    var body: some View{
        VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment: .leading) {
                    Text(description)
                }
                    
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
            
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
        )
            .padding([.top,.horizontal])
    }
}



