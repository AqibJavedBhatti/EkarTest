//
//  AppDelegate.swift
//  EkarTest
//
//  Created by Aqib Javed on 24/10/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let window = window{
            navigateToViewMap(window: window)
        }
        else {
            window = UIWindow()
            navigateToViewMap(window: window!)
        }

        return true
    }

    private func navigateToViewMap(window: UIWindow) {
        let viewMap = ViewMap()
        let navigation = UINavigationController(rootViewController: viewMap)
        navigation.navigationBar.isHidden = true
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }

}

