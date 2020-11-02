//
//  MilestoneView.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct MilestoneView: View {
    
    var names = "Budi"
    var ages = "3 Tahun 4 Bulan"
    var mileTracks = MilestoneTrack.getAll
    
    @State var mileCheck: Bool = false
    
    init(){
        UIScrollView.appearance().backgroundColor = UIColor(named: "Color3")
    }
    var body: some View {
        
        VStack {
            NavigationView{
                 ScrollView(showsIndicators: false){
                    VStack(alignment: .center){
                        Text("Di bawah ini ditampilkan tanda-tanda perkembangan anak ideal berdasarkan periode waktu yang sesuai dengan umur anakmu. Kamu masih dapat terus menilai perkembangan anakmu sampai umur anak mu melewati 4 tahun")
                            .padding()
                            .background(Color("Color4"))
                            .cornerRadius(10)

                    }
                    .padding()
                    .multilineTextAlignment(.center)
                    
                    HStack {
                        NavigationLink(destination: HelpView()){
                            Text("Progress Terpenuhi")
                            Spacer()
                            Image(systemName: "chevron.right").foregroundColor(Color("Color5"))
                        }
                        .padding()
                        .background(Color("Color4"))
                        .foregroundColor(Color("Color5"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(Color("Color5"), lineWidth: 0.5)
                        )
                    }
                    
                    .padding([.top,.bottom], 20)
                    
                
                
                    ForEach(mileTracks){ mileTrack in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(mileTrack.title)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .fixedSize(horizontal: false, vertical: true)
                                HStack {
                                    Image(mileTrack.category)
                                    Text(mileTrack.category.capitalized)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    Spacer()
                                    Button(action: {(
                                        mileTrack.isComplete
                                    )},
                                           label: {
                                            Image(systemName: mileTrack.isComplete ? "checkmark.square" : "square").foregroundColor(Color("Color5"))
                                    })
                                }
                            }
                            .padding()
                            .background(Color("Color4"))
                            .cornerRadius(10)
                        }
                        .background(Color("Color3"))
                        .cornerRadius(10)
                    }
                    .padding([.trailing,.leading])
                }
                .navigationBarTitle(Text(names), displayMode: .large)
                 .navigationBarItems(trailing: Text(ages).foregroundColor(Color("Color5")))
                
            }
        }
        
    }
}


struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneView()
    }
}
