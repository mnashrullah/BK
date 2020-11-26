//
//  AddChildView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 18/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct AddChildView: View {
    
    @Binding var isNavigationBarHidden: Bool
    @State private var name = ""
    @State private var type = "Laki-laki"
    @State private var amount = ""
    static let types = ["Laki-laki", "Perempuan"]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @State private var birthDate: Date = Calendar.current.date(byAdding: DateComponents(year: -1, month: -2), to: Date()) ?? Date()

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var observableChild = ObservableChild()
    var btnSimpan : some View { Button(action: {
        observableChild.addData(name: name, gender: type, birthDate: birthDate)
        self.presentationMode.wrappedValue.dismiss()
    }) {
        Text("Simpan")
    }
    }
    var btnCancel : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        Text("Batalkan")
    }
    }
    
    var body: some View {
        NavigationView {
            
            Form{
                Section{
                    HStack(alignment: .center){
                        Spacer()
                        ZStack{

                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color("gray"))
                            Image(type == "Laki-laki" ? "boy" : "girl")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(25)
                                .shadow(radius: 4)
                                .padding(.top, 20)

                        }.padding()
                        Spacer()

                    }
                    TextField("Nama", text: $name)
                        .foregroundColor(Color("text"))
                    Picker("Jenis Kelamn", selection: $type) {
                        ForEach(Self.types, id: \.self) {
                            Text($0)
                        }
                    }
                    DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                        Text("Tanggal lahir")
                    }
                }
            }
        
            
            .background(Color("bg"))
            .navigationBarTitle(Text("Tambah Data Anak"), displayMode: .inline)
            .navigationBarItems(leading: btnCancel, trailing: btnSimpan.disabled(name == ""))
            .onAppear {
                self.isNavigationBarHidden = false
                print(observableChild.data)
            }
        }
    }
}

struct AddChildView_Previews: PreviewProvider {
    static var previews: some View {
        AddChildView(isNavigationBarHidden: .constant(false))
    }
}
