//
//  PageHomeView.swift
//  mila
//
//  Created by hilmy ghozy on 07/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct PageHomeView: View {
    @Binding var isNavigationBarHidden: Bool
//    var mile: [Mile] = mileData
    @ObservedObject var observableChild = ObservableChild()
    @ObservedObject var observableChildMilestone = ObservableChildMilestone()
    var child : datatypeChild
//    @State var childSelected: datatypeChild?
    //    @EnvironmentObject var userData : UserData
//    @EnvironmentObject var mUserData: UserData
    
    @State var showingSheet = false
//    @State var milestoneValue: Double = 0
//    @State var stringMilestoneValue: String = "0"
//    @State var statusPerkembangan = ""
    
    var body: some View {
            ScrollView{
//                ScrollView(.horizontal, showsIndicators: false){
//                    HStack{
//                        //MARK: tambah data anak
//                        NavigationLink(
//                            destination: AddChildView(isNavigationBarHidden: $isNavigationBarHidden)
//                        ){
//
//                            ZStack{
//                                Rectangle()
//                                    .frame(width: 100, height: 140)
//                                    .cornerRadius(20)
//
//                                    .foregroundColor(.clear)
//                                    .padding(.top,30)
//                                Text("Tambah Anak")
//                                    .frame(minWidth: 80, maxWidth: 80, minHeight: 80, maxHeight: 80)
//                                    .background(Color("gray"))
//                                    .foregroundColor(Color("Color5"))
//                                    .cornerRadius(50)
//                                    .multilineTextAlignment(.center)
//
//                                Image(systemName: "plus.circle.fill")
//                                    .foregroundColor(Color("Color5"))
//                                    .padding([.top,.leading],60)
//                                    .font(.system(size: 20, weight: .bold))
//                            }
//
//                        }
//                        ForEach(observableChild.data){child in
//                            Button(action:{
//                                //                                print(child.name)
////                                childSelected = child
//                                //                                mUserData.myChild = child
//                                //                                print(mUserData.myChild)
//
//                            }){
//                                ZStack{
//                                    Rectangle()
//                                        .frame(width: 100, height: 140)
//                                        .cornerRadius(20)
//                                        .foregroundColor(child.name == childSelected?.name ? Color("Color3"): .clear)
//                                        //                                        .foregroundColor(.clear)
//                                        .padding(.top,30)
//                                    Circle()
//                                        .frame(width: 80, height: 80)
//                                        .foregroundColor(Color("gray"))
//                                    Image(child.gender == "Laki-laki" ? "boy" : "girl")
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: 60, height: 60)
//                                        .cornerRadius(25)
//                                        .shadow(radius: 4)
//                                        .padding(.top, 20)
//                                    Text(child.name)
//                                        .foregroundColor(Color("text"))
//                                        .padding(.top, 120)
//                                }
//                            }.buttonStyle(PlainButtonStyle())
//                        }
//                    }
//
//
//                    Spacer()
//                }
//                .padding(.leading, 25)
//
                VStack(){
                    
                    ZStack{
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
                                .fontWeight(.bold)
                                .font(.title)
                                .padding(.top, 120)
                                
                        }
                    VStack{
                        HStack(){
                            VStack(spacing: 10){
                                
                                Text("\(observableChildMilestone.progressValueString)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("text"))
                                
                                Text("Milestone")
                                    .font(.footnote)
                                    
                                    .foregroundColor(Color("text"))
                            }
                            .frame(minWidth: 0,
                                   maxWidth: .infinity)
                            Divider()
                            VStack(spacing: 10){
                                
                                Text("\(child.age)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    
                                    .foregroundColor(Color("text"))
                                    .multilineTextAlignment(.center)
                                Text("Umur")
                                    .font(.footnote)
                                    .foregroundColor(Color("text"))
                            }
                            .frame(minWidth: 0,
                                   maxWidth: .infinity)
                            
                            Divider()
                            VStack(spacing: 10){
                               
                                Text("\(observableChildMilestone.progressStatus)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("text"))
                                Text("Perkembangan")
                                    .font(.footnote)
                                    .foregroundColor(Color("text"))
                            }
                            .frame(minWidth: 0,
                                   maxWidth: .infinity)
                        }
                        .padding()
                        .background(Color("Color3"))
                        .cornerRadius(10)

                    }
                    .padding()
//                    HStack{
//                        VStack{
//                            Text("90%")
//                            Text("Milestone")
//                        }
//                        Divider()
//                        VStack{
//                            Text("3 Tahun")
//                            Text("Umur")
//                        }
//                        Divider()
//                        VStack{
//                            Text("Baik")
//                            Text("Perkembangan")
//                        }
//                        
//                    }
                    
                    
                }
                
                HStack{
                    Text("Discover")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("text"))
                    Spacer()
                }
                  
                    
                
                .padding([.horizontal])
                .padding([.bottom], 10)
                
//                                VStack(alignment:.leading){
//                                    HStack(alignment:.center){
//                                        VStack{
//                                            Image("menu1")
//                                                .foregroundColor(Color.red)
//                                                .frame(width:20, height: 20)
//                                                .padding([.horizontal,.top],10)
//                                            Spacer()
//
//                                        }
//                                        VStack(alignment:.leading){
//                                            Text("Lacak Tumbuh Kembang Anak")
//                                                .foregroundColor(Color("text"))
//                                                .font(.body)
//                                                .fontWeight(.bold)
//                                            Text("Lacak tumbuh kembang anak adalah serangkaian tahapan untuk melacak masa tumbuh kembang anak yang sangat penting bagi seorang anak")
//                                                .foregroundColor(Color("text"))
//                                                .font(.body)
//                                                .fixedSize(horizontal: false, vertical: true)
//                                        }
//                                    }
//                                    .padding()
//                                    .background(Color("primary"))
//                                    .cornerRadius(15)
                //                    HStack(alignment:.center){
                //                        Image("menu2")
                //                            .foregroundColor(Color.red)
                //                            .frame(width:20, height: 20)
                //                            .padding(.horizontal,10)
                //                        VStack(alignment:.leading){
                //                            Text("Skrining Disleksia")
                //                                .foregroundColor(Color("text"))
                //                                .font(.body)
                //                            Text("Sekarang skrining disleksia dapat mudah dilakukan sendiri.")
                //                                .foregroundColor(Color("text"))
                //                                .font(.caption)
                //
                //
                //                        }
                //                    }.padding(.bottom,12)
                //                    HStack(alignment:.center){
                //                        Image("menu3")
                //                            .foregroundColor(Color.red)
                //                            .frame(width:20, height: 20)
                //                            .padding(.horizontal,10)
                //                        VStack(alignment:.leading){
                //                            Text("Hasil Progres & Skrining")
                //                                .foregroundColor(Color("text"))
                //                                .font(.body)
                //                            Text("Orang tua dapat melihat progres tumbuh kembang anak.")
                //                                .foregroundColor(Color("text"))
                //                                .font(.caption)
                //
                //
                //                        }
                //                    }.padding(.bottom,12)
//
//                                }.padding(.horizontal)
//                                Spacer()
//
                
                
                VStack{
                    
                    NavigationLink(destination: MilestoneView(isNavigationBarHidden: $isNavigationBarHidden, child: child)){
                        VStack(alignment:.leading){
                            HStack(alignment:.center){
                                VStack{
                                    Image("menu1")
                                        
                                       .frame(width:20, height: 20)
                                        .padding([.horizontal,.top],10)
                                    Spacer()
        
                                }
                                VStack(alignment:.leading){
                                    Text("Lacak Tumbuh Kembang Anak")
                                        .foregroundColor(Color("text"))
                                        .font(.body)
                                        .fontWeight(.bold)
                                    Text("Serangkaian tahapan untuk melacak masa tumbuh kembang anak yang ideal")
                                        .foregroundColor(Color("text"))
                                        .font(.body)
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }
                            }
                            .frame(minWidth: 0, maxWidth: Constants.mSize.width,
                                    minHeight: 0,
                                    maxHeight: 150,
                                    alignment: .topLeading
                            )
                            .padding()
                            .background(Color("Color3"))
                            .cornerRadius(15)
        
                        }
                    }
                    
                    .padding([.horizontal])
                    .padding([.bottom], 10)
                    NavigationLink(destination: SummaryView(isNavigationBarHidden: $isNavigationBarHidden, child: child)){
                        VStack(alignment:.leading){
                            HStack(alignment:.center){
                                VStack{
                                    Image("menu3")
                                        
                                       .frame(width:20, height: 20)
                                        .padding([.horizontal,.top],10)
                                    Spacer()
        
                                }
                                VStack(alignment:.leading){
                                    Text("Hasil")
                                        .foregroundColor(Color("text"))
                                        .font(.body)
                                        .fontWeight(.bold)
                                    Text("Hasil menunjukkan progress dari lacak tumbuh kembang anak")
                                        .foregroundColor(Color("text"))
                                        .font(.body)
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }
                            }
                            .frame(minWidth: 0, maxWidth: Constants.mSize.width,
                                    minHeight: 0,
                                    maxHeight: 150,
                                    alignment: .topLeading
                            )
                            .padding()
                            .background(Color("Color3"))
                            .cornerRadius(15)
        
                        }
                    }
                    
                    .padding([.horizontal])
                    .padding([.bottom], 10)
                }
                
                Spacer()
            }
//            .navigationBarTitle(Text(child.name), displayMode: .inline)
            .navigationBarHidden(isNavigationBarHidden)
            .padding(.top, 80)
            .background(Color("bg"))
            .edgesIgnoringSafeArea(.top)
//            .navigationBarHidden(true)
//            .sheet(isPresented: $showingSheet){
//                MilestoneView(isNavigationBarHidden: $isNavigationBarHidden).onDisappear(){
//                    observableChild.loadData()
//                }
//            }
            .onAppear(){
//                observableChild.loadData()
                self.isNavigationBarHidden = false
//                print(child)
//                
//                observableChild.loadData()
                observableChildMilestone.firstLoadData(idChild: child.idChild, month: child.month)
                observableChildMilestone.countAll(idChild: child.idChild, month: child.month)
            }
        
    }
    
}
//
//struct PageHomeView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        PageHomeView(isNavigationBarHidden: .constant(false))
//
//    }
//}
