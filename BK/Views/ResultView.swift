//
//  ResultView.swift
//  mila
//
//  Created by hilmy ghozy on 03/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @State private var selectorIndex = 0
    
    @State private var numbers = ["Milestone", "Skrining"]
    var months = ["2 Bulan", "4 Bulan", "9 Bulan", "12 Bulan", "18 Bulan", "24 Bulan", "36 Bulan", "48 Bulan", "60 Bulan" ]
    @State private var selectedMonths = 0
    
    var names = "Budi"
    
    @State var pickerSelection = 0
    @State var barValues : [[CGFloat]] =
        [
        [123,110,30,170],
        [80,140,90,60],
        [150,70,70,10],
        ]
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                VStack {
                    Picker("Numbers", selection: $selectorIndex) {
                        ForEach(0 ..< numbers.count) { index in
                            Text(self.numbers[index]).tag(index)
                        }
                    }
                    .background(Color("Color3"))
                    .foregroundColor(Color("Color5"))
                    .cornerRadius(5)
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color("Color4"))
    //                Text("Selected value is: \(numbers[selectorIndex])").padding()
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(){
                            Button(action: {
                                
                            }){
                                VStack{
                                    Text("1")
                                    Text("Tahun")
                                }.tag(0)
                                .padding()
                                .background(Color("Color3"))
                                .cornerRadius(10)
                                .foregroundColor(Color("Color5"))
                            }
                            
                            Button(action:{
                                
                            }){
                                VStack{
                                    Text("2")
                                    Text("Tahun")
                                }.tag(1)
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                
                            }
                            
                            Button(action:{
                                
                            }){
                                VStack{
                                    Text("3")
                                    Text("Tahun")
                                }
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                
                            }
                            Button(action:{
                                
                            }){
                                VStack{
                                    Text("4")
                                    Text("Tahun")
                                }
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                
                            }
                            Button(action:{
                                
                            }){
                                VStack{
                                    Text("5")
                                    Text("Tahun")
                                }
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                
                            }
                        }
                        .padding()
                        .background(Color("Color4"))
                    }
                    
                    ZStack{
                        VStack{
                            Picker(selection: $pickerSelection, label: Text(""))
                                {
                                Text("Views").tag(0)
                                Text("Reads").tag(1)
                                Text("Fans").tag(2)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.horizontal, 10)

                            HStack(alignment: .center, spacing: 10)
                            {
                                ForEach(barValues[pickerSelection], id: \.self){
                                    data in
                                    BarView(value: data, cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
                                }
                                
                            }
                            .padding(.top, 24)
                            .animation(.default)
                        
                        }
                    }.padding()
                    
                    HStack{
                        VStack{
                            Text("4")
                            Text("Bahasa")
                                .padding([.top], 30)
                        }
                        .frame(minWidth:0, maxWidth: 79, minHeight: 0, maxHeight: 121)
                        .background(Color("Color3"))
                        .cornerRadius(10)
                        .foregroundColor(Color("Color5"))
                        VStack{
                            Text("4")
                            Text("Bahasa")
                                .padding([.top], 30)
                        }
                        .frame(minWidth:0, maxWidth: 79, minHeight: 0, maxHeight: 121)
                        .background(Color("Color3"))
                        .cornerRadius(10)
                        .foregroundColor(Color("Color5"))
                        VStack{
                            Text("4")
                            Text("Bahasa")
                                .padding([.top], 30)
                        }
                        .frame(minWidth:0, maxWidth: 79, minHeight: 0, maxHeight: 121)
                        .background(Color("Color3"))
                        .cornerRadius(10)
                        .foregroundColor(Color("Color5"))
                        VStack{
                            Text("4")
                            Text("Bahasa")
                                .padding([.top], 30)
                        }
                        .frame(minWidth:0, maxWidth: 79, minHeight: 0, maxHeight: 121)
                        .background(Color("Color3"))
                        .cornerRadius(10)
                        .foregroundColor(Color("Color5"))
                    }
                }.background(Color("Color4"))
            }
        }
        .navigationBarTitle(Text(names))
    }
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
