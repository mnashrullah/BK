//
//  HomeView.swift
//  BK
//
//  Created by Muhammad Nashrullah on 19/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var show = false
    private let initialLaunchKey = "isInitialLaunch"
    @Environment(\.colorScheme) var colorScheme
    @State var selected = 0
    init(){
        //setup tabbar color
//        UITableView.appearance().tableFooterView = UIView()
//        UITableView.appearance().separatorStyle = .none
//        UITabBar.appearance().backgroundColor = UIColor(named: "bg")
        UITabBar.appearance().backgroundColor = colorScheme == .dark ?  UIColor(named: "Color3"): UIColor(named: "bg")
              
//        UITabBar.appearance().backgroundColor = UIColor.red
        
//        UITabBar.appearance().backgroundColor = UIColor.colorTabbar

    }
    
    
    var body: some View {
        VStack {
            // MARK: Onboarding check
            if show || UserDefaults.standard.bool(forKey: initialLaunchKey){
                // MARK: TabView show
                TabView (selection: $selected) {
                    ChildView().tabItem({
                        Image(systemName: Constants.TabBarImageName.tabBar0)
                            .font(.body)
                        Text("\(Constants.TabBarText.tabBar0)")
                    }).tag(0)
                    
                    TipsView().tabItem({
                        Image(systemName: Constants.TabBarImageName.tabBar1)
                            .font(.body)
                        Text("\(Constants.TabBarText.tabBar1)")
                    }).tag(1)                    
                }
                .accentColor(colorScheme == .dark ?  Color.white: Color("text"))
                        
                    
            }
            else{
                // MARK: Onboarding process
                PageViewContainer( viewControllers: Page.getAll.map({  UIHostingController(rootView: PageView(page: $0) ) }), presentSignupView: {
                    withAnimation {
                        self.show = true
                    }
                    UserDefaults.standard.set(true, forKey: self.initialLaunchKey)
                }).transition(.scale)
            }
        }.onAppear(){
            UserDefaults.standard.setValue(2, forKey: "month")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
