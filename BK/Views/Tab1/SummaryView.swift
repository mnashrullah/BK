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
            Text(String(format: "10/20", min(self.progress, 1.0)*100.0)).font(.body)
            
        }
    }
}
struct SummaryView: View {
    @Binding var isNavigationBarHidden: Bool
    var percent: Double = 50
    var thickness: CGFloat = 20
    var fontSize:CGFloat = 15
    var gradientColors =  [Color.blue, Color.red]
    @State private var selectedSegmented = 0
    var segmentedValue = ["Milestone", "Skrining"]
    @State var progressValue: Float = 0.28
    var body: some View {
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
        }
        .navigationBarTitle(Text("Hasil"))
        .background(Color("Color4"))
        .navigationBarColor(UIColor(named: "Color4"))
        .onAppear {self.isNavigationBarHidden = false}
        
    }
    
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(isNavigationBarHidden: .constant(false))
    }
}
