//
//  AppDelegate.swift
//  Agenda
//
//  Created by Rudd Fawcett on 10/16/15.
//  Copyright © 2015 Phillips Academy Launch Pad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().barTintColor = UIColor(red:0.19, green:0.6, blue:0.87, alpha:1)
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.whiteColor()
        ]
        
        let navigationController = UINavigationController(rootViewController: AgendaViewController())
        
        self.window?.rootViewController = navigationController
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

