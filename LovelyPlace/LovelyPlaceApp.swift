//
//  LovelyPlaceApp.swift
//  LovelyPlace
//
//  Created by Mark Le on 7/5/20.
//

import SwiftUI

@main
struct LovelyPlaceApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var settingInfo = UserData()
    var body: some Scene {
        WindowGroup {
            ContentView(settingInfo: settingInfo)
                .sheet(isPresented: $settingInfo.info.isFirstTime){
                    SplashScreenView()
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
