//
//  SummaryView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 24/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    @Binding var isNavigationBarHidden: Bool
    @Binding var percent: Double
    var thickness: CGFloat = 35
    var fontSize:CGFloat = 15
    var gradientColors =  [Color.blue, Color.red]
    
    var body: some View {
//        return drawRing()
        Text("Data belum tersedia")
        .navigationBarTitle("Hasil", displayMode: .inline)
           
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
    
    private func drawRing() -> some View{
        let formattedPercent = String(format: "%.f", CGFloat(self.percent))
        
        return ZStack(alignment: .top) {
            
            RingShape(percent: 100)
                .stroke(style: StrokeStyle(lineWidth: self.thickness - 5))
                .fill(Color.gray.opacity(0.2))
            
            RingShape(percent: self.percent)
                .stroke(style: StrokeStyle(lineWidth: self.thickness, lineCap: CGLineCap.round))
                .fill(
                    LinearGradient(
                        gradient: .init(colors: gradientColors), startPoint: .init(x: 0.2, y: 0.4), endPoint:  .init(x: 0.5, y: 1)
                    )
            )
            
            Text("\(formattedPercent)%")
                .multilineTextAlignment(.trailing)
                .font(.system(size: fontSize, weight: .black))
                .offset(y: -thickness / 4)
                .shadow(radius: 10)
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
       
        SummaryView(isNavigationBarHidden: .constant(false), percent: .constant(50))
    }
}
