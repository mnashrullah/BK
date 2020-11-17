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
    
    @State var showingSetting = false
    
    var settingButton: some View {
        Button(action: { self.showingSetting.toggle() }) {
            Image(systemName: "gear")
                .imageScale(.large)
                .accessibility(label: Text("Pengaturan"))
//                .padding()
        }
    }
    
//        init(){
//            UIScrollView.appearance().backgroundColor = UIColor(named: "bg")
//        }
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack{
                    ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        Button(action:{
                            print("Test")
                        }){
                            ZStack{
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
                            .padding(.leading)
                        }
                            ZStack{
                                Rectangle()
                                    .frame(width: 100, height: 140)
                                    .cornerRadius(20)
                                    .foregroundColor(Color("Color3"))
                                    .padding(.top,30)
                                Circle()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(Color("gray"))
                                Image("boy")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(25)
                                    .shadow(radius: 4)
                                    .padding(.top, 20)
                                Text("Budi")
                                    .padding(.top, 120)
                            }
                            ZStack{
                                Circle()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(Color("gray"))
                                Image("girl")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(25)
                                    .shadow(radius: 4)
                                    .padding(.top, 20)
                                Text("Bunga")
                                    .padding(.top, 120)
                            }
                            ZStack{
                                Circle()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(Color("gray"))
                                Image("girl")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(25)
                                    .shadow(radius: 4)
                                    .padding(.top, 20)
                                Text("Bunga")
                                    .padding(.top, 120)
                            }
                            ZStack{
                                Circle()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(Color("gray"))
                                Image("girl")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(25)
                                    .shadow(radius: 4)
                                    .padding(.top, 20)
                                Text("Bunga")
                                    .padding(.top, 120)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("Hai orang tua budi")
                                .font(.title)
                                .fontWeight(.medium)
                        Text("Berikut pilihan untuk membantu perkembangan anak anda.")
                    }
                    .padding()
                    .foregroundColor(Color("Color5"))
                    
                    VStack{
                        HStack{
                            NavigationLink(destination: MilestoneView(isNavigationBarHidden: $isNavigationBarHidden)){
                                VStack{
                                    Image(systemName: "checkmark.square.fill")
                                        .font(.title)
                                        .padding()
                                    Text("Checklist Milestone")
                                        .fontWeight(.semibold)
                                        .padding([.leading, .trailing], 20)
                                }
                                .frame(minWidth: 165, maxWidth: 165, minHeight: 165, maxHeight: 165)
                                .background(Color("Color5"))
                                .foregroundColor(Color("Color3"))
                                .cornerRadius(15)
                            }
                            
                            Spacer()
                            Button(action:{
                                print("test")
                            }){
                                VStack{
                                    Image("home1")
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
                                    Image("home3")
                                        .padding()
                                    Text("Hasil")
                                        .fontWeight(.semibold)
                                        .padding([.leading, .trailing], 20)
                                }
                                 .frame(minWidth: 165, maxWidth: 165, minHeight: 165, maxHeight: 165)
                                .background(Color("Color3"))
                                .foregroundColor(Color("Color5"))
                                .cornerRadius(15)
                                .padding([.top, .leading] ,25)
                                Spacer()
                            
                        }
                        
                    }
                    
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarItems(trailing: settingButton)
            .sheet(isPresented: $showingSetting) {
                SettingView()
                
            }
            .navigationBarColor(UIColor(named: "bg"))
            .background(Color("bg"))
        }
    }
}

struct PageHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PageHomeView()
    }
}
