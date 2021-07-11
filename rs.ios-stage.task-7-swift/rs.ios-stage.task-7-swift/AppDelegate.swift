//
//  AppDelegate.swift
//  rs.ios-stage.task-7-swift
//
//  Created by Andrew Pokachailo on 7/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = RSViewController(nibName: "RSViewController", bundle: nil)
        window.rootViewController = rootVC
        
        self.window = window
        self.window?.makeKeyAndVisible()
        
        return true
    }

    


}

