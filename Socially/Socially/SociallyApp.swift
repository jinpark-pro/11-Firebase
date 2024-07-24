//
//  SociallyApp.swift
//  Socially
//
//  Created by Jungjin Park on 2024-07-23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SociallyApp: App {
    @StateObject var authModel = AuthViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            TabView {
                if authModel.user != nil {
                    FeedView()
                        .tabItem {
                            Image(systemName: "text.bubble")
                            Text("Feed")
                        }
                }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Account")
                    }
            }
            .environmentObject(authModel)
            .environmentObject(PostViewModel())
        }
    }
}
