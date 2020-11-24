//
//  SummaryView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 24/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Int
    var max: Int
    
    var lineSize: Int
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: CGFloat(lineSize)*1.3)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("primary"))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(Float(self.progress)/Float(self.max), 1.0)))
//                .trim(from: 0.0, to: CGFloat(min(Float(self.progress)/min(Float(self.max),1),1)))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineSize), lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("text"))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text(String(format: "\(progress)/\(max)"))
                .font(.body)
                .foregroundColor(Color("text"))
            
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
//    var percent: Double = 50
//    var thickness: CGFloat = 20
//    var fontSize:CGFloat = 15
//    var gradientColors =  [Color.blue, Color.red]
    @State private var selectedSegmented = 0
    var segmentedValue = ["Milestone", "Skrining"]
    @State private var selectedMonth = 0

//    @State var progressValue: Float = 0.28
//    @State private var selectorIndex = 0
//
//    @State private var numbers = ["Milestone", "Skrining"]
    var months = ["2", "4", "9", "12", "18", "24", "36", "48", "60" ]
//    @State private var selectedMonths = 0
    
//    var names = "Budi"
//
//    @State var pickerSelection = 0
//    @State var barValues : [[CGFloat]] =
//        [
//            [123,110,30,170],
//            [80,140,90,60],
//            [150,70,70,10],
//        ]
//    
    
    @ObservedObject var observableContent = ObservableContent()
    @EnvironmentObject var mUserData: UserData
    var colorBgActive = Color("primary")
    var colorBgNotActive = Color("gray")
    var colorTextActive = Color("text")
    var colorTextNotActive = Color.white
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                //                MARK: pilih segmented
                VStack() {
                    Picker("Numbers", selection: $selectedSegmented) {
                        ForEach(0 ..< segmentedValue.count) { index in
                            Text(self.segmentedValue[index]).tag(index)
                        }
                    }
                    .cornerRadius(5)
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
                   
                    
                   
//                    MARK: pilih tahun
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(){
                            ForEach(0..<months.count){i in
                                Button(action: {
                                    selectedMonth = i
                                    print(selectedMonth)
                                }){
                                    VStack{
                                        Text("\(months[i])")
                                        Text("Bulan")
                                    }.tag(0)
                                    .padding()
                                    .background(selectedMonth == i ? colorBgActive: colorBgNotActive)
                                    .cornerRadius(10)
                                    .foregroundColor(Color("text"))

                                    //                                    .background(Color.gray)
                                    //                                .cornerRadius(10)
                                    //                                .foregroundColor(Color.white)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    //                    MARK: chart main
                    HStack(){
                        Text("Hasil Milestone")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("text"))
                        Spacer()
                    }
                    .padding([.horizontal, .top])
                    
                    ProgressBar(progress: observableContent.numberAllItemCompleted, max: observableContent.numberAllItem, lineSize: 20)
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
                        VStack{
                            ProgressBar(progress: observableContent.numberItemMotorikCompleted, max: observableContent.numberItemMotorik, lineSize: 10)
                                .frame(width: Constants.mSize.width/7, height: Constants.mSize.width/7)
                                .padding()
                            Text("Motorik")
                                .foregroundColor(Color("text"))
                        }
                        VStack{
                            ProgressBar(progress: observableContent.numberItemSosialCompleted, max: observableContent.numberItemSosial, lineSize: 10)
                                .frame(width: Constants.mSize.width/7, height: Constants.mSize.width/7)
                                .padding()
                            Text("Sosial")
                                .foregroundColor(Color("text"))
                        }
                        VStack{
                            ProgressBar(progress: observableContent.numberItemBahasaCompleted, max: observableContent.numberItemBahasa, lineSize: 10)
                                .frame(width: Constants.mSize.width/7, height: Constants.mSize.width/7)
                                .padding()
                            Text("Bahasa")
                                .foregroundColor(Color("text"))
                        }
                        VStack{
                            ProgressBar(progress: observableContent.numberItemKognitifCompleted, max: observableContent.numberItemKognitif, lineSize: 10)
                                .frame(width: Constants.mSize.width/7, height: Constants.mSize.width/7)
                                .padding()
                            Text("Kognitif")
                                .foregroundColor(Color("text"))
                        }
                        .padding(.bottom,10)
                    }
                }
            }
        }
        .background(Color("bg"))
        .navigationBarColor(UIColor(named: "bg"))
        
        .navigationBarTitle(Text("Hasil"), displayMode: .inline)
        .onAppear {
            self.isNavigationBarHidden = false
            observableContent.countAll()
            
            print("summary")
            print(mUserData.myChild)
            
        }
    }
    
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(isNavigationBarHidden: .constant(false))
    }
}
