//
//  CountDownApp.swift
//  CountDown WatchKit Extension
//
//  Created by JC Castagne on 2022-02-22.
//

import SwiftUI

@main
struct CountDownApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
