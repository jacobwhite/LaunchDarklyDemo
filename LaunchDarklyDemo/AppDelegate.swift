//
//  AppDelegate.swift
//  LaunchDarklyDemo
//
//  Created by Jacob White on 3/26/21.
//

import UIKit
import LaunchDarkly
#warning("don't publish API keys to public github repos")
private let mobileKey = "mob-a279b86b-785e-4c7f-bdfc-680fa07c8368"

private func setUpLDClient() {
    let user = LDUser(key: "test@email.com")

    let config = LDConfig(mobileKey: mobileKey)
    LDClient.start(config: config, user: user)
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setUpLDClient()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

