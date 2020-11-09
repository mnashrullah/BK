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
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            //             Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
            Text(String(format: "10/20", min(self.progress, 1.0)*100.0)).font(.body)
            
        }
    }
}
struct SummaryView: View {
    @Binding var isNavigationBarHidden: Bool
    @Binding var percent: Double
    var thickness: CGFloat = 20
    var fontSize:CGFloat = 15
    var gradientColors =  [Color.blue, Color.red]
    @State private var selectedSegmented = 0
    var segmentedValue = ["Milestone", "Skrining"]
    //    @State var progressValue: Float = 0.0
    //
    //    var body: some View {
    //        ZStack {
    //            Color.yellow
    //                .opacity(0.1)
    //                .edgesIgnoringSafeArea(.all)
    //        }
    //    }
    //
    @State var progressValue: Float = 0.28
    var body: some View {
        ZStack {
            Color.yellow
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack  {
                Picker(selection: $selectedSegmented, label: Text("What is your favorite color?")) {
                    ForEach(0..<segmentedValue.count) { index in
                        Text(self.segmentedValue[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                ProgressBar(progress: self.$progressValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding(40.0)
                HStack(){
                    ForEach(0..<4){_ in
                        VStack{
                            ProgressBar(progress: self.$progressValue)
                                .frame(width: Constants.mSize.width/7, height: Constants.mSize.width/7)
                                .padding()
                            Text("Social")
                            
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 15.0)
                                .stroke(lineWidth: 2.0)
                        )
                    }
                }
                Spacer()
                .navigationBarTitle("Hasil", displayMode: .inline)
                .onAppear {
                                self.isNavigationBarHidden = false
            }
            .padding()
            
            }
            
        }
            
            
        }
        
        //        return drawRing()
        //        VStack{
        //            //                MARK: Segmented control
        //
        //
        //            ScrollView() {
        //                Picker(selection: $selectedSegmented, label: Text("What is your favorite color?")) {
        //                    ForEach(0..<segmentedValue.count) { index in
        //                        Text(self.segmentedValue[index]).tag(index)
        //                    }
        //                }.pickerStyle(SegmentedPickerStyle())
        //                    .padding(.horizontal)
        ////                drawRing()
        //
        //            }
        //        }
        
        
        //        VStack(alignment: .center){
        //            Picker(selection: $selectedSegmented, label: Text("What is your favorite color?")) {
        //                ForEach(0..<segmentedValue.count) { index in
        //                    Text(self.segmentedValue[index]).tag(index)
        //                }
        //            }.pickerStyle(SegmentedPickerStyle())
        //                .padding([.horizontal,.bottom])
        //            drawRing(thick: 20).frame(width: 200, height: 200)
        //            //            Spacer()
        //            Text("Rincian")
        //            HStack(spacing: 25){
        //                ForEach(0..<4){_ in
        //                    self.drawRing(thick: 5).frame(width:50, height: 50).padding(.horizontal)
        //                }
        //                drawRing().frame(width:100, height: 100)
        //                drawRing().frame(width:100, height: 100)
        //                drawRing().frame(width:100, height: 100)
        //                drawRing().frame(width:100, height: 100)
        //            }
        //            Spacer()
        //
        //        }.padding(.horizontal)
        //            .background(Color("bg"))
        //
        //            .navigationBarTitle("Hasil", displayMode: .inline)
        //
        //            .onAppear {
        //                self.isNavigationBarHidden = false
        //        }
//    }
    //    private func nodata() -> some View{
    //        return VStack(){
    //            Image("nodata")
    //            Text("Tidak ada data.").foregroundColor(Color("text"))
    //            Text("Silahkan mengisi ceklis milestone tumbuh kembang anak atau melakukan skrining disleksia.").font(.caption)
    //        }
    //    }
    
    //    private func drawRing(thick: Int) -> some View{
    //        let formattedPercent = String(format: "%.f", CGFloat(self.percent))
    //
    //        return ZStack(alignment: .top) {
    //
    //            RingShape(percent: 100)
    //                .stroke(style: StrokeStyle(lineWidth: CGFloat(thick+5)))
    //                .fill(Color("primary").opacity(0.8))
    //
    //            RingShape(percent: self.percent)
    //                .stroke(style: StrokeStyle(lineWidth: CGFloat(thick), lineCap: CGLineCap.round))
    //                .fill(
    //                    Color("text")
    //            )
    //            Text("18").offset(y: thickness)
    //            //
    //            //            Text("\(formattedPercent)%")
    //            //                .multilineTextAlignment(.trailing)
    //            //                .font(.system(size: fontSize, weight: .black))
    //            //                                .offset(y: -thickness / 4)
    //            //                .shadow(radius: 10)
    //        }
    //    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        
        SummaryView(isNavigationBarHidden: .constant(false), percent: .constant(50))
    }
}
