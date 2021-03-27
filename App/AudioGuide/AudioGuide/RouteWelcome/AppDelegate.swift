//
//  AppDelegate.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 27.03.2021.
//

import UIKit
import NMAKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

let credentials = (
                  appId: "v6mF9RinlQEUA8F1Aasz",
                  appCode: "hxcXikkyoJkFzfhoTukwJw",
                  licenseKey: "M/A7qvSX4Z69XCCr9KSaxLVdne4pnJNjFiyxiiG5Eeb3GnMUhk9Gsihx4VqyIM5NX/7UzgbZQXikPwCTJ1RZmHOvI9cdOMMTovAiH9tZXmqqutLA77la14/G7/swRKZ2KDoLN2cmGTwHcLS/4VIyGaMSj2kHC7P6CkROMJsgbcF4AUWBAvcuAEEH7RvgdScDyIu1/HURjQT7MNWHwe9LlLjIFHRy6u/jIuvK3oAPYtX0IQd1HSA6TqNMdY/tZfXC1tJjNlTu444o6GR4PtfYM7kJhhyL9T6GLdO7AfY04PnPAah6Cok32Jq+fiYc+Y0irA66NQwnjQN7IqwsX9qbR6MqcAwq7oI3YCwMsWAO4x6JjrolGG5JMPeQ+gSj9e9FRxeAruUeij3QEWGodobFdBYfpSAbusUY9dqh7da0ZZB79OqRFIBQ/tHKGnPDeEDv00xJNVAYAhTJ4lYl0CyoAufcOpbh2/TXSi0bC7Nx6u6nswTqwnOJm+9IQO8pYw71zqpSNodrOFBO2LB8jq8ZNkBH+SI+bNK7hpyWZgfJpiRhos5lfTlg29NCOkRUUSXMxoTV5QyfDASQddL1HjAQ8ltWbzUHYXagM0BWlj6z9bbzOIdLZftb2mjhkC6FPHkEu2gGZLTjzMx2sZMX+seocJtG9tkyTe3AKLXBXB62NPY="
              )


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        NMAApplicationContext.setAppId(credentials.appId,
                                       appCode: credentials.appCode,
                                       licenseKey: credentials.licenseKey)
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

