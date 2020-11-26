//
//  HelpView.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct HelpView: View {
    var months = ["2 Bulan", "4 Bulan", "9 Bulan", "12 Bulan", "18 Bulan", "24 Bulan", "36 Bulan", "48 Bulan", "60 Bulan" ]
    @State private var selectedMonths = 0
    @State var width = UIScreen.main.bounds.width
    @State var quickview = true
    @State private var showingSheet = false
    var buttonsArray: NSMutableArray = NSMutableArray()
    var milestone : [Milestone]
    var tips : [Tips]
    init() {
        milestone = Milestone.getAll
        tips = Tips.getAll
    }
     
    var body: some View {
        NavigationView{
            VStack(){
                Image("child")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .cornerRadius(25)
                    .shadow(radius: 4)
                    .padding(.top, 25)
                
                HStack{
                    Button(action:{
                        self.quickview = true
                    }){
                        VStack{
                            Text("Quick View")
                        }
                        .padding()
                        .background(self.quickview ? Constants.mColor.gradient : Constants.mColor.gray4)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                        .foregroundColor(Color.white)
                    }
                    Button(action:{
                        self.quickview = false
                    }){
                        VStack{
                            Text("Tips")
                        }
                        .padding()
                        .background(!self.quickview ? Constants.mColor.gradient : Constants.mColor.gray4)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                        .foregroundColor(Color.white)
                    }
                    NavigationLink(destination: ResultView()) {
                        Text("Result")
                    }
                    Button(action:{
                        self.showingSheet = true
                    }){
                        HStack{
                            Text("\(months[self.selectedMonths])")
                           
                            Image(systemName: "chevron.down")
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                        .foregroundColor(Color.gray)
                        
                    }
                    
                }
                .padding(.top, 25)
            
                ScrollView(){
                    VStack(alignment: .leading){
                        if self.quickview == true {
                            Text("Quick View")
                                .padding()
                            Text(milestone[self.selectedMonths].content)
                            .padding()
                            
                        }else {
                            Text("Tips")
                                .padding()
                            Text(tips[self.selectedMonths].content)
                            .padding()
                        }
                    }
                }
                .padding(20)
                .background(Color.black.opacity(0.04))
                .cornerRadius(20)
                .padding(.bottom)
                }
               .actionSheet(isPresented: $showingSheet) {
                   ActionSheet(title: Text("Ganti bulan"), message: Text("Pilih bulan untuk dapatkan tips yang sesuai"),
                               buttons: self.buttonsArray as! [ActionSheet.Button])
               }
           
        }.onAppear{
            self.loadArray()
        }
         .navigationBarTitle("Help")
    }
    func loadArray(){
        // MARK : setup button action sheet
        for i in 0..<self.months.count{
            let button: ActionSheet.Button = .default(Text(self.self.months[i]), action: {
//                Text("\(self.months[i])")
                self.selectedMonths = i
            })
            self.buttonsArray[i] =  button
        }
        let buttonCancel: ActionSheet.Button = .cancel()
        self.buttonsArray[self.months.count] =  buttonCancel
        
    }
   
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
