//
//  AppTabNavigation.swift
//  LovelyPlace
//
//  Created by Mark Le on 7/5/20.
//

import SwiftUI

struct AppTabNavigation: View {
    @ObservedObject var settingInfo: DataController
    
    var body: some View {
        TabView(selection: $settingInfo.currentSideBarPage.unwrapBinding(TabIdentifier.timeline)){
            NavigationView {
                TimelineView()
            }
                .tabItem { Label("Timeline", systemImage: "calendar") }
                .tag(TabIdentifier.timeline)
            DayCountView(settingInfo: settingInfo)
                .tabItem { Label("Day Counter", systemImage: "calendar.badge.clock") }
                .tag(TabIdentifier.daycounter)
            NavigationView {
                SettingView(settingInfo: settingInfo)
            }
                .tabItem { Label("Setting", systemImage: "circles.hexagongrid") }
                .tag(TabIdentifier.settings)
        }
        .onOpenURL{ url in
            guard let tabIdentifier = url.tabIdentifier else {return}
            //activeTab = tabIdentifier
        }
    }
}


struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation(settingInfo: DataController())
    }
}
