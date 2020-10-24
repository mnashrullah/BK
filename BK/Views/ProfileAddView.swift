//
//  ProfileAddView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 24/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct ProfileAddView: View {
    @Binding var isNavigationBarHidden: Bool
    @State private var name: String = ""
    @State private var gender: String = ""
    @State private var dob: String = ""
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State private var birthDate = Date()
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading){
                
                Text("Nama")
                mTextField(placeholder: "Masukkan nama", value: $name)
                Text("Jenis Kelamin")
                mTextField(placeholder: "Pilih jenis kelamin", value: $gender)
                Text("Tanggal Lahir")
                mTextField(placeholder: "Pilih tanggal lahir", value: $dob)
                
            }.padding()
            Spacer()
            VStack(alignment: .center){
                Button(action: {
                    print("tapped!")
                }) {
                    HStack {
                        Text("Simpan")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color("primary"))
                    .foregroundColor(.white)
                    .cornerRadius(40)
                }
                Button(action:{}){
                    Text("Batalkan")
                }.padding()
            }.padding()
            
            Text("\(name) \(gender) \(dob)")
            
            
        }
        .navigationBarTitle("Tambah Profil Anak", displayMode: .inline)
            
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
    
    //MARK: FUNCTION
    
    
    
}


struct ProfileAddView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAddView(isNavigationBarHidden: .constant(false))
    }
}

struct mTextField: View{
    var placeholder: String
    @Binding var value: String
    
    var body: some View{
        TextField(self.placeholder, text: self.$value)
            .padding()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
        )
    }
}
