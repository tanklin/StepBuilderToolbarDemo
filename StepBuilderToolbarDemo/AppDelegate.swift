//
//  AppDelegate.swift
//  StepBuilderToolbarDemo
//
//  Created by Tank Lin on 2019/1/23.
//  Copyright © 2019 Tank Lin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let loginVC = LoginViewController()
        let baseNavigationController = UINavigationController(rootViewController: loginVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = baseNavigationController
        window?.makeKeyAndVisible()
        
        return true
    }


}

