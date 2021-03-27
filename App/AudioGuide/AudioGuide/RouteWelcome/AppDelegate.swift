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
                  licenseKey: "jZxwbU7U4gRlwVgAMV3V0A+nAO+gcFuSePxyf1HNFZnJWqJ7bLGw0vydDtpwLp7ZuoxYtDdQgxn40KIZuaSaG5BMtaIOZC6Qi15ZqtTPYKeM3vSItSN0ovgmGz3Cd35BzAwaqwMeaOS/c3bBN6o425Rdr7Fo7L/TCrCvCSe0NAwvEEsDRhKSFTTnuZFmmYiM3fKwp4cJiFlGvetuI/UGwBrHWfnInRlMmV7aMBZXpuADJQ7PXnY2Mt3sBKaz0blHryBQFZjUVgysvbYiYL8TnAgGPpFqVK85DbaEHNOU309kXuNtCaSITWE2mmWcZ9sfTru8xS3i+3Pw1c6MQlFNdWJ+yb32w48c2TaHTN1d/8M5CY5pYuZoQLkDPYbDjs0BpN6P/sL8KDcyvCl6Totkdehouze+EIe7C3tc1IQax8NVYbmOwpgbejnLwRl3D3b8nETtwvBPNjPwQ2KtvMB1acwL9hZ6bEjQSaw6vc+mzD6LhtXU2Ao+twHOTcqat5iI6eq4Gm9FnbHYbvGfpw+RWEghevkCi2MKaUgxyzr0mfsVdkJYCPUcdY3rBZ21dNvLZVVnt0QO0Cz3k0CL+W+9XTWaawivE6pA7wmIxJkYk8mHC0yowhNoOcuXo3S60UWGyiN/x0ZhdAV1yG1+w7rpGMIhBzPUFFf/qJaplJHB45k="
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

