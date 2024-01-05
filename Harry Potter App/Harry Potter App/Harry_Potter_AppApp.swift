//
//  Harry_Potter_AppApp.swift
//  Harry Potter App
//
//  Created by user240559 on 17/11/23.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct Harry_Potter_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            coordinator.makeEntryView()
                .environmentObject(coordinator)
        }
    }
}

