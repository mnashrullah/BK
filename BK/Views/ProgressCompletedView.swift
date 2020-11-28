//
//  ProgressCompletedView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 29/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct ProgressCompletedView: View {
    var child: datatypeChild
    @ObservedObject var observableChildMilestone = ObservableChildMilestone()
    @State var showingAlert: Bool = false
    @State var showingAlertSave: Bool = false
    @State var selectionsMilestone: [Int] = []
    
    var body: some View {
        ScrollView{
            if (observableChildMilestone.data.count == 0){
                
                VStack(alignment: .center){
                    
                    Image("Image")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 15)
                        .padding(.top, 100)
                    Text("Data belum ada")
                        .foregroundColor(Color("text"))
                        .fontWeight(.semibold)
                        .padding(.bottom, 10)
                    Text("Silahkan penuhi progress perkembangan")
                        .foregroundColor(Color("text"))
                        .font(.subheadline)
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.center)
                    
                }.frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .center
                )
            }
            else {
                ForEach(observableChildMilestone.data){ mileTrack in
                    Button(action:{
                        print("press \(mileTrack.idMilestone)")
                        
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
            }
            
            
            
        }
        
        .navigationBarItems(leading:
                                HStack {
                                    if(!selectionsMilestone.isEmpty){
                                        Button(action: {
                                            self.showingAlert = true
                                        }) {
                                            Text("Batalkan")
                                        }
                                        .alert(isPresented:$showingAlert) {
                                            Alert(title: Text(""), message: Text("Apakah anda yakin akan membatalkan pilihan data perkembangan anak?"), primaryButton: .destructive(Text("Batalkan")) {
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
                                                Text("Ubah")
                                            }
                                            .alert(isPresented:$showingAlertSave) {
                                                Alert(title: Text(""), message: Text("Apakah anda yakin akan mengubah pilihan data menjadi belum tuntas?"),
                                                      primaryButton: .default(Text("Ubah")) {
                                                        print("hapus...")
                                                        observableChildMilestone.updateBatchNotComplete(idChild: child.idChild, idMilestone: selectionsMilestone, month: child.month)
                                                        loadData()
                                                      },
                                                      secondaryButton: .cancel(Text("Kembali"))
                                                )
                                            }
                                        }
                                    }
        )
        .navigationBarTitle(Text("Progres Terpenuhic"))
        .navigationBarBackButtonHidden(!selectionsMilestone.isEmpty)
        .background(Color("bg"))
        .onAppear(){
            loadData()
        }
    }
    func loadData(){
        selectionsMilestone = []
        observableChildMilestone.loadDataComplete(idChild: child.idChild, month: child.month)
        print(observableChildMilestone.data)
        
    }
}
//
//struct ProgressCompletedView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressCompletedView(child: <#datatypeChild#>)
//    }
//}
