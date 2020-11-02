//
//  MilestoneView.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct MilestoneView: View {
    @State var isNavigationBarHidden: Bool = true
    @State private var isAddChild = false
    
    @State private var showingSheet = false
    var buttonsArray: NSMutableArray = NSMutableArray()
    var child = ["Andi" ]
    @State private var selectedMonths = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    
                    // MARK: NAVBAR
                    ZStack(alignment: .topLeading) {
                        HStack(){
                            Spacer()
                            
                            NavigationLink(destination: ProfileAddView(isNavigationBarHidden: $isNavigationBarHidden), isActive: $isAddChild) {
                                
                                Button(action:{
                                    self.showingSheet = true
                                    
                                }){
                                    Image(systemName: "plus")
                                        .frame(width: 24, height: 24)
                                    
                                    Text("Anak")
                                    
                                }
                                .foregroundColor(.white)
                                .padding()
                                
                            }
                            
                            
                            
                            
                            Spacer()
                            
                            Button(action:{}){
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                
                            }
                            .foregroundColor(.white)
                            
                        }
                        .padding([.top,.bottom], 32)
                        .padding(.horizontal)
                        .background(Color("primary"))
                            
                        .clipShape(CornersBottom())
                    }
                    
                    
                    //MARK: MENU
                    VStack(){
                        NavigationLink(destination: ProfileAddView(isNavigationBarHidden: $isNavigationBarHidden)){
                            cardView(
                                image: "menu1",
                                title: "Ceklis Milestone Anak",
                                description: "Milestone adalah serangkaian tahapan atau masa tumbuh kembang yang penting bagi anak")
                        }
                        NavigationLink(destination: ScreeningView(isNavigationBarHidden: $isNavigationBarHidden)){
                            cardView(
                                image: "menu2",
                                title: "Skrining disleksia",
                                description: "Gangguan belajar spesifik biasanya tidak terdeteksi sampai usia sekolah")
                        }
                        NavigationLink(destination: SummaryView(isNavigationBarHidden: $isNavigationBarHidden, percent: .constant(50))){
                            cardView(
                                image: "menu3",
                                title: "Hasil",
                                description: "Hasil menunjukkan progress tumbuh kembang anak dan juga hasil skrining disleksia yang telah dilakukan")
                        }
                        
                    }
                    
                    //MARK: END
                    Spacer()
                    
                }
                    
                    //MARK : NAVIGATION BAR TITLE
                    .navigationBarTitle("")
                    .navigationBarHidden(self.isNavigationBarHidden)
                    .onAppear {
                        self.isNavigationBarHidden = true
                }
                .edgesIgnoringSafeArea(.top)
                .actionSheet(isPresented: $showingSheet) {
                    ActionSheet(title: Text("Pilih Profil Anak"), message: Text("Daftar pilihan profil anak"),
                                buttons: self.buttonsArray as! [ActionSheet.Button])
                }
                    
                .onAppear{
                    self.loadArray()
                }
            }
            
        }
        
    }
    //MARK: END BODY
    
    //MARK: FUNCTION LOAD ARRAY
    
    func loadArray(){
        let buttonAdd: ActionSheet.Button = .default(Text("Tambah Profil Anak"), action: {
            self.isAddChild = true
            self.selectedMonths = 0
        })
        self.buttonsArray[0] =  buttonAdd
        for i in 0..<self.child.count{
            let button: ActionSheet.Button = .default(Text(self.self.child[i]), action: {
                Text("\(self.child[i])")
                self.selectedMonths = i+1
            })
            self.buttonsArray[i+1] =  button
        }
        let buttonCancel: ActionSheet.Button = .cancel()
        self.buttonsArray[child.count+1] =  buttonCancel
        
    }
    
    
}

struct MilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneView()
    }
}

struct cardView: View{
    var image: String
    var title: String
    var description: String
    
    
    var body: some View{
        VStack(alignment: .leading) {
            
            
            
            Image(image).foregroundColor(Color("primary")).padding([.top,.horizontal])
            
            
            
            HStack {
                
                
                VStack(alignment: .leading) {
                    
                    Text(title.uppercased())
                        .font(.subheadline)
                        .fontWeight(.black)
                        .foregroundColor(Color("primary"))
                    
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                    
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
            //        MARK: ICON SEBAGAI BACKGROUND CARD
            //        .background(
            //            Image(image)
            //                .resizable()
            //                .opacity(0.2)
            //                .frame(width: 60, height: 60, alignment: .top)
            //                .scaledToFill()
            //                .offset(x:100, y:25)
            //
            //        )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
        )
            .padding([.top,.horizontal])
        
        
        
        
    }
}


