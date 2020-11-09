//
//  PageHomeView.swift
//  mila
//
//  Created by hilmy ghozy on 07/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct PageHomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button(action:{
                        print("Test")
                    }){
                        VStack{
                            Text("Budi")
                                .frame(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100)
                                .background(Color("Color5"))
                                .foregroundColor(Color("Color3"))
                                .cornerRadius(15)
                        }
                    }
                    Button(action:{
                        print("test")
                    }){
                        VStack{
                            Text("Budi")
                                .frame(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100)
                                .background(Color("Color5").opacity(0.2))
                                .foregroundColor(Color("Color5").opacity(0.6))
                                .cornerRadius(15)
                        }
                    }
                    Button(action:{
                        print("test")
                    }){
                        VStack{
                            Image(systemName: "plus")
                                .frame(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100)
                                .background(Color("Color5").opacity(0.2))
                                .foregroundColor(Color("Color5").opacity(0.6))
                                .cornerRadius(15)
                        }
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
                        NavigationLink(destination: MilestoneView()){
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
                    
                    Button(action:{
                        print("test")
                    }){
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
