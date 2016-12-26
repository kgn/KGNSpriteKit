//
//  AppDelegate.swift
//  Example
//
//  Created by David Keegan on 12/26/16.
//  Copyright © 2016 David Keegan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
//        if let viewController = self.window?.rootViewController as? ViewController {
//            viewController.shaderView.pause = false
//        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
//        if let homeViewController = self.window?.rootViewController as? ViewController {
//            viewController.shaderView.pause = true
//        }
    }


}

