//
//  AppSidebarNavigation.swift
//  LovelyPlace
//
//  Created by Mark Le on 7/5/20.
//

import SwiftUI

struct AppSidebarNavigation: View {
    @ObservedObject var settingInfo: DataController
//    var sideBar: some View {
//        List {
//            NavigationLink(destination: TimelineMenu(), tag: TabIdentifier.timeline, selection: $settingInfo.currentSideBarPage){
//                Label("Timeline", systemImage: "calendar")
//            }
//            
//            NavigationLink(destination: DayCountView(settingInfo: settingInfo), tag: TabIdentifier.daycounter, selection: $settingInfo.currentSideBarPage){
//                Label("Day Counter", systemImage: "calendar.badge.clock")
//            }
//            
//            NavigationLink(destination: SettingView(settingInfo: settingInfo), tag: TabIdentifier.settings, selection: $settingInfo.currentSideBarPage){
//                Label("Setting", systemImage: "circles.hexagongrid")
//            }
//            
//            .navigationTitle("LovelyPlace")
//        }
//        .listStyle(SidebarListStyle())
//        .onOpenURL{ url in
//            //guard let tabIdentifier = url.tabIdentifier else {return}
//            //activeTab = [tabIdentifier]
//        }
//    }
    var body: some View {
        NavigationSplitView {
            List(selection: $settingInfo.currentSideBarPage) {
                
                NavigationLink(value: TabIdentifier.timeline) {
                    Label("Timeline", systemImage: "calendar")
                }
                NavigationLink(value: TabIdentifier.daycounter) {
                    Label("Day Counter", systemImage: "calendar.badge.clock")
                }
                NavigationLink(value: TabIdentifier.settings) {
                    Label("Setting", systemImage: "circles.hexagongrid")
                }
            }
            .navigationTitle("LovelyPlace")
            .onOpenURL{ url in
                //guard let tabIdentifier = url.tabIdentifier else {return}
                //activeTab = [tabIdentifier]
            }
            Text("Hello, Welcome Back")
            
        } detail: {
            NavigationStack {
                switch settingInfo.currentSideBarPage {
                case .timeline: TimelineMenu()
                case .daycounter: DayCountView(settingInfo: settingInfo)
                case .settings: SettingView(settingInfo: settingInfo)
                default: TimelineMenu()
                }
            }
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation(settingInfo: DataController())
    }
}
