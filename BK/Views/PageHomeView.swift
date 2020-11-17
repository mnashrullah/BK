//
//  PageHomeView.swift
//  mila
//
//  Created by hilmy ghozy on 07/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct PageHomeView: View {
    @State var isNavigationBarHidden: Bool = true
    var mile: [Mile] = mileData
    
    var body: some View {
        NavigationView{
            ScrollView{
                HStack(){
                    Spacer()
                    Image(systemName: "gear")
                    
                }.padding(.horizontal)
                HStack{
                    //MARK: tambah data anak
                    VStack(){
                        Image("boy")
                            .resizable().frame(width:50, height: 50)
                            .scaledToFit()
                            .padding(15)
                            .background(Color("Color5")
                                            .opacity(0.2))
                            .cornerRadius(50)
                        Text("Budi").foregroundColor(Color("Color5"))
                    }
                    VStack(){
                        VStack{
                            Image(systemName: "plus").foregroundColor(Color("Color5").opacity(0.6))
                        }
                        .frame(width:50, height: 50)
                        .padding(15)
                        .background(Color("Color5").opacity(0.2))
                        .cornerRadius(50)
                        
                        Text("Data Anak").foregroundColor(Color("Color5"))
                    }
                    Spacer()
                }
                .padding(.leading, 25)
                
                HStack {
                    VStack(alignment: .leading){
                        Text("Hai orang tua budi")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color5"))
                        Text("Berikut pilihan untuk membantu perkembangan anak anda.").font(.subheadline)
                            .foregroundColor(Color("Color5"))
                    }
                    Spacer()
                }
                .padding([.horizontal], 25)
                .padding([.top, .bottom], 10)
//
//                VStack(alignment:.leading){
//                    HStack(alignment:.center){
//                        VStack{
//                            Image("menu1")
//                                .foregroundColor(Color.red)
//                                .frame(width:20, height: 20)
//                                .padding([.horizontal,.top],10)
//                            Spacer()
//
//                        }
//                        VStack(alignment:.leading){
//                            Text("Lacak Tumbuh Kembang Anak")
//                                .foregroundColor(Color("text"))
//                                .font(.body)
//                                .fontWeight(.bold)
//                            Text("Lacak tumbuh kembang anak adalah serangkaian tahapan untuk melacak masa tumbuh kembang anak yang sangat penting bagi seorang anak")
//                                .foregroundColor(Color("text"))
//                                .font(.body)
//                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
//                        }
//                    }
//                    .padding()
//                    .background(Color("primary"))
//                    .cornerRadius(15)
////                    HStack(alignment:.center){
////                        Image("menu2")
////                            .foregroundColor(Color.red)
////                            .frame(width:20, height: 20)
////                            .padding(.horizontal,10)
////                        VStack(alignment:.leading){
////                            Text("Skrining Disleksia")
////                                .foregroundColor(Color("text"))
////                                .font(.body)
////                            Text("Sekarang skrining disleksia dapat mudah dilakukan sendiri.")
////                                .foregroundColor(Color("text"))
////                                .font(.caption)
////
////
////                        }
////                    }.padding(.bottom,12)
////                    HStack(alignment:.center){
////                        Image("menu3")
////                            .foregroundColor(Color.red)
////                            .frame(width:20, height: 20)
////                            .padding(.horizontal,10)
////                        VStack(alignment:.leading){
////                            Text("Hasil Progres & Skrining")
////                                .foregroundColor(Color("text"))
////                                .font(.body)
////                            Text("Orang tua dapat melihat progres tumbuh kembang anak.")
////                                .foregroundColor(Color("text"))
////                                .font(.caption)
////
////
////                        }
////                    }.padding(.bottom,12)
//
//                }.padding(.horizontal)
//                VStack(alignment:.leading){
//                    HStack(alignment:.center){
//                        VStack{
//                            Image("menu1")
//                                .foregroundColor(Color.red)
//                                .frame(width:20, height: 20)
//                                .padding([.horizontal,.top],10)
//                            Spacer()
//
//                        }
//                        VStack(alignment:.leading){
//                            Text("Lacak Tumbuh Kembang Anak")
//                                .foregroundColor(Color("text"))
//                                .font(.body)
//                                .fontWeight(.bold)
//                            Text("Lacak tumbuh kembang anak adalah serangkaian tahapan untuk melacak masa tumbuh kembang anak yang sangat penting bagi seorang anak")
//                                .foregroundColor(Color("text"))
//                                .font(.body)
//                                .fixedSize(horizontal: false, vertical: true)
//                        }
//                    }
//                    .padding()
//                    .background(Color("primary"))
//                    .cornerRadius(15)
////                    HStack(alignment:.center){
////                        Image("menu2")
////                            .foregroundColor(Color.red)
////                            .frame(width:20, height: 20)
////                            .padding(.horizontal,10)
////                        VStack(alignment:.leading){
////                            Text("Skrining Disleksia")
////                                .foregroundColor(Color("text"))
////                                .font(.body)
////                            Text("Sekarang skrining disleksia dapat mudah dilakukan sendiri.")
////                                .foregroundColor(Color("text"))
////                                .font(.caption)
////
////
////                        }
////                    }.padding(.bottom,12)
////                    HStack(alignment:.center){
////                        Image("menu3")
////                            .foregroundColor(Color.red)
////                            .frame(width:20, height: 20)
////                            .padding(.horizontal,10)
////                        VStack(alignment:.leading){
////                            Text("Hasil Progres & Skrining")
////                                .foregroundColor(Color("text"))
////                                .font(.body)
////                            Text("Orang tua dapat melihat progres tumbuh kembang anak.")
////                                .foregroundColor(Color("text"))
////                                .font(.caption)
////
////
////                        }
////                    }.padding(.bottom,12)
//
//                }.padding(.horizontal)
//                VStack(alignment:.leading){
//                    HStack(alignment:.center){
//                        VStack{
//                            Image("menu1")
//                                .foregroundColor(Color.red)
//                                .frame(width:20, height: 20)
//                                .padding([.horizontal,.top],10)
//                            Spacer()
//
//                        }
//                        VStack(alignment:.leading){
//                            Text("Lacak Tumbuh Kembang Anak")
//                                .foregroundColor(Color("text"))
//                                .font(.body)
//                                .fontWeight(.bold)
//                            Text("Lacak tumbuh kembang anak adalah serangkaian tahapan untuk melacak masa tumbuh kembang anak yang sangat penting bagi seorang anak")
//                                .foregroundColor(Color("text"))
//                                .font(.body)
//                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
//                        }
//                    }
//                    .padding()
//                    .background(Color("primary"))
//                    .cornerRadius(15)
////                    HStack(alignment:.center){
////                        Image("menu2")
////                            .foregroundColor(Color.red)
////                            .frame(width:20, height: 20)
////                            .padding(.horizontal,10)
////                        VStack(alignment:.leading){
////                            Text("Skrining Disleksia")
////                                .foregroundColor(Color("text"))
////                                .font(.body)
////                            Text("Sekarang skrining disleksia dapat mudah dilakukan sendiri.")
////                                .foregroundColor(Color("text"))
////                                .font(.caption)
////
////
////                        }
////                    }.padding(.bottom,12)
////                    HStack(alignment:.center){
////                        Image("menu3")
////                            .foregroundColor(Color.red)
////                            .frame(width:20, height: 20)
////                            .padding(.horizontal,10)
////                        VStack(alignment:.leading){
////                            Text("Hasil Progres & Skrining")
////                                .foregroundColor(Color("text"))
////                                .font(.body)
////                            Text("Orang tua dapat melihat progres tumbuh kembang anak.")
////                                .foregroundColor(Color("text"))
////                                .font(.caption)
////
////
////                        }
////                    }.padding(.bottom,12)
//
//                }.padding(.horizontal)
//                Spacer()
                
                
                
                VStack{
                    HStack{
                        NavigationLink(destination: MilestoneView(isNavigationBarHidden: $isNavigationBarHidden)){
                            VStack{
                                Image("menu1")
                                    .font(.title)
                                    .padding().foregroundColor(.red)
                                Text("Checklist Milestone")
                                    .fontWeight(.semibold)
                                    .padding([.leading, .trailing], 20)
                            }
                            .frame(minWidth: 165, maxWidth: 165, minHeight: 165, maxHeight: 165)
                            .background(Color("Color3"))
                            .foregroundColor(Color("Color5"))
                            .cornerRadius(15)
                        }

                        Spacer()
                        Button(action:{
                            print("test")
                        }){
                            VStack{
                                Image("menu2")
                                    .padding()
                                Text("Skrining Disleksia")
                                    .fontWeight(.semibold)
                                    .padding([.leading, .trailing], 20)
                            }
                            .frame(minWidth: 165, maxWidth: 165, minHeight: 165, maxHeight: 165)
                            .background(Color("Color3"))
                            .foregroundColor(Color("Color5"))
                            .cornerRadius(15)
                        }
                    }
                    .padding([.trailing, .leading], 25)


                    NavigationLink(destination: SummaryView(isNavigationBarHidden: $isNavigationBarHidden)){

                        VStack{
                            Image("menu3")
                                .padding()
                            Text("Hasil")
                                .fontWeight(.semibold)
                                .padding([.leading, .trailing], 20)
                        }
                        .frame(minWidth: 165, maxWidth: 165, minHeight: 165, maxHeight: 165)
                        .background(Color("Color3"))
                        .foregroundColor(Color("Color5"))
                        .cornerRadius(15)
                        .padding([.horizontal] ,25)
                        Spacer()

                    }

                }
                
                Spacer()
            }
            .padding(.top, 80)
            .background(Color("Color4"))
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
            .onAppear(){
                loadData()
            }
        }
    }
    func loadData(){
//        print(mile)
        
    }
}

struct PageHomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PageHomeView()
            PageHomeView()
        }
    }
}
