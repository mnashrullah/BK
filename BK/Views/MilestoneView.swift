//
//  MilestoneView.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct MilestoneView: View {
    
    
    //    print(miles.firstIndex(where: { $0.month == 4 })!)
    //    MARK: data milestone
    
    //    @EnvironmentObject var userData: UserData
    //    var mile: Mile
    //    var mileIndex: Int{
    //        userData.miles.firstIndex(where: { $0.month ==
    //            UserDefaults.standard.integer(forKey: "month")
    //        })!
    //    }
    
    //    var mile: Mile = mileData[mileData.firstIndex(where: { $0.month ==
    //        UserDefaults.standard.integer(forKey: "month")
    //    })!]
    //    var mile: Mile = mileData[UserDefaults.standard.integer(forKey: "month")]
    //    var month: Int = UserDefaults.standard.integer(forKey: "month")
    
    
    
    @Binding var isNavigationBarHidden: Bool
    
    var names = "Axel"
    var ages = "3 Tahun 4 Bulan"
    var mileTracks = MilestoneTrack.getAll
    
    var mCategory = ["Semua","Motorik","Sosial","Bahasa","Kognitif"]
    @State var categorySelected = 0
    
    @State var mileCheck: Bool = false
    //
    //        init(){
    //            mile = mileData[UserDefaults.standard.integer(forKey: "month")]
    //            UIScrollView.appearance().backgroundColor = UIColor(named: "Color4")
    //        }
    @State var limitedText = true
    
    @ObservedObject var observableContent = ObservableContent()
    var mWidth: Int = Int(UIScreen.main.bounds.width)
    @EnvironmentObject var mUserData: UserData
    
    
    var body: some View {
        
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
                NavigationLink(destination: SummaryView(isNavigationBarHidden: $isNavigationBarHidden)){
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
                        .frame(width: CGFloat(mWidth-36), height: 20)
                        .foregroundColor(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.9383720756, green: 0.8294705153, blue: 0.7069537044, alpha: 1)), lineWidth: 2)
                        )
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: CGFloat(Double(observableContent.numberAllItemCompleted)/Double(observableContent.numberAllItem)*Double(mWidth-45))
                               
                               , height: 14).foregroundColor(Color("Color3"))
                        .padding(.leading, 4)
                }
                HStack{
                    Text("\(String(observableContent.numberAllItemCompleted)) dari \(String(observableContent.numberAllItem)) tanda terpenuhi")
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
            
            
            if (self.mCategory[self.categorySelected] == self.mCategory[0] ){
                ForEach(observableContent.data){ mileTrack in
                    Button(action:{
                        observableContent.updateComplete(id: mileTrack.idMilestone, isComplete: !mileTrack.isComplete)
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
                                    Image(systemName: mileTrack.isComplete ? "checkmark.square" : "square").foregroundColor(Color("Color5"))
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        //                    .onTapGesture(){
                        //                        print(mileTrack.idMilestone)
                        //                    }
                        .background(Color("Color3"))
                        .cornerRadius(10)
                    }.buttonStyle(PlainButtonStyle())
                }
                .padding([.trailing,.leading])
            } else{
                ForEach(observableContent.data){ mileTrack in
                    if (mileTrack.category == self.mCategory[self.categorySelected]){
                        Button(action:{
                            observableContent.updateComplete(id: mileTrack.idMilestone, isComplete: !mileTrack.isComplete)
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
                                        Image(systemName: mileTrack.isComplete ? "checkmark.square" : "square").foregroundColor(Color("Color5"))
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
            }
            Spacer()
            
            
            
            //                ForEach(observableContent.data[0]){ mileTrack in
            //                    HStack {
            //                        VStack(alignment: .leading) {
            //                            Text(mileTrack.name)
            //                                .font(.body)
            //                                .foregroundColor(.primary)
            //                                .fixedSize(horizontal: false, vertical: true)
            //                            HStack {
            //                                Image(mileTrack.category.rawValue)
            //                                Text(mileTrack.category.rawValue.capitalized)
            //                                    .font(.caption)
            //                                    .foregroundColor(.secondary)
            //                                Spacer()
            //                                Button(action: {(
            //                                    //                                        mileTrack.isComplete
            //                                    )},
            //                                       label: {
            //                                        Image(systemName: mileTrack.isComplete ? "checkmark.square" : "square").foregroundColor(Color("Color5"))
            //                                })
            //                            }
            //                        }
            //                        .padding()
            //                        .background(Color.white)
            //                        .cornerRadius(10)
            //                    }
            //                    .background(Color("Color3"))
            //                    .cornerRadius(10)
            //                }
            //                .padding([.trailing,.leading])
            //            }else{
            //
            ////                ForEach(userData.miles[mileIndex].milestone.filter{$0.category.rawValue == mCategory[categorySelected]}){ mileTrack in
            ////                    HStack {
            //                ForEach(observableContent.data[0]){ mileTrack in
            //                    HStack {
            //                        VStack(alignment: .leading) {
            //                            Text(mileTrack.name)
            //                                .font(.body)
            //                                .foregroundColor(.primary)
            //                                .fixedSize(horizontal: false, vertical: true)
            //                            HStack {
            //                                Image(mileTrack.category.rawValue)
            //                                Text(mileTrack.category.rawValue.capitalized)
            //                                    .font(.caption)
            //                                    .foregroundColor(.secondary)
            //                                Spacer()
            //                                Button(action: {(
            //                                    //                                        mileTrack.isComplete
            //                                    )},
            //                                       label: {
            //                                        Image(systemName: mileTrack.isComplete ? "checkmark.square" : "square").foregroundColor(Color("Color5"))
            //                                })
            //                            }
            //                        }
            //                        .padding()
            //                        .background(Color.white)
            //                        .cornerRadius(10)
            //                    }
            //                    .background(Color("Color3"))
            //                    .cornerRadius(10)
            //                }
            //                .padding([.trailing,.leading])
            //            }
            
            //         MARK: LIST CHECKLIST MILESTONE BY HILMY
            //            ForEach(mileTracks){ mileTrack in
            //                HStack {
            //                    VStack(alignment: .leading) {
            //                        Text(mileTrack.title)
            //                            .font(.body)
            //                            .foregroundColor(.primary)
            //                            .fixedSize(horizontal: false, vertical: true)
            //                        HStack {
            //                            Image(mileTrack.category)
            //                            Text(mileTrack.category.capitalized)
            //                                .font(.caption)
            //                                .foregroundColor(.secondary)
            //                            Spacer()
            //                            Button(action: {(
            //                                //                                        mileTrack.isComplete
            //                                )},
            //                                   label: {
            //                                    Image(systemName: mileTrack.isComplete ? "checkmark.square" : "square").foregroundColor(Color("Color5"))
            //                            })
            //                        }
            //                    }
            //                    .padding()
            //                    .background(Color.white)
            //                    .cornerRadius(10)
            //                }
            //                .background(Color("Color3"))
            //                .cornerRadius(10)
            //            }
            //            .padding([.trailing,.leading])
        }
        //        .navigationBarTitle(Text(mUserData.myChild?.name ?? "").foregroundColor(Color("Color3")), displayMode: .inline)
        //        .navigationBarItems(trailing:
        //                                Text(mUserData.myChild != nil ?
        //                                        calcAge(birthday: mUserData.myChild!.birthDate) : "")
        //                                .foregroundColor(Color("Color5")))
        .background(Color("bg"))
        .onAppear(){
//            print("nashdata")
            //            print(mUserData.myChild)
            //            print(mUserData.myChild?.birthDate)
            //            if (mUserData.myChild != nil){
            //                print("old")
            //                print(calcAge(birthday: mUserData.myChild!.birthDate))
            
        }
        //            print(miles[0])
        //            print(UserDefaults.standard.integer(forKey: "month"))
        //            print(miles.filter { $0.month == month })
        //            print(miles.filter { $0.month == month })
        //            print(miles)
        //            self.mile =  miles.filter { $0.month == month }
        //            print(mile)
        //            print(miles.firstIndex(where: { $0.month == 4 })!)
        
        //            print(miles.firstIndex(of: $0.month == month))
        //            print(miles.map({ (<#Mile#>) -> T in
        //                miles[0]
        //            }))
        //            var myList = [1, 2, 3, 4]
        //            var filtered = myList.filter { $0 == 3 }
        
        // returns the index position of 3 or nil if not found)
        //            let arr = ["a","b","c","a"]
        //
        //            let indexOfA = arr.firstIndex(of: "a") // 0
        //            let indexOfB = arr.lastIndex(of: "a") // 3
        //
        //            let mile: Mile
        //            mile = miles.filter { $0.month == month })
        //            print(mile)
        //        }
        
        
        
        
    }
    func calcAge(birthday: Date) -> String {
        //        let dateFormater = DateFormatter()
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        //        let birthdayDate = dateFormater.date(from: birthday)
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
        } else {
            result = ""
        }
        
        
        return result
    }
    //default
    //    func calcAge(birthday: String) -> Int {
    //        let dateFormater = DateFormatter()
    //        dateFormater.dateFormat = "MM/dd/yyyy"
    //        let birthdayDate = dateFormater.date(from: birthday)
    //        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
    //        let now = Date()
    //        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
    //        let age = calcAge.year
    //        return age!
    //    }
}



struct MilestoneView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        MilestoneView(isNavigationBarHidden: .constant(false))
    //
    //    }
    static var previews: some View {
        let userData = UserData()
        return MilestoneView(isNavigationBarHidden: .constant(false))
            .environmentObject(userData)
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
