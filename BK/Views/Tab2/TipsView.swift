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
        coloredAppearance.titleTextAttributes = [.foregroundColor:  UIColor(named: "text")]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor:  UIColor(named: "text")]
        
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
    var months = ["2 Bulan", "4 Bulan", "9 Bulan", "12 Bulan", "18 Bulan", "2 Tahun", "3 Tahun", "4 Tahun", "5 Tahun" ]
    @State var isActive: Int = 1
    @State private var selectedMonths = 0
    private let columns = 2
    @State var showingDetail = false
    let results = [Result(score: 8), Result(score: 5), Result(score: 10)]
    var tips: [Tips]
    //    init(){
    //
    //    }
    
    init() {
        tips = Tips.getAll
        //Use this if NavigationBarTitle is with Large Font
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
//            .background(Color("Color4"))
//            .navigationBarColor(UIColor(named: "Color4"))
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "Color7")
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "Color8")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    @State private var selectedSegmented = 0
    var segmentedValue = ["Ringkasan", "Tips"]
    
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
        let count = tips.count
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
                    Text("Tips adalah informasi berisi saran yang dilakukan orang tua untuk merangsang tumbuh kembang yang ideal terpenuhi pada anak anda.")
                        .padding(.horizontal)
                        .font(Font.custom("SFPD-reg", size: 13))
                    //font sf pro display
                    ForEach(0..<rows) { row in
                        HStack(alignment: .firstTextBaseline) {
                            ForEach(0..<self.columns) { column -> cardTipsView in
                                let index = row * self.columns + column
                                if index < count {
                                    return cardTipsView(description: self.tips[index], isActive: self.isActive, index: index, showingDetail: self.$showingDetail)
                                } else {
                                    return cardTipsView(description: self.tips[0], isActive: self.isActive, index:99 , showingDetail: self.$showingDetail)
                                    
                                }
                                
                                
                            }
                        }
                    }
                }
                    
                .navigationBarTitle(Text("Informasi"))

                .background(Color("Color4"))
                .navigationBarColor(UIColor(named: "Color4"))
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
    var activeColor = Color("Color7")
    var notActiveColor = Color("Color7")
    var activeText = Color.black
    var notActiveText = Color.black
    var activeOpacity = 1
    var notActiveOpacity = 0.2
    var description: Tips
    var image = Image("baby")
    var isActive: Int
    var index: Int
    @Binding var showingDetail: Bool
    let defaults = UserDefaults.standard
    
    //    segmented
    @State private var favoriteColor = 0
    var colors = ["Red", "Green", "Blue"]
    
    
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
                    UserDefaults.standard.set(self.index, forKey: "month")
                }){
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(description.monthName)
                                .font(.body)
                                .foregroundColor(self.isActive == self.index ? activeText : notActiveText)
                                .padding(10)
                        }
                        .background(self.isActive == self.index ? activeColor.frame(width:500): notActiveColor.frame(width:500))
                        .offset(y:35)
                            
                        .layoutPriority(100)
                        Spacer()
                    }
                    .background(image.resizable().scaledToFill())
                        
                    .frame(height:Constants.mSize.height/8)
                        
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(self.isActive == self.index ? activeColor : Color(.sRGB, red: 255/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 2)
                    )
                        .padding([.top,.horizontal])
                }
                .buttonStyle(PlainButtonStyle())
                    
                .sheet(isPresented: $showingDetail) {
                    //                    MARK: -modal/sheet tips
                    TipsDetailView()
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
