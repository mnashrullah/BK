//
//  SummaryView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 24/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Float
    var lineSize: Int
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: CGFloat(lineSize)*1.3)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("primary"))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineSize), lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("text"))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text(String(format: "10/20", min(self.progress, 1.0)*100.0)).font(.body)
            
        }
    }
}
struct SummaryView: View {
//    var body: some View {
//        VStack  {
//            Picker(selection: $selectedSegmented, label: Text("What is your favorite color?")) {
//                ForEach(0..<segmentedValue.count) { index in
//                    Text(self.segmentedValue[index]).tag(index)
//                }
//            }.pickerStyle(SegmentedPickerStyle())
//                .padding(.horizontal)
//            ProgressBar(progress: self.$progressValue)
//                .frame(width: 150.0, height: 150.0)
//                .padding(40.0)
//            HStack(){
//                ForEach(0..<4){_ in
//                    VStack{
//                        ProgressBar(progress: self.$progressValue)
//                            .frame(width: Constants.mSize.width/7, height: Constants.mSize.width/7)
//                            .padding()
//                        Text("Social")
//
//                    }
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 15.0)
//                            .stroke(lineWidth: 2.0)
//                    )
//                }
//            }
//            Spacer()
//        }
//        .navigationBarTitle(Text("Hasil"))
//        .background(Color("Color4"))
//        .navigationBarColor(UIColor(named: "Color4"))
//        .onAppear {self.isNavigationBarHidden = false}
//
//    }
    
    @Binding var isNavigationBarHidden: Bool
    var percent: Double = 50
    var thickness: CGFloat = 20
    var fontSize:CGFloat = 15
    var gradientColors =  [Color.blue, Color.red]
    @State private var selectedSegmented = 0
    var segmentedValue = ["Milestone", "Skrining"]
    @State var progressValue: Float = 0.28
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
//                MARK: pilih segmented
                VStack() {
                    Picker("Numbers", selection: $selectorIndex) {
                        ForEach(0 ..< numbers.count) { index in
                            Text(self.numbers[index]).tag(index)
                        }
                    }
                    .cornerRadius(5)
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
    
//                    MARK: pilih tahun
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
                    }
//                    MARK: chart main
                    HStack(){
                        Text("Hasil Milestone")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                        Spacer()
                    }
                    .padding([.horizontal, .top])
                    
                    ProgressBar(progress: self.$progressValue, lineSize: 20)
                        .frame(width: 150.0, height: 150.0)
                        .padding(20)
                    
//                    MARK: chart detail
                    HStack(){
                        Text("Rincian")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                        Spacer()
                    }
                    .padding([.horizontal, .top])
                    
                    HStack(){
                        ForEach(0..<4){_ in
                            VStack{
                                ProgressBar(progress: self.$progressValue, lineSize: 10)
                                    .frame(width: Constants.mSize.width/7, height: Constants.mSize.width/7)
                                    .padding()
                                Text("Social")
                                    .foregroundColor(Color("text"))

                            }
                        }
                        .padding(.bottom,10)
                    }
                    
                    
                    
                    
                   
                }
            }
        }
        .background(Color("bg"))
        .navigationBarColor(UIColor(named: "bg"))

        .navigationBarTitle(Text("Hasil"), displayMode: .inline)
        .onAppear {self.isNavigationBarHidden = false}
    }
  
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(isNavigationBarHidden: .constant(false))
    }
}
