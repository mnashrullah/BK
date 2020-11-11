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
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
//                    MARK: example button anak
//                    Button(action:{
//                        print("Test")
//                    }){
//                        VStack{
//                            Text("Budi")
//                                .frame(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100)
//                                .background(Color("Color5"))
//                                .foregroundColor(Color("Color3"))
//                                .cornerRadius(50)
//                        }
//                    }
                    
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
                .padding(.leading)
                
                VStack(alignment: .leading){
                    Text("Hai orang tua budi")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color5"))
                    Text("Berikut pilihan untuk membantu perkembangan anak anda.")
                }.padding()
                
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
                
                Spacer()
            }
            .padding(.top, 100)
            .background(Color("Color4"))
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct PageHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PageHomeView()
    }
}
