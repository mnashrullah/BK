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
                
                VStack(alignment: .leading){
                    Text("Hai orang tua \(childSelected?.name ?? "")")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color5"))
                    Text("Berikut pilihan untuk membantu perkembangan anak anda. Untuk menggunakannya silahkan tambah data anak terlebih dahulu").font(.subheadline)
                        .foregroundColor(Color("Color5"))
                }
                
                
                .padding([.horizontal])
                .padding([.bottom], 10)
                
                VStack(alignment:.leading){
                }.padding(.horizontal)
                Spacer()
                
                
                
                VStack{
                    
                    NavigationLink(destination: MilestoneView(isNavigationBarHidden: $isNavigationBarHidden)){
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
                            .padding()
                            .background(Color("Color3"))
                            .cornerRadius(15)
                            
                            .frame(minHeight: 120, maxHeight: 120)
                            
                        }.padding(.horizontal)
                    }
                    NavigationLink(destination: SummaryView(isNavigationBarHidden: $isNavigationBarHidden)){
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
                            .padding()
                            .background(Color("Color3"))
                            .cornerRadius(15)
                            .frame(minHeight: 120, maxHeight: 120)
                        }.padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .navigationBarTitle("Anak", displayMode: .inline)
            .navigationBarHidden(true)
            .padding(.top, 80)
            .background(Color("bg"))
            .edgesIgnoringSafeArea(.top)
            .navigationBarItems(trailing: Image(systemName: "gear"))
            .onAppear(){
                observableChild.loadData()
            }
        }
    }
}

struct PageHomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        PageHomeView()
        
    }
}
