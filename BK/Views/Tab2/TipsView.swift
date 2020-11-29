//
//  TipsView.swift
//  mila
//
//  Created by Muhammad Nashrullah on 24/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI
struct Result: Identifiable {
    var id = UUID()
    var score: Int
}
extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}
struct NavigationBarModifier: ViewModifier {
        
    var backgroundColor: UIColor?
    
    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = UIColor(named: "bg")
        coloredAppearance.titleTextAttributes = [.foregroundColor:  UIColor(named: "text") ?? UIColor.black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor:  UIColor(named: "text") ?? UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = UIColor(named: "text")
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

struct TipsView: View {
//
//    var miles: [Mile] = mileData
//    var mile: Mile?
//    var months = ["2 Bulan", "4 Bulan", "9 Bulan", "12 Bulan", "18 Bulan", "2 Tahun", "3 Tahun", "4 Tahun", "5 Tahun" ]
    @State var isActive: Int = 0
    @State private var selectedMonths = 0
    private let columns = 2
    @State var showingDetail = false
//    let results = [Result(score: 8), Result(score: 5), Result(score: 10)]
//    var tips: [Tips]
    //    init(){
    //
    //    }
    
//    init() {
//        tips = Tips.getAll
        //Use this if NavigationBarTitle is with Large Font
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
//    }
    
    @State private var selectedSegmented = 0
    var segmentedValue = ["Milestone", "Tips"]
    
    @ObservedObject var observableContent = ObservableContent()
    @ObservedObject var observableTips = ObservableTips()
    @EnvironmentObject var userData: UserData
    
    var body: some View {
//        ZStack{
//            //            Text("love")
//            //
//            //        }.background(Color.red)
//            Color("bg").edgesIgnoringSafeArea(.all)
        makeGrid()
//        ZStack {
//            Color.red.edgesIgnoringSafeArea(.all)
//            NavigationView {
//                Text("Example")
//            }
//
//            .navigationBarTitle("title")
//            .navigationBarColor(.red)
//        }
        
        
//            NavigationView {
//                ScrollView {
//                    Text("Don't use .appearance()!")
//                        .onAppear(){
//                            print(Color.primary)
//                    }
//                }
//                .navigationBarTitle("Try it!", displayMode: .inline)
//                .background(NavigationConfigurator { nc in
//                    nc.navigationBar.barTintColor = UIColor(hex: "#FA8D62FF")
//                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor(hex: "#F4EADEFF")]
//                })
//            }
//            .navigationViewStyle(StackNavigationViewStyle())
//        }
//        VStack {
//            ForEach(tips) { result in
//                VStack{
//                    Text("Result: \(result.month)")
//                    Text("Result: \(result.monthName)")
//
//                }
//            }
//        }
//        VStack {
//            ForEach(0..<tips.count) { i in
//                VStack{
//                    Text("Result: \(self.tips[i].month)")
//                }
//            }
//        }
    }
    
    private func makeGrid() -> some View {
        let count = userData.miles.count
        let rows = count / columns + (count % columns == 0 ? 0 : 1)
        return
            NavigationView{
                //                MARK: Segmented control
                

                //            Color("bg").edgesIgnoringSafeArea(.all)
                ScrollView() {
                    
                    Picker(selection: $selectedSegmented, label: Text("What is your favorite color?")) {
                        ForEach(0..<segmentedValue.count) { index in
                            Text(self.segmentedValue[index]).tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                    ForEach(0..<rows) { row in
                        HStack(alignment: .firstTextBaseline) {
                            ForEach(0..<self.columns) { column -> cardTipsView in
                                let index = row * self.columns + column
                                if index < count {
                                    return cardTipsView(mile: userData.miles[index], isActive: self.isActive, index: index, showingDetail: self.$showingDetail, typeContent: segmentedValue[selectedSegmented])
                                } else {
                                    return cardTipsView(mile: userData.miles[0], isActive: self.isActive, index:99 , showingDetail: self.$showingDetail, typeContent: segmentedValue[selectedSegmented])
                                }
                            }
                        }
                    }
                }
                    
                .navigationBarTitle(Text("Tips"), displayMode: .inline)
                .background(Color("bg"))
                .navigationBarHidden(false)
                .onAppear(){
                }
                Spacer()
                    
                
        }
    }
}
//}
struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}


struct cardTipsView: View{
    var mile: Mile
    var activeColor = Color("Color3")
    var notActiveColor = Color("Color3")
    var activeText = Color("text")
    var notActiveText = Color("text")
    var activeOpacity = 1
    var notActiveOpacity = 0.2
//    var monthName: String
    var image = Image("baby")
    var isActive: Int
    var index: Int
    @Binding var showingDetail: Bool
    let defaults = UserDefaults.standard
    
    //    segmented
    @State private var favoriteColor = 0
    var colors = ["Red", "Green", "Blue"]
    var typeContent: String
    @State var month = 0
    
    
    var body: some View{
        VStack(alignment: .leading) {
            if (index == 99){
                HStack {
                    VStack(alignment: .leading) {
                        Text("")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(100)
                    Spacer()
                }
                .padding([.top,.horizontal])
                
            }
            else{
                //                MARK: -BUTTON modal
                Button(action:{
                    self.showingDetail.toggle()
                    UserDefaults.standard.set(self.mile.month, forKey: "month")
                    self.month = mile.month
                    print("tipsview button ditekan \(month) \(index)")
                }){
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(String(mile.month)) Bulan")
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(activeText)
                                .padding(10)
                        }
                        .background(activeColor.frame(width:500))
                        .offset(y:35)
                            
                        .layoutPriority(100)
                        Spacer()
                    }
                    .background(image.resizable().scaledToFill())
                        
                    .frame(height:Constants.mSize.height/8)
                        
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(activeColor, lineWidth: 2)
                    )
                        .padding([.top,.horizontal])
                }
                .buttonStyle(PlainButtonStyle())
//                .opacity(self.isActive == self.index ? 1 : 0.8)
                    
                .sheet(isPresented: $showingDetail) {
                    //                    MARK: -modal/sheet tips
                    TipsDetailView(mile: mile, type:  typeContent)
                    
                }
                
                //                MARK: -navigation
                //                                NavigationLink(destination: TipsDetailView(item: description)){
                //                                    HStack {
                //                                        VStack(alignment: .leading) {
                //
                //                                            Text(description.monthName)
                //                                                .font(.body)
                //                                                .foregroundColor(self.isActive == self.index ? activeText : notActiveText)
                //                                                .padding(10)
                //                                        }
                //                                        .background(self.isActive == self.index ? activeColor.frame(width:500): notActiveColor.frame(width:500))
                //                                        .offset(y:35)
                //
                //                                        .layoutPriority(100)
                //                                        Spacer()
                //                                    }
                //                                    .background(image.resizable().scaledToFill())
                //
                //                                    .frame(height:Constants.mSize.height/8)
                //
                //                                    .cornerRadius(10)
                //                                    .overlay(RoundedRectangle(cornerRadius: 10)
                //                                    .stroke(self.isActive == self.index ? activeColor : Color(.sRGB, red: 255/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 2)
                //                                    )
                //                                        .padding([.top,.horizontal])
                //                                }
                //                                .buttonStyle(PlainButtonStyle())
                
            }
        }
    }
}





struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
    
}
