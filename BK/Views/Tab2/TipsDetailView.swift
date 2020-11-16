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
        
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "Color7")
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "Color8")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    @State private var selectedSegmented = 0
    @State private var selectedSegmentedText = 0
    
    var segmentedValue = ["Bahasa", "kognitif", "Motorik", "Sosial"]
    let cars = ["Subaru WRX", "Tesla Model 3", "Porsche 911", "Renault Zoe", "DeLorean"]
      @State private var searchText : String = ""

    
    var body: some View {
       
        ScrollView(.vertical){
//                MARK: Segmented control
        Picker(selection: $selectedSegmented, label: Text("What is your favorite color?")) {
            ForEach(0..<segmentedValue.count) { index in
                Text(self.segmentedValue[index]).tag(index)
            }
        }.pickerStyle(SegmentedPickerStyle())
            
            Image("baby")
                .scaledToFit().frame(width: Constants.mSize.width,height: Constants.mSize.height/2 )
                .padding(.bottom)

            VStack(alignment:.leading){
                Text("Ringkasan")

                Text("Anak usia \(tips[index].monthName)")
                    .font(.title)
                    .bold()

//                MARK: Filter content based on segmented

                ForEach(tipsItem.filter{$0.category.localizedStandardContains(segmentedValue[self.selectedSegmented])}){item in
                    cardSimple(description: item.item)
                }
//                .background(Color("Color7"))

            }.padding()
         Spacer()
        }
        .background(Color("bg"))
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
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color("Color7"), lineWidth: 1)
        )
        .padding([.top,.horizontal])
    }
}



