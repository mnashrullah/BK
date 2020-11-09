//
//  MilestoneView.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct MilestoneView: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    var names = "Axel"
    var ages = "3 Tahun 4 Bulan"
    var mileTracks = MilestoneTrack.getAll
    
    @State var mileCheck: Bool = false
    //
    //    init(){
    //        UIScrollView.appearance().backgroundColor = UIColor(named: "Color4")
    //    }
    var body: some View {
        ScrollView(showsIndicators: false){
            ZStack(alignment: .center){
                Text("Di bawah ini ditampilkan tanda-tanda perkembangan anak ideal berdasarkan periode waktu yang sesuai dengan umur anakmu. Kamu masih dapat terus menilai perkembangan anakmu sampai umur anak mu melewati 4 tahun")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color("Color5"))
                    .cornerRadius(10)
                
                Button(action:{
                    print("test")
                }){
                    VStack{
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("Color5"))
                            .padding(.init(top: -60, leading: 0, bottom: 0, trailing: 100))
                    }
                }
            }
            .padding([.leading, .trailing])
            .multilineTextAlignment(.center)
            
            HStack {
                NavigationLink(destination: HelpView()){
                    Text("Progress Terpenuhi")
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(Color("Color5"))
                }
                .padding()
                .background(Color.white)
                .foregroundColor(Color("Color5"))
                
            }
            .cornerRadius(10)
            .padding([.leading, .trailing])
            //                    .padding([.bottom], 20)
            
            VStack(alignment: .leading){
                ZStack (alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width-36, height: 20)
                        .foregroundColor(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.9383720756, green: 0.8294705153, blue: 0.7069537044, alpha: 1)), lineWidth: 2)
                    )
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width/2, height: 14).foregroundColor(Color("Color3"))
                        .padding(.leading, 4)
                }
                HStack{
                    Text("15")
                        .foregroundColor(Color("Color3"))
                        .font(.headline)
                    Text("Tanda Terpenuhi")
                        .foregroundColor(Color("Color5"))
                        .fontWeight(.semibold)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(){
                    Button(action: {
                        print("semua")
                    }){
                        VStack{
                            Image("category-1")
                                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                                .background(Color("Color3"))
                                .cornerRadius(10)
                                .foregroundColor(Color("Color5"))
                            Text("Semua")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Color5"))
                        }
                        
                        
                    }
                    Button(action:{
                        print("motorik")
                    }){
                        VStack{
                            Image("category-2")
                                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                                .background(Color("motorik").opacity(0.5))
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            Text("Motorik")
                                .foregroundColor(Color("Color5"))
                        }
                    }
                    Button(action:{
                        print("sosial")
                    }){
                        VStack{
                            Image("category-3")
                                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                                .foregroundColor(Color.white)
                                .background(Color("sosial").opacity(0.5))
                                .cornerRadius(10)
                            Text("Sosial")
                                .foregroundColor(Color("Color5"))
                        }
                    }
                    Button(action:{
                        print("bahasa")
                    }){
                        VStack{
                            Image("category-4")
                                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                                .background(Color("gray"))
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            Text("Bahasa")
                                .foregroundColor(Color("Color5"))
                        }
                    }
                    Button(action:{
                        print("kognitif")
                    }){
                        VStack{
                            Image("category-5")
                                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                                .background(Color("gray"))
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            Text("Kognitif")
                                .foregroundColor(Color("Color5"))
                        }
                    }
                }
                .padding()
                .background(Color("Color4"))
            }
            
            
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
                                //                                        mileTrack.isComplete
                                )},
                                   label: {
                                    Image(systemName: mileTrack.isComplete ? "checkmark.square" : "square").foregroundColor(Color("Color5"))
                            })
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }
                .background(Color("Color3"))
                .cornerRadius(10)
            }
            .padding([.trailing,.leading])
        }
        .navigationBarTitle(Text(names).foregroundColor(Color("Color3")), displayMode: .large)
        .navigationBarItems(trailing: Text(ages).foregroundColor(Color("Color5")))
        
        
    }
    
    
}



struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneView(isNavigationBarHidden: .constant(false))
    }
}

