//
//  LovelyPlaceApp.swift
//  LovelyPlaceWatch Extension
//
//  Created by Mark Le on 11/3/20.
//

import SwiftUI

@main
struct LovelyPlaceApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
