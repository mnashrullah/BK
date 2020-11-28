//
//  ChildView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 26/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct ChildView: View {
    @ObservedObject var observableChild = ObservableChild()
//    @ObservedObject var observableChildMilestone = ObservableChildMilestone()
    @State var childSelected: datatypeChild?
    @State var showingSheet = false
    @State var isNavigationBarHidden: Bool = true
    @State private var showingAlert = false
    var btnAdd : some View {
        Button(action: {
            showingSheet    .toggle()
        }){
            Image(systemName: "plus")
        }.padding()
    }
    @State var name: String = ""
    
    var body: some View {
        
        NavigationView{
            List{
        
                //later try alert before delete
                //                    Button(action: {
                //                                self.showingAlert = true
                //                            }) {
                //                                Text("Show Alert")
                //                            }
                //                            .alert(isPresented: $showingAlert) {
                //                                Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
                //                            }
                if (observableChild.data.count == 0){
                    VStack(alignment: .center){
                        
                        Image("Image")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding(.bottom, 15)
                            .padding(.top, 100)
                        Text("Opps data belum ada")
                            .foregroundColor(Color("text"))
                            .fontWeight(.semibold)
                            .padding(.bottom, 10)
                        Text("Silahkan menambahkan data anak terlebih dahulu")
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
                    .listRowBackground(Color("bg"))
                } else {
                    ForEach(observableChild.data){child in
                        NavigationLink(
                            destination: PageHomeView(isNavigationBarHidden: $isNavigationBarHidden, child: child)
                        )
                        {
                            HStack{
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
                                }
                                .padding(.horizontal)
                                
                                VStack(alignment: .leading){
                                    Text(child.name)
                                        .foregroundColor(Color("text"))
                                    Text("Umur \(child.age)")
                                        .font(.caption)
                                        .foregroundColor(Color("text"))
                                }
                                Spacer()
                                
                            }
                            
                        }
                    }
                    .onDelete { (indexset) in
                        self.observableChild.deleteData(indexset: indexset, id: self.observableChild.data[indexset.first!].id)
                    }
                    .listRowBackground(Color("bg"))
                }
            }
            .background(Color("bg"))
            .navigationBarTitle(Text("Anak"), displayMode: .inline)
            .navigationBarItems(trailing: btnAdd)
            .sheet(isPresented: $showingSheet){
                AddChildView(isNavigationBarHidden: $isNavigationBarHidden).onDisappear(){
                    observableChild.loadData()
                }
            }
            .onAppear(){
                observableChild.loadData()
//                print(observableChildMilestone.data)

            }
        }
    }
    func calcAge(birthday: Date) -> String {
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components([.year, .month, .day], from: birthday, to: now, options: [])
        let age: Int = calcAge.year ?? 0
        let month: Int = calcAge.month ?? 0
        let day: Int = calcAge.day ?? 0
        var result : String = ""
        if (age > 0){
            result = "Umur \(age) tahun \(month) bulan"
        } else if (age == 0 && month > 0){
            result = "Umur \(month) bulan \(day) hari"
        } else if (age == 0 && month == 0 && day > 0){
            result = "Umur \(day) hari"
        } else if (age == 0 && month == 0 && day == 0){
            result = "Umur \(day+1) hari"
        } else {
            result = ""
        }
        return result
    }
    
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView()
    }
}
