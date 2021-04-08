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
        NavigationView {
            List {
                NavigationLink(destination: TimelineMenu(), tag: TabIdentifier.timeline, selection: $settingInfo.currentSideBarPage){
                    Label("Timeline", systemImage: "calendar")
                }
                
                NavigationLink(destination: DayCountView(settingInfo: settingInfo), tag: TabIdentifier.daycounter, selection: $settingInfo.currentSideBarPage){
                    Label("Day Counter", systemImage: "calendar.badge.clock")
                }
                
                NavigationLink(destination: SettingView(settingInfo: settingInfo), tag: TabIdentifier.settings, selection: $settingInfo.currentSideBarPage){
                    Label("Setting", systemImage: "circles.hexagongrid")
                }
                
                
            }
            .navigationTitle("LovelyPlace")
            .listStyle(SidebarListStyle())
            .onOpenURL{ url in
                //guard let tabIdentifier = url.tabIdentifier else {return}
                //activeTab = [tabIdentifier]
            }
            Text("Hello, Welcome Back")
            
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation(settingInfo: DataController())
    }
}
