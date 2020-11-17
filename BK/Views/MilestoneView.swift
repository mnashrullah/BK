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
    
    @State var moreText = true
    
    @State var mileCheck: Bool = false
    //
    //    init(){
    //        UIScrollView.appearance().backgroundColor = UIColor(named: "Color4")
    //    }
    var body: some View {
        
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading) {
                Text("Tentang Milestone Anak")
                    .fontWeight(.bold)
                    .font(Font.system(size:22))
                Text("Di bawah ini ditampilkan tanda-tanda perkembangan anak ideal berdasarkan periode waktu yang sesuai dengan umur anakmu.\nKamu masih dapat terus menilai perkembangan anakmu sampai umur anak mu melewati 4 tahun")
                    .frame(width: UIScreen.screenWidth - 30, alignment: .leading)
                    .lineLimit( moreText ? 3 : nil)
                    .background(Color("bg"))
                    .foregroundColor(Color("Color5"))
                    .cornerRadius(10)
                    .font(.body)
                    .padding(.top, 5)
                HStack{
                    Spacer()
                    Button(action: {self.moreText.toggle()}) {
                        HStack{
                            Text("Lihat Selengkapnya")
                               
                            Image(systemName: "arrowtriangle.down.square.fill")
                        }
                        .font(.caption)
                        .foregroundColor(Color("Color5"))
                    }
                }
            }.padding()
            
                
//            ZStack(alignment: .center){
//                Text("Di bawah ini ditampilkan tanda-tanda perkembangan anak ideal berdasarkan periode waktu yang sesuai dengan umur anakmu. Kamu masih dapat terus menilai perkembangan anakmu sampai umur anak mu melewati 4 tahun")
//                    .padding()
//                    .background(Color("bg"))
//                    .foregroundColor(Color("Color5"))
//                    .cornerRadius(10)
//
//                Button(action:{
//                    print("test")
//                }){
//                    VStack{
//                        Image(systemName: "xmark.circle.fill")
//                            .foregroundColor(Color("Color5"))
//                            .padding(.init(top: -60, leading: 0, bottom: 0, trailing: 100))
//                    }
//                }
//            }
//            .padding([.leading, .trailing])
//            .multilineTextAlignment(.center)

            HStack {
                NavigationLink(destination: HelpView()){
                    Text("Progress Terpenuhi")
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(Color("Color5"))
                }
                .padding()
                .background(Color("Color3"))
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
                                .stroke(Color("Color3-2"), lineWidth: 2)
                    )
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width/2, height: 14).foregroundColor(Color("Color3"))
                        .padding(.leading, 4)
                }
                HStack{
                    Text("15 / 30")
                        .foregroundColor(Color("Color5"))
                        .font(.headline)
                    Text("terpenuhi dalam")
                        .foregroundColor(Color("Color5"))
                        .font(.caption)
                    Text("Semua kateogri")
                        .foregroundColor(Color("Color5"))
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.leading, -5)
                }
            }

            ScrollView(.horizontal, showsIndicators: false){
                HStack(){
                    Button(action: {
                        print("semua")
                    }){
                        VStack{
                            Image("Sort")
                                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                                .background(Color("Color5"))
                                .cornerRadius(10)
                                .foregroundColor(Color("Color3"))
                            Text("Semua")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Color5"))
                        }


                    }
                    Button(action:{
                        print("motorik")
                    }){
                        VStack{
                            Image("Motorik")
                                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                                .background(Color("Color5-2"))
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            Text("Motorik")
                                .foregroundColor(Color("Color5-2"))
                        }
                    }
                    Button(action:{
                        print("sosial")
                    }){
                        VStack{
                            Image("Sosial")
                                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                                .foregroundColor(Color.white)
                                .background(Color("Color5-2"))
                                .cornerRadius(10)
                            Text("Sosial")
                                .foregroundColor(Color("Color5-2"))
                        }
                    }
                    Button(action:{
                        print("bahasa")
                    }){
                        VStack{
                            Image("Bahasa")
                                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                                .foregroundColor(Color.white)
                                .background(Color("Color5-2"))
                                .cornerRadius(10)
                            Text("Bahasa")
                                .foregroundColor(Color("Color5-2"))
                        }
                    }
                    Button(action:{
                        print("kognitif")
                    }){
                        VStack{
                            Image("Kognitif")
                                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                                .foregroundColor(Color.white)
                                .background(Color("Color5-2"))
                                .cornerRadius(10)
                            Text("Kognitif")
                                .foregroundColor(Color("Color5-2"))
                        }
                    }
                }
                .padding()
            }

            ForEach(mileTracks){ mileTrack in
                HStack {
                    VStack(alignment: .leading) {
                        Text(mileTrack.title)
                            .font(.body)
                            .foregroundColor(Color("Color5"))
                            .fixedSize(horizontal: false, vertical: true)
                        HStack {
                            Image(mileTrack.category)
                                .frame(minWidth: 25 , maxWidth: 25, minHeight: 25, maxHeight: 25)
                                .background(Color("Color5-2"))
                                .cornerRadius(50)
                                .foregroundColor(Color("Color3-2"))
                            
                            Text(mileTrack.category.capitalized)
                                .font(.caption)
                                .foregroundColor(Color("Color5"))
                            Spacer()
                            
                            Button(action: {(
                                //mileTrack.isComplete
                                )},
                                   label: {
                                    Image(systemName: mileTrack.isComplete ? "checkmark.square" : "square").foregroundColor(Color("Color5"))
                            })
                        }
                    }
                    .padding()
                    .background(Color("Color3"))
                    .cornerRadius(10)
                }
                .background(Color("Color3"))
                .cornerRadius(10)
            }
            .padding([.trailing,.leading])
        }
        .navigationBarTitle(Text(names).foregroundColor(Color("color1")), displayMode: .large)
        .background(Color("bg"))
        .navigationBarColor(UIColor(named: "bg"))
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneView(isNavigationBarHidden: .constant(false))
    }
}

