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
    @State var selected = 0
    init(){
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITabBar.appearance().backgroundColor = UIColor(named: "Color4")

    }
    
    
    var body: some View {
        VStack {
            // MARK: Onboarding check
            if show || UserDefaults.standard.bool(forKey: initialLaunchKey){
                // MARK: TabView show
                TabView (selection: $selected) {
                    PageHomeView().tabItem({
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
            .accentColor(Color("text"))
                        
                    
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
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
