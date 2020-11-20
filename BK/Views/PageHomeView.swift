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
    @ObservedObject var observableChild = ObservableChild()
    @State var childSelected: datatypeChild?
//    @EnvironmentObject var userData : UserData
//    @EnvironmentObject var mUserData: UserData
    
    var body: some View {
        NavigationView{
            ScrollView{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        //MARK: tambah data anak
                        NavigationLink(
                            destination: AddChildView(isNavigationBarHidden: $isNavigationBarHidden)
                        ){
                            
                                ZStack{
                                    Rectangle()
                                        .frame(width: 100, height: 140)
                                        .cornerRadius(20)
                                      
                                        .foregroundColor(.clear)
                                        .padding(.top,30)
                                    Text("Tambah Anak")
                                        .frame(minWidth: 80, maxWidth: 80, minHeight: 80, maxHeight: 80)
                                        .background(Color("gray"))
                                        .foregroundColor(Color("Color5"))
                                        .cornerRadius(50)
                                        .multilineTextAlignment(.center)
                                    
                                    Image(systemName: "plus.circle.fill")
                                    .foregroundColor(Color("Color5"))
                                    .padding([.top,.leading],60)
                                    .font(.system(size: 20, weight: .bold))
                                }
                            
                        }
                        ForEach(observableChild.data){child in
                            Button(action:{
//                                print(child.name)
                                childSelected = child
//                                mUserData.myChild = child
//                                print(mUserData.myChild)
                                
                            }){
                                ZStack{
                                    Rectangle()
                                        .frame(width: 100, height: 140)
                                        .cornerRadius(20)
                                        .foregroundColor(child.name == childSelected?.name ? Color("Color3"): .clear)
//                                        .foregroundColor(.clear)
                                        .padding(.top,30)
                                    Circle()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(Color("gray"))
                                    Image(child.gender == "Laki-laki" ? "boy" : "girl")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(25)
                                        .shadow(radius: 4)
                                        .padding(.top, 20)
                                    Text(child.name)
                                        .foregroundColor(Color("text"))
                                        .padding(.top, 120)
                                }
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                    
                    Spacer()
                }
                .padding(.leading, 25)
                
                HStack {
                    VStack(alignment: .leading){
                        Text("Hai orang tua \(childSelected?.name ?? "")")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color5"))
                        Text("Berikut pilihan untuk membantu perkembangan anak anda.").font(.subheadline)
                            .foregroundColor(Color("Color5"))
                    }
                    Spacer()
                }
                .padding([.horizontal], 25)
                .padding([.bottom], 10)
                //
                //                VStack(alignment:.leading){
                //                    HStack(alignment:.center){
                //                        VStack{
                //                            Image("menu1")
                //                                .foregroun dColor(Color.red)
                //                               .frame(width:20, height: 20)
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
                //                Spacer()
                
                
                
                VStack{
                    HStack{
                        NavigationLink(destination: MilestoneView(isNavigationBarHidden: $isNavigationBarHidden)){
                            VStack{
                                Image("menu1")
                                    .padding()
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
                        NavigationLink(destination: ScreeningView(isNavigationBarHidden: $isNavigationBarHidden)){
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
                        
//                        Button(action:{
//                            print("test")
//                        }){
//                            VStack{
//                                Image("menu2")
//                                    .padding()
//                                Text("Skrining Disleksia")
//                                    .fontWeight(.semibold)
//                                    .padding([.leading, .trailing], 20)
//                            }
//                            .frame(minWidth: 165, maxWidth: 165, minHeight: 165, maxHeight: 165)
//                            .background(Color("Color3"))
//                            .foregroundColor(Color("Color5"))
//                            .cornerRadius(15)
//                        }
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
            .navigationBarTitle("Anak", displayMode: .inline)
            .navigationBarHidden(true)
            .padding(.top, 80)
//            .background(Color("Color4"))
            
            .background(Color("bg"))
            .edgesIgnoringSafeArea(.top)
            .navigationBarItems(trailing: Image(systemName: "gear"))
//            .navigationBarHidden(isNavigationBarHidden)
            .onAppear(){
                loadData()
                observableChild.loadData()
//                print(mUserData.myChild)
//                if (childSelected == nil){
//                    childSelected = observableChild.data[0]
//                }
//                self.isNavigationBarHidden = true
            }
        }
    }
    func loadData(){
//        print(mile)
        
    }
}
//
//struct PageHomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//            PageHomeView()
//        
//    }
//}
