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
    @State var month: Int = 0
    
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
    
    @ObservedObject var observableContent = ObservableContent()
    
    @ObservedObject var observableTips = ObservableTips()
    
    
    var body: some View {
        ZStack{
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical){
                
                Image("baby")
                    .scaledToFit().frame(width: Constants.mSize.width,height: Constants.mSize.height/4 )
                    .padding(.bottom)

                VStack(alignment:.leading){
                    Text("\(type)")
                        .foregroundColor(Color("text"))

                    Text("Anak usia \(String(month)) bulan")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("text"))
                    Picker(selection: $selectedSegmented, label: Text("What is your favorite color?")) {
                        ForEach(0..<segmentedValue.count) { index in
                            Text(self.segmentedValue[index]).tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding(.top, 20)
                    if (type == "Milestone"){
                       ForEach(observableContent.data){item in
                           if(item.category == segmentedValue[selectedSegmented]){
                            cardSimple(description: item.name)}
                       }
                   }
                    
                    if (type == "Tips"){
                        ForEach(observableTips.data){item in
                            if(item.category == segmentedValue[selectedSegmented]){
                                cardSimple(description: item.name)}
                        }
                    }
                }.padding()
             Spacer()
               
                
            }
            .onAppear(){
                print("TipsDetailView")
                self.month = UserDefaults.standard.integer(forKey: "month")
                
                if type == "Milestone"{
                    print("load milestone")
                    observableContent.loadByMonth(month:self.month)
                    print(observableContent.data)
                } else if type == "Tips"{
                    print("load tips")
                    observableTips.loadByMonth(month:self.month)
                    print(observableTips.data)
                    
                }
                
                
            }
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
                        .foregroundColor(Color("text"))
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



