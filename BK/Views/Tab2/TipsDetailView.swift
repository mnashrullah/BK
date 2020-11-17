//
//  TipsDetailView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 30/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct TipsDetailView: View {
    var mile: Mile
    var type: String
    //    var item: Tips
//    var tips: [Tips]
//    var index: Int
//    var tipsItem: [TipsItem]
//
//
//    init(){
//        tips = Tips.getAll
//        index = UserDefaults.standard.integer(forKey:"month")
//        tipsItem = TipsItem.getAll
//
//
//    }
    @State private var selectedSegmented = 0
    @State private var selectedSegmentedText = 0
    
    var segmentedValue = ["Motorik", "Sosial", "Bahasa", "Kognitif"]

    @State private var searchText : String = ""
    
    
    var body: some View {
       
        ScrollView(.vertical){
            
            Image("baby")
                .scaledToFit().frame(width: Constants.mSize.width,height: Constants.mSize.height/4 )
                .padding(.bottom)

            VStack(alignment:.leading){
                Text("\(type)")

                Text("Anak usia \(String(mile.month))")
                    .font(.title)
                    .bold()
//                MARK: Segmented control
                Picker(selection: $selectedSegmented, label: Text("What is your favorite color?")) {
                    ForEach(0..<segmentedValue.count) { index in
                        Text(self.segmentedValue[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.top, 20)

//                MARK: Filter content based on segmented

//                ForEach(mile.milestone.filter{$0.category.localizedStandardContains(segmentedValue[self.selectedSegmented])}){item in
//                    cardSimple(description: item.item)
//                }
                if (type == "Milestone"){
                    ForEach(mile.milestone){item in
                        if(item.category.rawValue == segmentedValue[selectedSegmented]){
                            cardSimple(description: item.name)}
                    }
                }
                if (type == "Tips"){
                    ForEach(mile.tips){item in
                        if(item.category.rawValue == segmentedValue[selectedSegmented]){
                            cardSimple(description: item.name)}
                    }
                }
                
//                ForEach(mile.milestone.category=segmentedValue[self.selectedSegmented]){item in
//                    cardSimple(description: item.name)
//                }

            }.padding()
         Spacer()
            
        }
    }
}
//
//struct TipsDetailView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        TipsDetailView()
//    }
//}


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



