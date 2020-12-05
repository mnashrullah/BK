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
    @ObservedObject var observableChildMilestone = ObservableChildMilestone()
    var child : datatypeChild
    @State var showingSheet = false
    
    var body: some View {
            ScrollView{
                
                VStack(){
                    
                    VStack{
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
                        }.padding(.top)
                        Text(child.name)
                            .foregroundColor(Color("text"))
                            .fontWeight(.bold)
                            .font(.title)
                            .padding(.top, 10)
                    }
                    
                    VStack{
                        HStack(){
                            VStack(spacing: 10){
                                
                                Text("\(observableChildMilestone.progressValueString)%")
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
                                
                                Text("\(String(calcAgeMonth(birthday: child.birthDate))) Bulan")
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
                    Text("Temukan")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("text"))
                    Spacer()
                }
                .padding([.horizontal])
                .padding([.bottom], 10)
                
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
            .navigationBarTitle(Text("Profil"))
            .navigationBarHidden(isNavigationBarHidden)
            .padding(.top, 80)
            .background(Color("bg"))
            .edgesIgnoringSafeArea(.top)
            .onAppear(){
                self.isNavigationBarHidden = false
                observableChildMilestone.firstLoadData(idChild: child.idChild, month: child.month)
                observableChildMilestone.loadData(idChild: child.idChild, month: child.month)
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
