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
    var child: datatypeChild
    var mCategory = ["Semua","Motorik","Sosial","Bahasa","Kognitif"]
    @State var categorySelected = 0
    @State var mileCheck: Bool = false
    @State var showingAlert: Bool = false
    @State var showingAlertSave: Bool = false
    @State var showingResult: Bool = false
    @State var limitedText = true
    @ObservedObject var observableChildMilestone = ObservableChildMilestone()
    var mWidth: Int = Int(UIScreen.main.bounds.width)
    @EnvironmentObject var mUserData: UserData
    @State var selectionsMilestone: [Int] = []
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false){
                
                //          MARK: Text Introduction
                VStack(alignment:.leading){
                    Text("Tentang Milestone Anak")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                        .padding([.top, .horizontal])
                        .foregroundColor(Color("text"))
                    
                    Text("Di bawah ini ditampilkan tanda-tanda perkembangan anak ideal berdasarkan periode waktu yang sesuai dengan umur anakmu. Kamu masih dapat terus menilai perkembangan anakmu sampai umur anak mu melewati 4 tahun")
                        .lineLimit(self.limitedText == true ? 1: nil)
                        .fixedSize(horizontal: false, vertical: self.limitedText == true ? false:true)
                        .font(.subheadline)
                        .foregroundColor(Color("text"))
                        .padding(.horizontal)
                    HStack(){
                        Spacer()
                        HStack(alignment: .center){
                            Text(self.limitedText == true ? "Tampil selengkapnya" : "Tampil lebih singkat")
                                .font(.subheadline)
                                .foregroundColor(Color("text"))
                            if(!limitedText){
                                Image(systemName:  "arrowtriangle.up.square.fill").frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(Color.white)
                                    .foregroundColor(Color("text"))
                            }else{
                                Image(systemName:  "arrowtriangle.down.square.fill").frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(Color.white)
                                    .foregroundColor(Color("text"))
                                
                            }
                            
                        }.padding([.horizontal,.bottom])
                        .padding(.top, 10)
                        
                    }
                    
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 20)
                .padding([.leading, .trailing])
                .onTapGesture(count: 1, perform: {
                    self.limitedText.toggle()
                })
                //          MARK: PROGRESS
                HStack {
                    NavigationLink(destination: ProgressCompletedView(child: child)){
                        Text("Progress Terpenuhi").foregroundColor(Color("text"))
                        Spacer()
                        Image(systemName: "chevron.right").foregroundColor(Color("Color5"))
                    }
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color("Color5"))
                    
                }
                .cornerRadius(10)
                .padding([.leading, .trailing])
                //                    .padding([.bottom], 20)
                
                VStack(alignment: .leading){
                    ZStack (alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: CGFloat(Double(mWidth)*0.95), height: 20)
                            .foregroundColor(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(#colorLiteral(red: 0.9383720756, green: 0.8294705153, blue: 0.7069537044, alpha: 1)), lineWidth: 2)
                            )
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: CGFloat(Double(observableChildMilestone.progressValue) * Double(mWidth)/100 * 0.93)
                                   
                                   , height: 14).foregroundColor(Color("Color3"))
                            .padding(.leading, 4)
                    }
                    HStack{
                        Text("\(String(observableChildMilestone.numberAllItemCompleted)) dari \(String(observableChildMilestone.numberAllItem)) tanda terpenuhi")
                            .foregroundColor(Color("text"))
                            .font(.headline)
                        
                    }
                }
                
                HStack(){
                    ForEach(0..<mCategory.count){i in
                        Button(action:{
                            categorySelected = i
                            print(categorySelected)
                        }){
                            CategoryButton(categorySelected : categorySelected, category: i, text: mCategory[i], image: "category-\(i+1)")
                        }
                        
                    }
                }.padding(.bottom, 10)
                //            .onAppear(){
                //                print(observableContent.data)
                //            }
                //            self.mile =  miles.filter { $0.month == month }
                
                //            MARK: COBA
                if (self.mCategory[self.categorySelected] == self.mCategory[0] ){
                    ForEach(observableChildMilestone.data){ mileTrack in
                        Button(action:{
                            if(selectionsMilestone.contains(mileTrack.idMilestone)){
                                //remove milestone id from list
                                self.selectionsMilestone.removeAll(where: { $0 == mileTrack.idMilestone })
                            }else{
                                //add milestone to list
                                selectionsMilestone.append(mileTrack.idMilestone)
                            }
                            print(selectionsMilestone)
                        }){
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(mileTrack.name)
                                        .font(.body)
                                        .foregroundColor(Color("text"))
                                        .fixedSize(horizontal: false, vertical: true)
                                    HStack {
                                        Image(mileTrack.category)
                                        Text(mileTrack.category)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        Spacer()
                                        Image(systemName: selectionsMilestone.contains(mileTrack.idMilestone) ? "checkmark.square" : "square").foregroundColor(Color("Color5"))
                                    }
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                            }
                            .background(Color("Color3"))
                            .cornerRadius(10)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    .padding([.trailing,.leading])
                } else{
                    ForEach(observableChildMilestone.data){ mileTrack in
                        if (mileTrack.category == self.mCategory[self.categorySelected]){
                            
                            Button(action:{
                                if(selectionsMilestone.contains(mileTrack.idMilestone)){
                                    //remove milestone id from list
                                    self.selectionsMilestone.removeAll(where: { $0 == mileTrack.idMilestone })
                                }else{
                                    //add milestone to list
                                    selectionsMilestone.append(mileTrack.idMilestone)
                                }
                                print(selectionsMilestone)
                            }){
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(mileTrack.name)
                                            .font(.body)
                                            .foregroundColor(Color("text"))
                                            .fixedSize(horizontal: false, vertical: true)
                                        HStack {
                                            Image(mileTrack.category)
                                            Text(mileTrack.category)
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                            Spacer()
                                            Image(systemName: selectionsMilestone.contains(mileTrack.idMilestone) ? "checkmark.square" : "square").foregroundColor(Color("Color5"))
                                        }
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                }
                                .background(Color("Color3"))
                                .cornerRadius(10)
                            }.buttonStyle(PlainButtonStyle())
                            
                            
                        }
                        
                    }
                    .padding([.trailing,.leading])
                    Spacer()
                }
            }
            if (showingResult){
                if (observableChildMilestone.progressStatus == "Biasa"){
                    ZStack{
                    Color("bg").opacity(0.4)
                        .edgesIgnoringSafeArea(.vertical)
                    VStack(alignment: .center) {
                        Text("Perkembangan \(child.name) \(observableChildMilestone.progressStatus)")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("text"))
                            .font(.title)
                            .fixedSize(horizontal: false, vertical: true)
                            
                            .multilineTextAlignment(.center)
                        Text("Sampai saat ini, \(child.name) mengalami keterlambatan perkembangan dibandingkan anak pada umumnya. Namun tenang, pada akhirnya \(child.name) akan mengejar keterlambatan tersebut.")
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.subheadline)
                            .foregroundColor(Color("text"))
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        Image("dokter")
                            .resizable()
                            .padding([.top, .bottom], 15)
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Anda masih dapat memantau perkembangan \(child.name). Apabila anda khawatir, kami menyarankan untuk berkonsultasi dengan spesialis anak ")
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical:true)
                            .font(.subheadline)
                            .foregroundColor(Color("text"))
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        
                        
                        NavigationLink(destination: SummaryView(isNavigationBarHidden: $isNavigationBarHidden, child: child)){
                            VStack(alignment:.leading){
                                HStack{
                                    Text("Lihat Hasil").foregroundColor(Color("text"))
                                    Spacer()
                                    Image(systemName: "chevron.right").foregroundColor(Color("Color5"))
                                }
                                
                                .padding()
                                .background(Color("Color3"))
                                .cornerRadius(15)
                                
                            }.padding()
                        }
                        
                    }
                    .padding()
                    
                    
                    .frame(width: 300)
                    .background(Color("bg"))
                    .cornerRadius(20).shadow(radius: 20)
                }
                }
                else if (observableChildMilestone.progressStatus == "Ideal"){
                    ZStack{
                    Color("bg").opacity(0.4)
                        .edgesIgnoringSafeArea(.vertical)
                    VStack(alignment: .center) {
                        Text("Perkembangan \(child.name) sudah \(observableChildMilestone.progressStatus)")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("text"))
                            .font(.title)
                            .fixedSize(horizontal: false, vertical: true)
                            
                            .multilineTextAlignment(.center)
                        Text("Sampai saat ini, perkembangan \(child.name) sudah mengikuti perkembangan anak ideal pada umumnya.")
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.subheadline)
                            .foregroundColor(Color("text"))
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        Image("ideal")
                            .resizable()
                            .padding([.top, .bottom], 15)
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Anda masih dapat memantau perkembangan \(child.name).")
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical:true)
                            .font(.subheadline)
                            .foregroundColor(Color("text"))
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        
                        
                        NavigationLink(destination: SummaryView(isNavigationBarHidden: $isNavigationBarHidden, child: child)){
                            VStack(alignment:.leading){
                                HStack{
                                    Text("Lihat Hasil").foregroundColor(Color("text"))
                                    Spacer()
                                    Image(systemName: "chevron.right").foregroundColor(Color("Color5"))
                                }
                                
                                .padding()
                                .background(Color("Color3"))
                                .cornerRadius(15)
                                
                            }.padding()
                        }
                        
                    }
                    .padding()
                    
                    
                    .frame(width: 300)
                    .background(Color("bg"))
                    .cornerRadius(20).shadow(radius: 20)
                }
                }
                
                
            }
        }
        
//        .navigationBarTitle(Text(child.name), displayMode: .inline)
        .navigationBarTitle(Text(child.name), displayMode: .inline)
        .navigationBarItems(leading:
                                HStack {
                                    if(!selectionsMilestone.isEmpty){
                                        Button(action: {
                                            self.showingAlert = true
                                        }) {
                                            Text("Batalkan")
                                        }
                                        .alert(isPresented:$showingAlert) {
                                            Alert(title: Text(""), message: Text("Apakah anda yakin akan menghapus ceklist perkembangan anak?"), primaryButton: .destructive(Text("Batalkan")) {
                                                print("Deleting...")
                                                selectionsMilestone.removeAll()
                                            }, secondaryButton: .cancel(Text("Kembali")))
                                        }
                                    }
                                    
                                }, trailing:
                                    HStack {
                                        if(!selectionsMilestone.isEmpty){
                                            Button(action: {
                                                self.showingAlertSave = true
                                            }) {
                                                Text("Simpan")
                                            }
                                            .alert(isPresented:$showingAlertSave) {
                                                Alert(title: Text(""), message: Text("Apakah anda yakin akan menyimpan milestone perkembangan anak?"),
                                                      primaryButton: .default(Text("Simpan")) {
                                                        print("Simpan...")
                                                        observableChildMilestone.updateBatchComplete(idChild: child.idChild, idMilestone: selectionsMilestone, month: child.month)
                                                        loadData()
                                                        self.showingResult = true
                                                      },
                                                      secondaryButton: .cancel(Text("Kembali"))
                                                )
                                            }
                                        }
                                    }
        )
        
        .navigationBarBackButtonHidden(!selectionsMilestone.isEmpty)
        
        .background(Color("bg"))
        .onAppear(){
            loadData()
        }
    }
    func loadData(){
        showingResult = false
        selectionsMilestone = []
        observableChildMilestone.loadDataNotComplete(idChild: child.idChild, month: child.month)
        
    }
}



struct CategoryButton: View{
    var colorBgActive = Color("primary")
    var colorBgNotActive = Color("gray")
    var colorTextActive = Color("text")
    var colorTextNotActive = Color.white
    var categorySelected: Int
    var category: Int
    var text: String
    var image: String
    
    
    var body: some View{
        VStack{
            Image(image)
                .frame(minWidth: 65 , maxWidth: 65, minHeight: 65, maxHeight: 65)
                .background(categorySelected==category ? colorBgActive: colorBgNotActive)
                .cornerRadius(10)
                .foregroundColor(categorySelected==category ? colorTextActive: colorTextNotActive)
            Text(text)
                .foregroundColor(Color("text"))
        }
    }
}
