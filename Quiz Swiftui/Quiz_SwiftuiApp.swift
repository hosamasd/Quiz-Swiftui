//
//  Quiz_SwiftuiApp.swift
//  Quiz Swiftui
//
//  Created by Hossam on 11/29/20.
//

import SwiftUI
import Firebase

@main
struct Quiz_SwiftuiApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/// initalizng firebase...

class AppDelegate: NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
