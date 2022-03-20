//
//  AppDelegate.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // setting root ViewController
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = setRootViewController()
        window.makeKeyAndVisible()

        self.window = window

        return true
    }

}

extension AppDelegate{
    
    func setRootViewController() -> UIViewController{
        let rootViewController = NewsViewController()
        let navigationController = BaseNavigationController(rootViewController: rootViewController)
        return navigationController
    }
    
}

